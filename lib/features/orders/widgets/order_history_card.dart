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
    final dark = Theme.of(context).brightness == Brightness.dark;
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

    // Pastel card tint inspired by modern food templates
    final pastelBg = dark
        ? (isOngoing ? const Color(0xFF1B281E) : const Color(0xFF1A222C))
        : (isOngoing ? const Color(0xFFDCEFD9) : const Color(0xFFE2EDF8));

    final pastelBorder = dark
        ? (isOngoing ? const Color(0xFF2E4634) : const Color(0xFF283B4C))
        : (isOngoing ? const Color(0xFFBFDEBB) : const Color(0xFFC7DEEF));

    return Container(
      decoration: BoxDecoration(
        color: pastelBg,
        borderRadius: BorderRadius.circular(24).r,
        border: Border.all(color: pastelBorder, width: 1.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: dark ? 0.25 : 0.04),
            blurRadius: 14.r,
            offset: Offset(0, 4.h),
          ),
        ],
      ),
      padding: EdgeInsets.all(16.r),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Top Row: Restaurant icon & name on left, price pill on right
          Wrap(
            alignment: WrapAlignment.spaceBetween,
            crossAxisAlignment: WrapCrossAlignment.center,
            spacing: 8.r,
            runSpacing: 8.r,
            children: [
              ConstrainedBox(
                constraints: BoxConstraints(maxWidth: 0.58.sw),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      padding: EdgeInsets.all(5.r),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.fastfood_rounded,
                        size: 15.r,
                        color: colors.primary,
                      ),
                    ),
                    8.horizontalSpace,
                    Flexible(
                      child: AppText(
                        restaurantName,
                        style: AppTextStyles.titleMedium(
                          context,
                        ).copyWith(fontWeight: FontWeight.w800),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 10.w,
                  vertical: 4.h,
                ).r,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16).r,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.06),
                      blurRadius: 4.r,
                    ),
                  ],
                ),
                child: AppText(
                  context.priceLabel(order.totalPrice),
                  style: AppTextStyles.labelMedium(context).copyWith(
                    color: const Color(0xFF141416),
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
            ],
          ),
          10.verticalSpace,
          // Status and date line
          Wrap(
            alignment: WrapAlignment.spaceBetween,
            crossAxisAlignment: WrapCrossAlignment.center,
            spacing: 8.r,
            runSpacing: 6.r,
            children: [
              Container(
                constraints: BoxConstraints(maxWidth: 0.65.sw),
                padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 3.h).r,
                decoration: BoxDecoration(
                  color: statusColor.withValues(alpha: 0.12),
                  borderRadius: BorderRadius.circular(10).r,
                  border: Border.all(
                    color: statusColor.withValues(alpha: 0.3),
                    width: 1.r,
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (isOngoing) ...[
                      _PulsingStatusDot(color: statusColor),
                      5.horizontalSpace,
                    ],
                    Flexible(
                      child: AppText(
                        _statusLabel(context, order.orderStatus),
                        style: AppTextStyles.labelSmall(context).copyWith(
                          color: statusColor,
                          fontWeight: FontWeight.bold,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
              AppText(
                formattedDate,
                style: AppTextStyles.bodySmall(context).copyWith(
                  color: colors.onSurfaceVariant.withValues(alpha: 0.8),
                ),
              ),
            ],
          ),
          12.verticalSpace,
          // Courier info card snippet (matching template Screen 3)
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 8.h).r,
            decoration: BoxDecoration(
              color: dark ? const Color(0xFF22222A) : Colors.white,
              borderRadius: BorderRadius.circular(16).r,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.04),
                  blurRadius: 6.r,
                  offset: Offset(0, 2.h),
                ),
              ],
            ),
            child: Wrap(
              alignment: WrapAlignment.spaceBetween,
              crossAxisAlignment: WrapCrossAlignment.center,
              spacing: 8.r,
              runSpacing: 6.r,
              children: [
                ConstrainedBox(
                  constraints: BoxConstraints(maxWidth: 0.6.sw),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        width: 28.r,
                        height: 28.r,
                        decoration: BoxDecoration(
                          color: colors.primary.withValues(alpha: 0.12),
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.delivery_dining_rounded,
                          size: 16.r,
                          color: colors.primary,
                        ),
                      ),
                      8.horizontalSpace,
                      Flexible(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            AppText(
                              isOngoing
                                  ? 'Courier Assigned'
                                  : 'Delivered by Bite',
                              style: AppTextStyles.labelMedium(
                                context,
                              ).copyWith(fontWeight: FontWeight.bold),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            AppText(
                              order.isPaid
                                  ? 'Prepaid Online'
                                  : 'Cash on Delivery',
                              style: AppTextStyles.bodySmall(context).copyWith(
                                color: colors.onSurfaceVariant,
                                fontSize: 10.sp,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      padding: EdgeInsets.all(5.r),
                      decoration: BoxDecoration(
                        color: colors.surfaceContainerHighest.withValues(
                          alpha: 0.6,
                        ),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.chat_bubble_outline_rounded,
                        size: 13.r,
                        color: colors.onSurfaceVariant,
                      ),
                    ),
                    6.horizontalSpace,
                    Container(
                      padding: EdgeInsets.all(5.r),
                      decoration: BoxDecoration(
                        color: colors.primary.withValues(alpha: 0.12),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.phone_rounded,
                        size: 13.r,
                        color: colors.primary,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          12.verticalSpace,
          // Action Buttons row
          Wrap(
            alignment: WrapAlignment.spaceBetween,
            runAlignment: WrapAlignment.center,
            crossAxisAlignment: WrapCrossAlignment.center,
            spacing: 8.r,
            runSpacing: 8.r,
            children: [
              AppText(
                '${t.totalPrice}: ${context.priceLabel(order.totalPrice)}',
                style: AppTextStyles.labelMedium(context).copyWith(
                  fontWeight: FontWeight.bold,
                  color: colors.onSurface,
                ),
              ),
              Wrap(
                spacing: 8.r,
                runSpacing: 8.r,
                children: [
                  if (isOngoing && onTrack != null)
                    AppBouncingTap(
                      onTap: onTrack,
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 14.w,
                          vertical: 7.h,
                        ).r,
                        decoration: BoxDecoration(
                          color: const Color(0xFF141416),
                          borderRadius: BorderRadius.circular(14).r,
                        ),
                        child: AppText(
                          t.trackOrder,
                          style: AppTextStyles.labelMedium(context).copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  if (!isOngoing && onReorder != null)
                    AppBouncingTap(
                      onTap: onReorder,
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 14.w,
                          vertical: 7.h,
                        ).r,
                        decoration: BoxDecoration(
                          color: const Color(0xFF141416),
                          borderRadius: BorderRadius.circular(14).r,
                        ),
                        child: AppText(
                          t.reorder,
                          style: AppTextStyles.labelMedium(context).copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  if (!isOngoing && onReview != null)
                    AppBouncingTap(
                      onTap: onReview,
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 12.w,
                          vertical: 7.h,
                        ).r,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(14).r,
                          border: Border.all(
                            color: colors.outlineVariant.withValues(alpha: 0.5),
                            width: 1.r,
                          ),
                        ),
                        child: AppText(
                          t.review,
                          style: AppTextStyles.labelMedium(context).copyWith(
                            fontWeight: FontWeight.bold,
                            color: colors.onSurface,
                          ),
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
