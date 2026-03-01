import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
                  style: Theme.of(
                    context,
                  ).textTheme.titleMedium!.copyWith(color: Colors.black),
                ),
                5.verticalSpace,
                Text(
                  subtitle,
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
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
                      style: Theme.of(context).textTheme.labelMedium!.copyWith(
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
