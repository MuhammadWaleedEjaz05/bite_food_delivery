import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class BiteSupportBlocks extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color color;
  final VoidCallback? onPressed;
  const BiteSupportBlocks({
    super.key,
    required this.title,
    required this.icon,
    required this.color,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.h,
      width: 100.w,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.r),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade200,
            spreadRadius: 1.r,
            blurRadius: 10.r,
            offset: Offset(0, 7.5.h),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            backgroundColor: color.withAlpha(35),
            radius: 25.r,
            child: Icon(icon, size: 25.r, color: color),
          ),
          5.verticalSpace,
          Text(
            title,
            style: GoogleFonts.sen(fontSize: 20.sp, color: color),
          ),
        ],
      ),
    );
  }
}
