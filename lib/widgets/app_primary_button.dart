import 'package:material_ui/material_ui.dart';
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
    this.backgroundColor,
    this.foregroundColor,
    this.borderRadius,
    this.trailing,
  });

  final String label;
  final VoidCallback? onTap;
  final bool busy;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final double? borderRadius;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    final enabled = onTap != null && !busy;
    final effectiveBg = backgroundColor ?? context.appColors.primary;
    final effectiveFg = foregroundColor ?? context.appColors.onPrimary;
    final effectiveRadius = borderRadius ?? 18.0;

    return AppBouncingTap(
      onTap: enabled ? onTap : null,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(effectiveRadius).r,
          boxShadow: enabled
              ? [
                  BoxShadow(
                    color: effectiveBg.withValues(alpha: 0.32),
                    blurRadius: 14.r,
                    offset: Offset(0, 5.h),
                  ),
                ]
              : null,
        ),
        child: FilledButton(
          onPressed: enabled ? onTap : null,
          style: FilledButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14).r,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(effectiveRadius).r,
            ),
            backgroundColor: effectiveBg,
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
                    color: effectiveFg,
                  ),
                ),
                10.horizontalSpace,
              ],
              Flexible(
                child: AppText(
                  label,
                  style: AppTextStyles.labelLarge(context).copyWith(
                    color: enabled
                        ? effectiveFg
                        : context.appColors.onSurface.withValues(alpha: 0.38),
                    fontWeight: FontWeight.w800,
                  ),
                  textAlign: TextAlign.center,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              if (trailing != null) ...[
                8.horizontalSpace,
                trailing!,
              ],
            ],
          ),
        ),
      ),
    );
  }
}
