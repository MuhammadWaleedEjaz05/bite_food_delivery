import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:bite_food_delivery/widgets/app_text.dart';
import 'package:bite_food_delivery/app/theme/app_text_styles.dart';

class AppSectionHeading extends StatelessWidget {
  const AppSectionHeading({
    super.key,
    required this.title,
    this.actionLabel,
    this.onAction,
  });
  final String title;
  final String? actionLabel;
  final VoidCallback? onAction;
  @override
  Widget build(BuildContext context) => LayoutBuilder(
    builder: (context, constraints) {
      final heading = AppText(title, style: AppTextStyles.titleLarge(context));
      if (actionLabel == null || onAction == null) return heading;
      final action = TextButton(
        onPressed: onAction,
        child: AppText(actionLabel!, style: AppTextStyles.labelLarge(context)),
      );
      if (MediaQuery.textScalerOf(context).scale(1) > 1.3) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [heading, action],
        );
      }
      return Row(
        children: [
          Expanded(flex: 3, child: heading),
          8.horizontalSpace,
          Flexible(flex: 2, child: action),
        ],
      );
    },
  );
}
