import 'package:bite_food_delivery/app/routes/app_navigation.dart';
import 'package:bite_food_delivery/app/theme/app_theme.dart';
import 'package:bite_food_delivery/core/utils/environment_utils.dart';
import 'package:material_ui/material_ui.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:bite_food_delivery/features/orders/models/order_model.dart';
import 'package:bite_food_delivery/widgets/app_bouncing_tap.dart';
import 'package:bite_food_delivery/widgets/app_text.dart';
import 'package:bite_food_delivery/app/theme/app_text_styles.dart';

class TrackOrderSegmentedStepper extends StatefulWidget {
  const TrackOrderSegmentedStepper({super.key, required this.order});

  final OrderModel order;

  @override
  State<TrackOrderSegmentedStepper> createState() =>
      _TrackOrderSegmentedStepperState();
}

class _TrackOrderSegmentedStepperState extends State<TrackOrderSegmentedStepper>
    with SingleTickerProviderStateMixin {
  late final AnimationController _scooterController;
  late final Animation<double> _scooterOffset;

  @override
  void initState() {
    super.initState();
    _scooterController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    );
    _scooterOffset = Tween<double>(begin: -3.0, end: 3.0).animate(
      CurvedAnimation(parent: _scooterController, curve: Curves.easeInOutSine),
    );

    if (!EnvironmentUtils.isTest) {
      _scooterController.repeat(reverse: true);
    }
  }

  @override
  void dispose() {
    _scooterController.dispose();
    super.dispose();
  }

  int _stepIndex(OrderStatus status) {
    switch (status) {
      case OrderStatus.received:
        return 0;
      case OrderStatus.preparing:
        return 1;
      case OrderStatus.dispatched:
        return 2;
      case OrderStatus.delivered:
        return 3;
      case OrderStatus.cancelled:
        return -1;
    }
  }

  double _progressValue(int step) {
    switch (step) {
      case 0:
        return 0.15;
      case 1:
        return 0.45;
      case 2:
        return 0.75;
      case 3:
        return 1.0;
      default:
        return 0.0;
    }
  }

  @override
  Widget build(BuildContext context) {
    final step = _stepIndex(widget.order.orderStatus);
    final isCancelled = widget.order.orderStatus == OrderStatus.cancelled;
    final progress = isCancelled ? 0.0 : _progressValue(step);

    final stepLabels = [
      'Order\nReceived',
      'Headed\nto Pickup',
      "Food's on\nthe Way",
      'Arriving\nSoon',
    ];

    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(20.r),
      decoration: BoxDecoration(
        color: const Color(0xFF141416),
        borderRadius: BorderRadius.circular(28).r,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.4),
            blurRadius: 20.r,
            offset: Offset(0, 8.h),
          ),
        ],
      ),
      child: Column(
        children: [
          // Header: Delivery Status
          AppText(
            'Delivery Status',
            style: AppTextStyles.labelSmall(context).copyWith(
              color: Colors.white60,
              fontSize: 11.sp,
              letterSpacing: 0.5,
            ),
          ),
          4.verticalSpace,
          AppText(
            isCancelled
                ? 'Order Cancelled'
                : (step == 3 ? 'Delivered' : "Foods on the Way"),
            style: AppTextStyles.titleMedium(context).copyWith(
              color: isCancelled ? const Color(0xFFFF5252) : Colors.white,
              fontWeight: FontWeight.w800,
              fontSize: 15.sp,
            ),
          ),
          16.verticalSpace,

          // Animated Scooter Courier Illustration
          AnimatedBuilder(
            animation: _scooterOffset,
            builder: (context, _) => Transform.translate(
              offset: Offset(_scooterOffset.value, 0),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  // Wind Speed Dash Streaks
                  Positioned(
                    left: 20.w,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          width: 14.w,
                          height: 2.h,
                          decoration: BoxDecoration(
                            color: AppPastelColors.neonLime.withValues(alpha: 0.6),
                            borderRadius: BorderRadius.circular(2).r,
                          ),
                        ),
                        6.horizontalSpace,
                        Container(
                          width: 22.w,
                          height: 2.5.h,
                          decoration: BoxDecoration(
                            color: AppPastelColors.neonLime.withValues(alpha: 0.8),
                            borderRadius: BorderRadius.circular(2).r,
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Courier Circle Badge
                  Container(
                    width: 60.r,
                    height: 60.r,
                    decoration: BoxDecoration(
                      color: const Color(0xFF222228),
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.white.withValues(alpha: 0.12),
                        width: 1.5.r,
                      ),
                    ),
                    child: Center(
                      child: Icon(
                        Icons.delivery_dining_rounded,
                        size: 34.r,
                        color: AppPastelColors.neonLime,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          20.verticalSpace,

          // Horizontal Segmented Neon Lime Pill Stepper
          Container(
            height: 10.h,
            width: double.infinity,
            decoration: BoxDecoration(
              color: const Color(0xFF282830),
              borderRadius: BorderRadius.circular(10).r,
            ),
            child: FractionallySizedBox(
              alignment: Alignment.centerLeft,
              widthFactor: progress.clamp(0.05, 1.0),
              child: Container(
                decoration: BoxDecoration(
                  color: isCancelled
                      ? const Color(0xFFFF5252)
                      : AppPastelColors.neonLime,
                  borderRadius: BorderRadius.circular(10).r,
                  boxShadow: [
                    BoxShadow(
                      color: (isCancelled
                              ? const Color(0xFFFF5252)
                              : AppPastelColors.neonLime)
                          .withValues(alpha: 0.6),
                      blurRadius: 6.r,
                    ),
                  ],
                ),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Container(
                    width: 8.r,
                    height: 8.r,
                    margin: EdgeInsets.only(right: 1.w),
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ),
          12.verticalSpace,

          // Step Labels Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: List.generate(4, (i) {
              final isCurrent = step == i;
              final isPast = step > i;
              final color = isCurrent
                  ? AppPastelColors.neonLime
                  : (isPast ? Colors.white : Colors.white38);

              return Expanded(
                child: AppText(
                  stepLabels[i],
                  style: AppTextStyles.labelSmall(context).copyWith(
                    color: color,
                    fontWeight: isCurrent ? FontWeight.w900 : FontWeight.w600,
                    fontSize: 9.sp,
                    height: 1.2,
                  ),
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              );
            }),
          ),
          20.verticalSpace,

          // Outlined Pill Action: Track Your Order
          AppBouncingTap(
            onTap: () {},
            pressedScale: 0.97,
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(vertical: 12.h).r,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20).r,
                border: Border.all(
                  color: Colors.white.withValues(alpha: 0.25),
                  width: 1.r,
                ),
              ),
              child: Center(
                child: AppText(
                  'Track Your Order',
                  style: AppTextStyles.labelMedium(context).copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.w800,
                    letterSpacing: 0.3,
                  ),
                ),
              ),
            ),
          ),
          12.verticalSpace,

          // Help / Support Link
          GestureDetector(
            onTap: () => AppNavigation.push(context, '/faq_screen'),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h).r,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.chat_bubble_outline_rounded,
                    size: 13.r,
                    color: Colors.white60,
                  ),
                  6.horizontalSpace,
                  Flexible(
                    child: AppText(
                      'Need Help? Chat With Pepper',
                      style: AppTextStyles.labelSmall(context).copyWith(
                        color: Colors.white70,
                        fontWeight: FontWeight.w600,
                        fontSize: 11.sp,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
