import 'package:bite_food_delivery/Cubits/OrderCubit/order_cubit.dart';
import 'package:bite_food_delivery/Cubits/UserAuthCubit/user_auth_cubit.dart';
import 'package:bite_food_delivery/GlobalWidgets/bite_app_bar.dart';
import 'package:bite_food_delivery/Models/order_model.dart';
import 'package:bite_food_delivery/Screens/OrderHistoryPage/Widgets/bite_tab_bar.dart';
import 'package:bite_food_delivery/Screens/OrderHistoryPage/Widgets/biteorder_history_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class OrderHistoryScreen extends StatefulWidget {
  const OrderHistoryScreen({super.key});

  @override
  State<OrderHistoryScreen> createState() => _OrderHistoryScreenState();
}

class _OrderHistoryScreenState extends State<OrderHistoryScreen> {
  @override
  void initState() {
    super.initState();
    final userState = context.read<UserAuthCubit>().state;
    if (userState is UserLoggedIn && userState.user.id != null) {
      context.read<OrderCubit>().loadOrderHistory(userState.user.id!);
    }
  }

  @override
  void dispose() {
    context.read<OrderCubit>().stopListeningToOrderHistory();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _AppBarSection(),
      body: BlocListener<OrderCubit, OrderState>(
        listener: (context, state) {
          if (state is ReorderLoaded) {
            Navigator.pushNamed(context, '/cart_screen');
          } else if (state is OrderCancelled) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Order cancelled successfully')),
            );
          }
        },
        child: DefaultTabController(
          length: 2,
          child: Column(
            children: [
              BiteTabBar(),
              Expanded(
                child: BlocBuilder<OrderCubit, OrderState>(
                  builder: (context, state) {
                    if (state is OrderLoading) {
                      return const Center(child: CircularProgressIndicator());
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
                          _EmptyOrderView(message: 'No ongoing orders'),
                          _EmptyOrderView(message: 'No order history'),
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
        'Order History',
        style: GoogleFonts.sen(
          fontSize: Theme.of(context).textTheme.displaySmall!.fontSize,
          fontWeight: Theme.of(context).textTheme.displaySmall!.fontWeight,
          color: Colors.deepOrange,
        ),
      ),
      actions: [],
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
        message: isCompleted ? 'No completed orders yet' : 'No ongoing orders',
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
              color: Colors.grey.shade500,
              fontWeight: FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}
