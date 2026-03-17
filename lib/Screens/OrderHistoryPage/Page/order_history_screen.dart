import 'package:bite_food_delivery/Cubits/OrderCubit/order_cubit.dart';
import 'package:bite_food_delivery/Cubits/UserAuthCubit/user_auth_cubit.dart';
import 'package:bite_food_delivery/GlobalWidgets/bite_app_bar.dart';
import 'package:bite_food_delivery/Models/order_model.dart';
import 'package:bite_food_delivery/Screens/OrderHistoryPage/Widgets/bite_tab_bar.dart';
import 'package:bite_food_delivery/Screens/OrderHistoryPage/Widgets/biteorder_history_card.dart';
import 'package:bite_food_delivery/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class OrderHistoryScreen extends StatelessWidget {
  const OrderHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const _AppBarSection(),
      body: BlocListener<OrderCubit, OrderState>(
        listener: (context, state) {
          if (state is ReorderLoaded) {
            Navigator.pushNamed(context, '/cart_screen');
          } else if (state is OrderCancelled) {
            showTopSnackBar(
              Overlay.of(context),
              CustomSnackBar.success(
                message: S.of(context).orderCancelledSuccessfully,
              ),
            );
          }
        },
        child: DefaultTabController(
          length: 2,
          child: Column(
            children: [
              const BiteTabBar(),
              Expanded(
                child: BlocBuilder<OrderCubit, OrderState>(
                  builder: (context, state) {
                    if (state is OrderLoading) {
                      return Center(
                        child: Lottie.asset(
                          'assets/animations/loading.json',
                          height: 75.h,
                          width: 75.w,
                        ),
                      );
                    }
                    if (state is OrderHistoryLoaded) {
                      final ongoing = state.orders
                          .where(
                            (o) =>
                                o.orderStatus != OrderStatus.delivered &&
                                o.orderStatus != OrderStatus.cancelled,
                          )
                          .toList();
                      final completed = state.orders
                          .where(
                            (o) =>
                                o.orderStatus == OrderStatus.delivered ||
                                o.orderStatus == OrderStatus.cancelled,
                          )
                          .toList();
                      return Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 16.w,
                          vertical: 16.h,
                        ),
                        child: TabBarView(
                          children: [
                            _OrderListView(orders: ongoing, isCompleted: false),
                            _OrderListView(
                              orders: completed,
                              isCompleted: true,
                            ),
                          ],
                        ),
                      );
                    }
                    if (state is OrderError) {
                      return Center(
                        child: Text(
                          state.message,
                          style: Theme.of(context).textTheme.titleSmall!
                              .copyWith(
                                color: Colors.red,
                                fontWeight: FontWeight.normal,
                              ),
                        ),
                      );
                    }
                    return Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 16.w,
                        vertical: 16.h,
                      ),
                      child: TabBarView(
                        children: [
                          _EmptyOrderView(
                            message: S.of(context).noOngoingOrders,
                          ),
                          _EmptyOrderView(
                            message: S.of(context).noOrderHistory,
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _AppBarSection extends StatelessWidget implements PreferredSizeWidget {
  const _AppBarSection();
  @override
  Size get preferredSize => Size.fromHeight(100.h);
  @override
  Widget build(BuildContext context) {
    return BiteAppBar(
      backButton: true,
      title: Text(
        S.of(context).orderHistory,
        style: GoogleFonts.sen(
          fontSize: Theme.of(context).textTheme.displaySmall!.fontSize,
          fontWeight: Theme.of(context).textTheme.displaySmall!.fontWeight,
          color: Theme.of(context).colorScheme.primary,
        ),
      ),
      actions: [
        PopupMenuButton<String>(
          icon: Icon(Icons.more_vert, size: 24.r),
          onSelected: (value) {
            if (value == 'clear_history') {
              final userState = context.read<UserAuthCubit>().state;
              if (userState is! UserLoggedIn || userState.user.id == null) {
                return;
              }
              final userId = userState.user.id!;
              showDialog(
                context: context,
                builder: (ctx) => AlertDialog(
                  title: Text(S.of(context).clearOrderHistory),
                  content: Text(
                    S.of(context).areYouSureYouWantToDeleteAllOrderHistory,
                  ),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(ctx),
                      child: Text(S.of(context).cancel),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pop(ctx);
                        context.read<OrderCubit>().clearOrderHistory(userId);
                      },
                      child: Text(
                        S.of(context).clearAll,
                        style: const TextStyle(color: Colors.red),
                      ),
                    ),
                  ],
                ),
              );
            }
          },
          itemBuilder: (context) => [
            PopupMenuItem(
              value: 'clear_history',
              child: Row(
                children: [
                  Icon(
                    Icons.delete_outline,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    S.of(context).clearOrderHistory,
                    style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      color: Theme.of(context).colorScheme.primary,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _OrderListView extends StatelessWidget {
  final List<OrderModel> orders;
  final bool isCompleted;

  const _OrderListView({required this.orders, required this.isCompleted});

  @override
  Widget build(BuildContext context) {
    if (orders.isEmpty) {
      return _EmptyOrderView(
        message: isCompleted
            ? S.of(context).noCompletedOrdersYet
            : S.of(context).noOngoingOrders,
      );
    }
    return ListView.separated(
      itemCount: orders.length,
      itemBuilder: (context, index) {
        return BiteOrderHistoryCard(
          order: orders[index],
          isCompleted: isCompleted,
        );
      },
      separatorBuilder: (context, index) => 10.verticalSpace,
    );
  }
}

class _EmptyOrderView extends StatelessWidget {
  final String message;
  const _EmptyOrderView({required this.message});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.receipt_long_outlined,
            size: 80.r,
            color: Colors.grey.shade300,
          ),
          16.verticalSpace,
          Text(
            message,
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
              color: Theme.of(context).colorScheme.onSecondary,
              fontWeight: FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}
