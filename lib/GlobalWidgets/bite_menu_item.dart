import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BiteMenuItem extends StatelessWidget {
  final BiteMenuItemModel item;
  const BiteMenuItem({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: item.onTap,
      contentPadding: EdgeInsets.zero,
      leading: CircleAvatar(
        backgroundColor: Colors.white,
        foregroundColor: item.leadingIconColor,
        radius: 25.r,
        child: Icon(item.leadingIcon, size: 25.r),
      ),
      title: Text(item.title, style: Theme.of(context).textTheme.labelSmall),
      subtitle: item.subtitle != null
          ? Text(
              item.subtitle!,
              style: Theme.of(context).textTheme.bodySmall!.copyWith(color: Colors.grey),
            )
          : null,
      trailing: IconButton(
        onPressed: item.onTap,
        icon: Icon(Icons.arrow_forward_ios, size: 20.r),
      ),
    );
  }
}

class BiteMenuItemModel {
  final IconData leadingIcon;
  final Color leadingIconColor;
  final String title;
  final String? subtitle;
  final VoidCallback onTap;

  BiteMenuItemModel({
    required this.leadingIcon,
    required this.leadingIconColor,
    required this.title,
    this.subtitle,
    required this.onTap,
  });
}
