import 'package:bite_food_delivery/app/theme/app_text_styles.dart';
import 'package:bite_food_delivery/core/extensions/theme_extensions.dart';
import 'package:bite_food_delivery/widgets/app_text.dart';
import 'package:material_ui/material_ui.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddressTextField extends StatelessWidget {
  final String label;
  final String hintText;
  final TextEditingController? controller;
  final String? initialValue;
  final ValueChanged<String>? onChanged;
  final TextInputType keyboardType;
  final Widget? prefixIcon;
  final String? errorText;

  const AddressTextField({
    super.key,
    required this.label,
    required this.hintText,
    this.controller,
    this.initialValue,
    this.onChanged,
    this.keyboardType = TextInputType.text,
    this.prefixIcon,
    this.errorText,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.appColors;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppText(
          label,
          style: AppTextStyles.labelMedium(
            context,
          ).copyWith(color: colors.onSurfaceVariant),
        ),
        8.verticalSpace,
        TextFormField(
          controller: controller,
          initialValue: initialValue,
          onChanged: onChanged,
          keyboardType: keyboardType,
          style: AppTextStyles.bodyLarge(context),
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: AppTextStyles.bodyMedium(
              context,
            ).copyWith(color: colors.onSurfaceVariant.withValues(alpha: 0.6)),
            prefixIcon: prefixIcon,
            filled: true,
            fillColor: colors.surfaceContainerHighest,
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 14,
            ).r,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16).r,
              borderSide: BorderSide.none,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16).r,
              borderSide: BorderSide(color: colors.outlineVariant, width: 1),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16).r,
              borderSide: BorderSide(color: colors.primary, width: 1.5),
            ),
            errorText: errorText,
          ),
        ),
      ],
    );
  }
}
