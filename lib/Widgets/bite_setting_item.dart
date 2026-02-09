import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class BiteSettingItem extends StatelessWidget {
  final BiteSettingItemModel item;
  const BiteSettingItem({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: item.onTap,
      contentPadding: EdgeInsets.zero,
      leading: CircleAvatar(
        backgroundColor: item.iconBgColor ?? Colors.orange.shade50,
        foregroundColor: item.iconColor,
        radius: 25.r,
        child: Icon(item.icon, size: 25.r),
      ),
      title: Text(item.title, style: GoogleFonts.sen(fontSize: 17.5.sp)),
      trailing: item.trailing,
    );
  }
}

class BiteSettingItemModel {
  final IconData icon;
  final Color iconColor;
  final Color? iconBgColor;
  final String title;
  final Widget? trailing;
  final VoidCallback? onTap;

  BiteSettingItemModel({
    required this.icon,
    required this.iconColor,
    this.iconBgColor,
    required this.title,
    this.trailing,
    this.onTap,
  });
}
