import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class BiteNotificationCard extends StatelessWidget {
  const BiteNotificationCard({
    super.key,
    required this.icon,
    required this.iconColor,
    required this.iconBgColor,
    required this.borderColor,
    required this.title,
    required this.subtitle,
    required this.time,
    required this.isUnread,
  });

  final IconData icon;
  final Color iconColor;
  final Color iconBgColor;
  final Color borderColor;
  final String title;
  final String subtitle;
  final String time;
  final bool isUnread;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(15.r),
        border: Border(
          left: BorderSide(color: borderColor, width: 4.w),
        ),
      ),
      padding: EdgeInsets.all(15.r),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.all(12.r),
            decoration: BoxDecoration(
              color: iconBgColor,
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Icon(icon, color: iconColor, size: 24.r),
          ),
          15.horizontalSpace,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: GoogleFonts.sen(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                5.verticalSpace,
                Text(
                  subtitle,
                  style: GoogleFonts.sen(
                    fontSize: 14.sp,
                    color: Colors.grey.shade600,
                  ),
                ),
                8.verticalSpace,
                Row(
                  children: [
                    Icon(
                      Icons.access_time,
                      color: Colors.grey.shade500,
                      size: 14.r,
                    ),
                    5.horizontalSpace,
                    Text(
                      time,
                      style: GoogleFonts.sen(
                        fontSize: 12.sp,
                        color: Colors.grey.shade500,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          if (isUnread)
            Container(
              width: 10.r,
              height: 10.r,
              decoration: BoxDecoration(
                color: Colors.deepOrange,
                shape: BoxShape.circle,
              ),
            ),
        ],
      ),
    );
  }
}
