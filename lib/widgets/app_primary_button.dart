import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:bite_food_delivery/widgets/app_bouncing_tap.dart';
import 'package:bite_food_delivery/widgets/app_text.dart';
import 'package:bite_food_delivery/app/theme/app_text_styles.dart';
import 'package:bite_food_delivery/core/extensions/theme_extensions.dart';

class AppPrimaryButton extends StatelessWidget {
  const AppPrimaryButton({
    super.key,
    required this.label,
    required this.onTap,
    this.busy = false,
  });

  final String label;
  final VoidCallback? onTap;
  final bool busy;

  @override
  Widget build(BuildContext context) {
    final enabled = onTap != null && !busy;

    return AppBouncingTap(
      onTap: enabled ? onTap : null,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18).r,
          boxShadow: enabled
              ? [
                  BoxShadow(
                    color: context.appColors.primary.withValues(alpha: 0.32),
                    blurRadius: 14.r,
                    offset: Offset(0, 5.h),
                  ),
                ]
              : null,
        ),
        child: FilledButton(
          onPressed: enabled ? onTap : null,
          style: FilledButton.styleFrom(
            padding: const EdgeInsets.all(16).r,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18).r,
            ),
            backgroundColor: context.appColors.primary,
            disabledBackgroundColor: context.appColors.onSurface.withValues(
              alpha: 0.12,
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (busy) ...[
                SizedBox.square(
                  dimension: 18.r,
                  child: CircularProgressIndicator(
                    strokeWidth: 2.r,
                    color: context.appColors.onPrimary,
                  ),
                ),
                10.horizontalSpace,
              ],
              Flexible(
                child: AppText(
                  label,
                  style: AppTextStyles.labelLarge(context).copyWith(
                    color: enabled
                        ? context.appColors.onPrimary
                        : context.appColors.onSurface.withValues(alpha: 0.38),
                    fontWeight: FontWeight.w700,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
