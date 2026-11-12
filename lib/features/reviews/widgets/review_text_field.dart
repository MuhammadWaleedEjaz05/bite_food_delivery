import 'package:bite_food_delivery/app/theme/app_text_styles.dart';
import 'package:bite_food_delivery/core/extensions/theme_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ReviewTextField extends StatelessWidget {
  final String? initialValue;
  final ValueChanged<String>? onChanged;
  final String? hintText;
  final int maxLines;

  const ReviewTextField({
    super.key,
    this.initialValue,
    this.onChanged,
    this.hintText,
    this.maxLines = 4,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.appColors;

    return Container(
      decoration: BoxDecoration(
        color: colors.surfaceContainerLow,
        borderRadius: BorderRadius.circular(16).r,
        border: Border.all(color: colors.outlineVariant, width: 1),
      ),
      child: TextFormField(
        initialValue: initialValue,
        onChanged: onChanged,
        maxLines: maxLines,
        style: AppTextStyles.bodyMedium(context),
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: AppTextStyles.bodyMedium(
            context,
          ).copyWith(color: colors.onSurfaceVariant),
          contentPadding: const EdgeInsets.all(16).r,
          border: InputBorder.none,
        ),
      ),
    );
  }
}
