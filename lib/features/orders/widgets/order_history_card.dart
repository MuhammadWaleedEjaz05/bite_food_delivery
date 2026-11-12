import 'dart:io';
import 'package:bite_food_delivery/app/theme/app_text_styles.dart';
import 'package:bite_food_delivery/core/extensions/price_format.dart';
import 'package:bite_food_delivery/core/extensions/theme_extensions.dart';
import 'package:bite_food_delivery/features/orders/models/order_model.dart';
import 'package:bite_food_delivery/features/restaurants/bloc/restaurants_cubit.dart';
import 'package:bite_food_delivery/l10n/app_localizations.dart';
import 'package:bite_food_delivery/widgets/app_bouncing_tap.dart';
import 'package:bite_food_delivery/widgets/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class OrderHistoryCard extends StatelessWidget {
  final OrderModel order;
  final VoidCallback? onTrack;
  final VoidCallback? onReorder;
  final VoidCallback? onReview;

  const OrderHistoryCard({
    super.key,
    required this.order,
    this.onTrack,
    this.onReorder,
    this.onReview,
  });

  Color _statusColor(BuildContext context, OrderStatus status) {
    final colors = context.appColors;
    switch (status) {
      case OrderStatus.received:
      case OrderStatus.preparing:
        return Colors.orange;
      case OrderStatus.dispatched:
        return colors.primary;
      case OrderStatus.delivered:
        return Colors.green;
      case OrderStatus.cancelled:
        return colors.error;
    }
  }

  String _statusLabel(BuildContext context, OrderStatus status) {
    final t = AppLocalizations.of(context)!;
    switch (status) {
      case OrderStatus.received:
        return t.orderReceived;
      case OrderStatus.preparing:
        return t.preparing;
      case OrderStatus.dispatched:
        return t.dispatched;
      case OrderStatus.delivered:
        return t.delivered;
      case OrderStatus.cancelled:
        return t.cancelled;
    }
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.appColors;
    final t = AppLocalizations.of(context)!;
    final restaurantName = context
        .read<RestaurantsCubit>()
        .getRestaurantNameById(order.restaurantId);
    final statusColor = _statusColor(context, order.orderStatus);
    final isOngoing =
        order.orderStatus != OrderStatus.delivered &&
        order.orderStatus != OrderStatus.cancelled;

    final formattedDate = DateFormat(
      'dd MMM yyyy, hh:mm a',
    ).format(order.orderPlacedAt);

    return Container(
      decoration: BoxDecoration(
        color: colors.surfaceContainerLow,
        borderRadius: BorderRadius.circular(20).r,
        border: Border.all(
          color: colors.outlineVariant.withValues(alpha: 0.6),
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.03),
            blurRadius: 10.r,
            offset: Offset(0, 4.r),
          ),
          if (isOngoing)
            BoxShadow(
              color: statusColor.withValues(alpha: 0.08),
              blurRadius: 12.r,
              offset: Offset(0, 3.r),
            ),
        ],
      ),
      padding: const EdgeInsets.all(16).r,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Wrap(
            alignment: WrapAlignment.spaceBetween,
            crossAxisAlignment: WrapCrossAlignment.start,
            spacing: 8.r,
            runSpacing: 8.r,
            children: [
              ConstrainedBox(
                constraints: BoxConstraints(maxWidth: 0.55.sw),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppText(
                      restaurantName,
                      style: AppTextStyles.titleMedium(context),
                      maxLines: 2,
                    ),
                    4.verticalSpace,
                    AppText(
                      formattedDate,
                      style: AppTextStyles.bodyMedium(
                        context,
                      ).copyWith(color: colors.onSurfaceVariant),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 5,
                ).r,
                decoration: BoxDecoration(
                  color: statusColor.withValues(alpha: 0.12),
                  borderRadius: BorderRadius.circular(10).r,
                  border: Border.all(
                    color: statusColor.withValues(alpha: 0.25),
                    width: 1,
                  ),
                ),
                child: AppText(
                  _statusLabel(context, order.orderStatus),
                  style: AppTextStyles.labelSmall(
                    context,
                  ).copyWith(color: statusColor, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          14.verticalSpace,
          Divider(
            color: colors.outlineVariant.withValues(alpha: 0.5),
            height: 1,
          ),
          14.verticalSpace,
          Wrap(
            alignment: WrapAlignment.spaceBetween,
            runAlignment: WrapAlignment.center,
            crossAxisAlignment: WrapCrossAlignment.center,
            spacing: 12.r,
            runSpacing: 10.r,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  AppText(
                    t.totalPrice,
                    style: AppTextStyles.labelSmall(
                      context,
                    ).copyWith(color: colors.onSurfaceVariant),
                  ),
                  2.verticalSpace,
                  AppText(
                    context.priceLabel(order.totalPrice),
                    style: AppTextStyles.titleMedium(context).copyWith(
                      color: colors.primary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              Wrap(
                spacing: 8.r,
                runSpacing: 8.r,
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  if (isOngoing && onTrack != null)
                    AppBouncingTap(
                      onTap: onTrack,
                      child: FilledButton.tonal(
                        onPressed: onTrack,
                        style: FilledButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 8,
                          ).r,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12).r,
                          ),
                        ),
                        child: AppText(
                          t.trackOrder,
                          style: AppTextStyles.labelLarge(context),
                        ),
                      ),
                    ),
                  if (!isOngoing && onReorder != null)
                    AppBouncingTap(
                      onTap: onReorder,
                      child: OutlinedButton(
                        onPressed: onReorder,
                        style: OutlinedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 14,
                            vertical: 8,
                          ).r,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12).r,
                          ),
                        ),
                        child: AppText(
                          t.reorder,
                          style: AppTextStyles.labelLarge(context),
                        ),
                      ),
                    ),
                  if (!isOngoing && onReview != null)
                    AppBouncingTap(
                      onTap: onReview,
                      child: FilledButton.tonal(
                        onPressed: onReview,
                        style: FilledButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 14,
                            vertical: 8,
                          ).r,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12).r,
                          ),
                        ),
                        child: AppText(
                          t.review,
                          style: AppTextStyles.labelLarge(context),
                        ),
                      ),
                    ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _PulsingStatusDot extends StatefulWidget {
  final Color color;
  const _PulsingStatusDot({required this.color});

  @override
  State<_PulsingStatusDot> createState() => _PulsingStatusDotState();
}

class _PulsingStatusDotState extends State<_PulsingStatusDot>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );
    if (!Platform.environment.containsKey('FLUTTER_TEST')) {
      _controller.repeat(reverse: true);
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        final scale = 0.8 + (_controller.value * 0.4);
        final opacity = 0.5 + (_controller.value * 0.5);
        return Transform.scale(
          scale: scale,
          child: Container(
            width: 7.r,
            height: 7.r,
            decoration: BoxDecoration(
              color: widget.color.withValues(alpha: opacity),
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: widget.color.withValues(alpha: 0.5 * opacity),
                  blurRadius: 4.r,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
