import 'package:bite_food_delivery/app/theme/app_text_styles.dart';
import 'package:bite_food_delivery/core/extensions/theme_extensions.dart';
import 'package:bite_food_delivery/widgets/app_text.dart';
import 'package:material_ui/material_ui.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OnboardingSlide extends StatelessWidget {
  final String assetName;
  final String title;
  final String description;
  final Color? pastelColor;
  final IconData? icon;
  final String? badgeText;
  final IconData? badgeIcon;

  const OnboardingSlide({
    super.key,
    required this.assetName,
    required this.title,
    required this.description,
    this.pastelColor,
    this.icon,
    this.badgeText,
    this.badgeIcon,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.appColors;
    final dark = Theme.of(context).brightness == Brightness.dark;
    final cardBg = dark
        ? colors.surfaceContainerHigh
        : (pastelColor ?? colors.primary.withValues(alpha: 0.08));

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w).r,
      child: Column(
        children: [
          Expanded(
            child: Center(
              child: Container(
                constraints: BoxConstraints(maxHeight: 230.h),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: cardBg,
                  borderRadius: BorderRadius.circular(28).r,
                  border: Border.all(
                    color: colors.outlineVariant.withValues(
                      alpha: dark ? 0.2 : 0.45,
                    ),
                    width: 1.r,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: dark ? 0.3 : 0.04),
                      blurRadius: 18.r,
                      offset: Offset(0, 6.h),
                    ),
                  ],
                ),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      width: 150.r,
                      height: 150.r,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: colors.surface.withValues(
                          alpha: dark ? 0.05 : 0.45,
                        ),
                      ),
                    ),
                    Container(
                      width: 110.r,
                      height: 110.r,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: colors.surface,
                        boxShadow: [
                          BoxShadow(
                            color: colors.primary.withValues(alpha: 0.12),
                            blurRadius: 14.r,
                            offset: Offset(0, 4.h),
                          ),
                        ],
                      ),
                      child: Center(
                        child: icon != null
                            ? Icon(
                                icon,
                                size: 52.r,
                                color: colors.primary,
                              )
                            : (assetName.endsWith('.svg')
                                ? SvgPicture.asset(
                                    assetName,
                                    height: 52.r,
                                    width: 52.r,
                                    fit: BoxFit.contain,
                                    colorFilter: ColorFilter.mode(
                                      colors.primary,
                                      BlendMode.srcIn,
                                    ),
                                  )
                                : Image.asset(
                                    assetName,
                                    height: 52.r,
                                    width: 52.r,
                                    fit: BoxFit.contain,
                                  )),
                      ),
                    ),
                    if (badgeText != null)
                      Positioned(
                        bottom: 12.h,
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 12.w,
                            vertical: 5.h,
                          ).r,
                          decoration: BoxDecoration(
                            color: colors.surface,
                            borderRadius: BorderRadius.circular(20).r,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withValues(
                                  alpha: dark ? 0.25 : 0.08,
                                ),
                                blurRadius: 8.r,
                                offset: Offset(0, 2.h),
                              ),
                            ],
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              if (badgeIcon != null) ...[
                                Icon(
                                  badgeIcon,
                                  size: 13.r,
                                  color: colors.primary,
                                ),
                                5.horizontalSpace,
                              ],
                              AppText(
                                badgeText!,
                                style: AppTextStyles.labelSmall(
                                  context,
                                ).copyWith(
                                  fontWeight: FontWeight.w800,
                                  color: colors.onSurface,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ),
          16.verticalSpace,
          AppText(
            title,
            style: AppTextStyles.headlineSmall(
              context,
            ).copyWith(fontWeight: FontWeight.w800, letterSpacing: -0.4),
            textAlign: TextAlign.center,
          ),
          8.verticalSpace,
          AppText(
            description,
            style: AppTextStyles.bodyMedium(
              context,
            ).copyWith(color: colors.onSurfaceVariant, height: 1.4),
            textAlign: TextAlign.center,
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
