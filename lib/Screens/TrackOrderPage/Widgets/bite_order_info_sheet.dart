import 'package:bite_food_delivery/Screens/TrackOrderPage/Widgets/bite_order_timeline.dart';
import 'package:bite_food_delivery/Screens/TrackOrderPage/Widgets/bite_courier_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class BiteOrderInfoSheet extends StatelessWidget {
  final String restaurantName;
  final String orderDate;
  final List<String> items;
  final int estimatedMinutes;
  final String courierName;
  final int currentStep; // 0-3

  const BiteOrderInfoSheet({
    super.key,
    required this.restaurantName,
    required this.orderDate,
    required this.items,
    required this.estimatedMinutes,
    required this.courierName,
    this.currentStep = 0,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(24.r)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(25),
            blurRadius: 20,
            offset: const Offset(0, -4),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // ── Drag Handle ──
          Padding(
            padding: EdgeInsets.only(top: 12.h),
            child: Container(
              width: 40.w,
              height: 4.h,
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(2.r),
              ),
            ),
          ),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // ── Restaurant Info Row ──
                _RestaurantInfoRow(
                  restaurantName: restaurantName,
                  orderDate: orderDate,
                ),
                16.verticalSpace,

                // ── Ordered Items ──
                ...items.map(
                  (item) => Padding(
                    padding: EdgeInsets.only(bottom: 4.h),
                    child: Text(
                      item,
                      style: GoogleFonts.sen(
                        fontSize: 14.sp,
                        color: Colors.grey.shade700,
                      ),
                    ),
                  ),
                ),
                20.verticalSpace,

                // ── Estimated Time ──
                Center(
                  child: Column(
                    children: [
                      Text(
                        '$estimatedMinutes min',
                        style: GoogleFonts.sen(
                          fontSize: 34.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                      4.verticalSpace,
                      Text(
                        'ESTIMATED DELIVERY TIME',
                        style: GoogleFonts.sen(
                          fontSize: 13.sp,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey,
                          letterSpacing: 1.2,
                        ),
                      ),
                    ],
                  ),
                ),
                24.verticalSpace,

                // ── Order Status Timeline ──
                BiteOrderTimeline(currentStep: currentStep),
                20.verticalSpace,

                Divider(thickness: 1.h, color: Colors.grey.shade200),
                12.verticalSpace,

                // ── Courier Card ──
                BiteCourierCard(courierName: courierName),
                10.verticalSpace,
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ── Restaurant Info Row ──────────────────────────────────────────────────────
class _RestaurantInfoRow extends StatelessWidget {
  final String restaurantName;
  final String orderDate;

  const _RestaurantInfoRow({
    required this.restaurantName,
    required this.orderDate,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 55.h,
          width: 55.w,
          decoration: BoxDecoration(
            color: Colors.grey.shade300,
            borderRadius: BorderRadius.circular(10.r),
          ),
          child: Icon(
            Icons.restaurant,
            color: Colors.grey.shade600,
            size: 28.r,
          ),
        ),
        12.horizontalSpace,
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              restaurantName,
              style: GoogleFonts.sen(
                fontSize: 18.sp,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            4.verticalSpace,
            Text(
              'Orderd At $orderDate',
              style: GoogleFonts.sen(fontSize: 14.sp, color: Colors.grey),
            ),
          ],
        ),
      ],
    );
  }
}
