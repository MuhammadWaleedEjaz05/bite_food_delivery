import 'package:bite_food_delivery/app/routes/app_navigation.dart';
import 'package:bite_food_delivery/app/theme/app_text_styles.dart';
import 'package:bite_food_delivery/core/extensions/responsive_extensions.dart';
import 'package:bite_food_delivery/core/extensions/theme_extensions.dart';
import 'package:bite_food_delivery/features/orders/bloc/order_cubit.dart';
import 'package:bite_food_delivery/features/orders/models/order_model.dart';
import 'package:bite_food_delivery/features/restaurants/bloc/restaurants_cubit.dart';
import 'package:bite_food_delivery/l10n/app_localizations.dart';
import 'package:bite_food_delivery/widgets/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TrackOrderStatusSection extends StatelessWidget {
  const TrackOrderStatusSection({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = context.appColors;
    final t = AppLocalizations.of(context)!;
    final order = context.watch<OrderCubit>().activeOrder;

    if (order == null) {
      return SliverPadding(
        padding: context.contentInsets(top: 20, bottom: 20),
        sliver: SliverToBoxAdapter(
          child: Center(
            child: AppText(
              t.noActiveOrder,
              style: AppTextStyles.titleMedium(context),
            ),
          ),
        ),
      );
    }

    final restaurantName = context
        .read<RestaurantsCubit>()
        .getRestaurantNameById(order.restaurantId);

    final isCancelled = order.orderStatus == OrderStatus.cancelled;
    final isDelivered = order.orderStatus == OrderStatus.delivered;

    final statusText = switch (order.orderStatus) {
      OrderStatus.received => t.orderReceived,
      OrderStatus.preparing => t.preparing,
      OrderStatus.dispatched => t.dispatched,
      OrderStatus.delivered => t.delivered,
      OrderStatus.cancelled => t.cancelled,
    };

    final statusColor = isCancelled
        ? colors.error
        : isDelivered
        ? colors.primary
        : colors.primary;

    return SliverPadding(
      padding: context.contentInsets(bottom: 20),
      sliver: SliverToBoxAdapter(
        child: Container(
          padding: const EdgeInsets.all(20).r,
          decoration: BoxDecoration(
            color: colors.surfaceContainerLow,
            borderRadius: BorderRadius.circular(24).r,
            border: Border.all(color: colors.outlineVariant, width: 1),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Wrap(
                alignment: WrapAlignment.spaceBetween,
                crossAxisAlignment: WrapCrossAlignment.center,
                spacing: 8.r,
                runSpacing: 8.r,
                children: [
                  ConstrainedBox(
                    constraints: BoxConstraints(maxWidth: 0.6.sw),
                    child: AppText(
                      restaurantName,
                      style: AppTextStyles.titleLarge(context),
                      maxLines: 2,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 6,
                    ).r,
                    decoration: BoxDecoration(
                      color: statusColor.withValues(alpha: 0.12),
                      borderRadius: BorderRadius.circular(12).r,
                    ),
                    child: AppText(
                      statusText,
                      style: AppTextStyles.labelSmall(context).copyWith(
                        color: statusColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              12.verticalSpace,
              if (isCancelled) ...[
                AppText(
                  t.orderCancelledSuccessfully,
                  style: AppTextStyles.bodyMedium(
                    context,
                  ).copyWith(color: colors.error),
                ),
                12.verticalSpace,
                OutlinedButton.icon(
                  onPressed: () => AppNavigation.push(context, '/faq_screen'),
                  icon: const Icon(Icons.help_outline),
                  label: AppText(
                    t.helpAndSupport,
                    style: AppTextStyles.labelLarge(context),
                  ),
                ),
              ] else if (isDelivered) ...[
                AppText(
                  t.orderDeliveredSuccessfully,
                  style: AppTextStyles.bodyMedium(
                    context,
                  ).copyWith(color: colors.primary),
                ),
              ] else ...[
                Row(
                  children: [
                    Icon(
                      Icons.timer_outlined,
                      size: 20.r,
                      color: colors.primary,
                    ),
                    8.horizontalSpace,
                    Expanded(
                      child: AppText(
                        t.estimatedDeliveryTime('25-35 min'),
                        style: AppTextStyles.titleMedium(context).copyWith(
                          color: colors.primary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
