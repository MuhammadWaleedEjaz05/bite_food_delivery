import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class BiteRestaurantCard extends StatelessWidget {
  const BiteRestaurantCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 120.h,
          decoration: BoxDecoration(
            color: Colors.blueGrey,
            borderRadius: BorderRadius.circular(20.r),
          ),
        ),
        Text('Restaurant Name', style: GoogleFonts.sen(fontSize: 25.sp)),
        Text(
          'Restaurant Category',
          style: GoogleFonts.sen(fontSize: 18.sp, color: Colors.grey.shade600),
        ),
        5.verticalSpace,
        Row(
          children: [
            Icon(
              Icons.star_outline,
              color: Theme.of(context).primaryColor,
              size: 18.sp,
            ),
            4.horizontalSpace,
            Text(
              '4.5',
              style: GoogleFonts.sen(
                fontSize: 16.sp,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            10.horizontalSpace,
            Icon(
              Icons.delivery_dining,
              color: Theme.of(context).primaryColor,
              size: 18.sp,
            ),
            4.horizontalSpace,
            Text(
              '30-40 min',
              style: GoogleFonts.sen(fontSize: 16.sp, color: Colors.black),
            ),
            10.horizontalSpace,
            Icon(
              Icons.timelapse_outlined,
              color: Theme.of(context).primaryColor,
              size: 18.sp,
            ),
            4.horizontalSpace,
            Text(
              '\$2.99',
              style: GoogleFonts.sen(fontSize: 16.sp, color: Colors.black),
            ),
          ],
        ),
      ],
    );
  }
}
