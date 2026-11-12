import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:bite_food_delivery/widgets/app_text.dart';
import 'package:bite_food_delivery/app/theme/app_text_styles.dart';
import 'package:bite_food_delivery/core/extensions/theme_extensions.dart';

class HomeSearchButton extends StatelessWidget {
  const HomeSearchButton({super.key, required this.label, required this.onTap});
  final String label;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) => Material(
    color: context.appColors.surfaceContainerHighest,
    borderRadius: BorderRadius.circular(18).r,
    child: InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(18).r,
      child: Padding(
        padding: const EdgeInsets.all(18).r,
        child: Row(
          children: [
            Icon(Icons.search_rounded, size: 24.r),
            12.horizontalSpace,
            Expanded(
              child: AppText(label, style: AppTextStyles.bodyMedium(context)),
            ),
            Icon(Icons.arrow_forward_rounded, size: 20.r),
          ],
        ),
      ),
    ),
  );
}
