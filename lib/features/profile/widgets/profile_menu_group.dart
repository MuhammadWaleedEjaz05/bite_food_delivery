import 'package:bite_food_delivery/core/extensions/theme_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileMenuGroup extends StatelessWidget {
  final List<Widget> children;

  const ProfileMenuGroup({super.key, required this.children});

  @override
  Widget build(BuildContext context) {
    final colors = context.appColors;

    return Container(
      decoration: BoxDecoration(
        color: colors.surfaceContainerLow,
        borderRadius: BorderRadius.circular(20).r,
        border: Border.all(color: colors.outlineVariant, width: 1),
      ),
      child: Column(children: children),
    );
  }
}
