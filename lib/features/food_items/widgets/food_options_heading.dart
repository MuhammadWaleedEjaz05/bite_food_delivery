import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:bite_food_delivery/widgets/app_text.dart';
import 'package:bite_food_delivery/app/theme/app_text_styles.dart';

class FoodOptionsHeading extends StatelessWidget {
  const FoodOptionsHeading({super.key, required this.label, this.subtitle});
  final String label;
  final String? subtitle;
  @override
  Widget build(BuildContext context) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      AppText(label, style: AppTextStyles.titleMedium(context)),
      if (subtitle != null) ...[
        6.verticalSpace,
        AppText(subtitle!, style: AppTextStyles.bodyMedium(context)),
      ],
    ],
  );
}
