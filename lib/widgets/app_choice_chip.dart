import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:bite_food_delivery/widgets/app_bouncing_tap.dart';
import 'package:bite_food_delivery/widgets/app_text.dart';
import 'package:bite_food_delivery/app/theme/app_text_styles.dart';
import 'package:bite_food_delivery/core/extensions/theme_extensions.dart';

class AppChoiceChip extends StatelessWidget {
  const AppChoiceChip({
    super.key,
    required this.label,
    required this.selected,
    required this.onTap,
  });

  final String label;
  final bool selected;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final dark = Theme.of(context).brightness == Brightness.dark;

    return AppBouncingTap(
      onTap: onTap,
      pressedScale: 0.94,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 180),
        curve: Curves.easeOutCubic,
        padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 8.h).r,
        decoration: BoxDecoration(
          color: selected
              ? context.appColors.primary
              : context.appColors.surfaceContainerLow,
          borderRadius: BorderRadius.circular(16).r,
          border: Border.all(
            color: selected
                ? context.appColors.primary
                : context.appColors.outlineVariant.withValues(
                    alpha: dark ? 0.3 : 0.45,
                  ),
            width: 1.r,
          ),
          boxShadow: selected
              ? [
                  BoxShadow(
                    color: context.appColors.primary.withValues(alpha: 0.28),
                    blurRadius: 10.r,
                    offset: Offset(0, 4.h),
                  ),
                ]
              : null,
        ),
        child: AppText(
          label,
          style: AppTextStyles.labelMedium(context).copyWith(
            color: selected
                ? context.appColors.onPrimary
                : context.appColors.onSurface,
            fontWeight: selected ? FontWeight.w700 : FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
