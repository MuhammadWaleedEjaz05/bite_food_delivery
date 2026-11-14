import 'package:material_ui/material_ui.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:bite_food_delivery/features/orders/models/order_model.dart';
import 'package:bite_food_delivery/widgets/app_text.dart';
import 'package:bite_food_delivery/app/theme/app_text_styles.dart';

class TrackOrderArrivalCard extends StatelessWidget {
  const TrackOrderArrivalCard({super.key, required this.order});

  final OrderModel order;

  @override
  Widget build(BuildContext context) {
    final dark = Theme.of(context).brightness == Brightness.dark;
    final formattedDate = DateFormat('MMMM d, yyyy').format(order.orderPlacedAt);
    final estimatedTime = DateFormat('HH:mm').format(
      order.orderPlacedAt.add(const Duration(minutes: 32)),
    );

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h).r,
      decoration: BoxDecoration(
        color: dark ? const Color(0xFF1B1B22) : Colors.white,
        borderRadius: BorderRadius.circular(24).r,
        border: Border.all(
          color: dark
              ? Colors.white.withValues(alpha: 0.1)
              : Colors.black.withValues(alpha: 0.05),
          width: 1.r,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: dark ? 0.35 : 0.06),
            blurRadius: 16.r,
            offset: Offset(0, 6.h),
          ),
        ],
      ),
      child: Column(
        children: [
          AppText(
            'Delivery Confirmed',
            style: AppTextStyles.titleMedium(context).copyWith(
              fontWeight: FontWeight.w800,
              fontSize: 16.sp,
            ),
          ),
          4.verticalSpace,
          AppText(
            formattedDate,
            style: AppTextStyles.bodySmall(context).copyWith(
              color: dark ? Colors.white60 : const Color(0xFF757575),
              fontSize: 12.sp,
            ),
          ),
          10.verticalSpace,
          // Giant arrival time display
          AppText(
            estimatedTime,
            style: AppTextStyles.headlineLarge(context).copyWith(
              fontWeight: FontWeight.w900,
              fontSize: 36.sp,
              letterSpacing: 1.2,
              color: dark ? Colors.white : const Color(0xFF141416),
            ),
          ),
          4.verticalSpace,
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 3.h).r,
            decoration: BoxDecoration(
              color: dark
                  ? Colors.white.withValues(alpha: 0.08)
                  : const Color(0xFFF4F4F6),
              borderRadius: BorderRadius.circular(12).r,
            ),
            child: AppText(
              'Estimate Arrival',
              style: AppTextStyles.labelSmall(context).copyWith(
                color: dark ? Colors.white70 : const Color(0xFF666666),
                fontWeight: FontWeight.w600,
                fontSize: 11.sp,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

