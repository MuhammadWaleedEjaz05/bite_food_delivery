import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class BiteCourierCard extends StatelessWidget {
  final String courierName;
  final String? courierImageUrl;

  const BiteCourierCard({
    super.key,
    required this.courierName,
    this.courierImageUrl,
  });

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).primaryColor;

    return Row(
      children: [
        CircleAvatar(
          radius: 26.r,
          backgroundColor: Colors.grey.shade200,
          backgroundImage: courierImageUrl != null
              ? NetworkImage(courierImageUrl!)
              : null,
          child: courierImageUrl == null
              ? Icon(Icons.person, size: 28.r, color: Colors.grey.shade500)
              : null,
        ),
        12.horizontalSpace,

        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                courierName,
                style: GoogleFonts.sen(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              Text(
                'Courier',
                style: GoogleFonts.sen(fontSize: 14.sp, color: Colors.grey),
              ),
            ],
          ),
        ),

        _ActionCircleButton(
          color: primaryColor,
          icon: Icons.call,
          onTap: () {},
        ),
        10.horizontalSpace,

        _ActionCircleButton(
          color: primaryColor.withAlpha(40),
          icon: Icons.message_rounded,
          iconColor: primaryColor,
          onTap: () {},
        ),
      ],
    );
  }
}

class _ActionCircleButton extends StatelessWidget {
  final Color color;
  final IconData icon;
  final Color? iconColor;
  final VoidCallback onTap;

  const _ActionCircleButton({
    required this.color,
    required this.icon,
    this.iconColor,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 45.r,
        width: 45.r,
        decoration: BoxDecoration(shape: BoxShape.circle, color: color),
        child: Icon(icon, color: iconColor ?? Colors.white, size: 22.r),
      ),
    );
  }
}
