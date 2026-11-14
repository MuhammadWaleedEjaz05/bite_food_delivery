import 'package:bite_food_delivery/app/routes/app_navigation.dart';
import 'package:bite_food_delivery/core/extensions/responsive_extensions.dart';
import 'package:bite_food_delivery/features/orders/bloc/order_cubit.dart';
import 'package:bite_food_delivery/features/orders/models/order_model.dart';
import 'package:bite_food_delivery/features/orders/widgets/order_history_card.dart';
import 'package:bite_food_delivery/l10n/app_localizations.dart';
import 'package:bite_food_delivery/core/services/firebase/firebase_auth_conn.dart';
import 'package:bite_food_delivery/widgets/app_feedback.dart';
import 'package:bite_food_delivery/widgets/app_staggered_entrance.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OrderHistoryListSection extends StatelessWidget {
  final bool showCompleted;

  const OrderHistoryListSection({super.key, required this.showCompleted});

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context)!;
    final cubit = context.read<OrderCubit>();
    final userId = getCurrentUser()?.uid ?? '';

    return SliverPadding(
      padding: context.contentInsets(bottom: 24),
      sliver: BlocBuilder<OrderCubit, OrderState>(
        builder: (context, state) {
          if (state is OrderLoading) {
            return const SliverToBoxAdapter(child: AppLoadingCard());
          }
          if (state is OrderError) {
            return SliverToBoxAdapter(
              child: AppFeedback(
                message: state.message,
                actionLabel: t.retryAction,
                onAction: () => cubit.loadOrderHistory(userId),
              ),
            );
          }
          if (state is OrderHistoryLoaded) {
            final filtered = state.orders.where((o) {
              final isDone =
                  o.orderStatus == OrderStatus.delivered ||
                  o.orderStatus == OrderStatus.cancelled;
              return showCompleted ? isDone : !isDone;
            }).toList();

            if (filtered.isEmpty) {
              return SliverToBoxAdapter(
                child: AppFeedback(
                  message: showCompleted
                      ? t.noOrdersInHistory
                      : t.noOngoingOrders,
                  icon: Icons.receipt_long_outlined,
                  actionLabel: t.browseRestaurants,
                  onAction: () =>
                      AppNavigation.push(context, '/all_restaurants_screen'),
                ),
              );
            }

            return SliverList.separated(
              itemCount: filtered.length,
              separatorBuilder: (_, _) => 14.verticalSpace,
              itemBuilder: (context, index) {
                final order = filtered[index];
                return AppStaggeredEntrance(
                  index: index,
                  child: OrderHistoryCard(
                    order: order,
                    onTrack: () =>
                        AppNavigation.push(context, '/track_order_screen'),
                    onReorder: () =>
                        cubit.reorderFromHistory(order.orderId, userId),
                    onReview: () => AppNavigation.push(
                      context,
                      '/review_screen',
                      arguments: order,
                    ),
                  ),
                );
              },
            );
          }
          return const SliverToBoxAdapter(child: SizedBox.shrink());
        },
      ),
    );
  }
}
