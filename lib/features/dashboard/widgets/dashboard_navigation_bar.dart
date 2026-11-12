import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:bite_food_delivery/app/theme/app_text_styles.dart';
import 'package:bite_food_delivery/core/extensions/theme_extensions.dart';
import 'package:bite_food_delivery/widgets/app_bouncing_tap.dart';
import 'package:bite_food_delivery/widgets/app_text.dart';

class DashboardNavigationBar extends StatelessWidget {
  const DashboardNavigationBar({
    super.key,
    required this.index,
    required this.labels,
    required this.onSelected,
  });

  final int index;
  final List<String> labels;
  final ValueChanged<int> onSelected;

  static const icons = [
    Icons.home_outlined,
    Icons.explore_outlined,
    Icons.receipt_long_outlined,
    Icons.person_outline,
  ];

  static const selectedIcons = [
    Icons.home_rounded,
    Icons.explore_rounded,
    Icons.receipt_long_rounded,
    Icons.person_rounded,
  ];

  @override
  Widget build(BuildContext context) {
    final dark = Theme.of(context).brightness == Brightness.dark;

    return SafeArea(
      top: false,
      child: Padding(
        padding: EdgeInsets.fromLTRB(16.w, 4.h, 16.w, 10.h).r,
        child: Container(
          decoration: BoxDecoration(
            color:
                (dark
                        ? context.appColors.surfaceContainerLow
                        : context.appColors.surface)
                    .withValues(alpha: 0.88),
            borderRadius: BorderRadius.circular(28).r,
            border: Border.all(
              color: context.appColors.outlineVariant.withValues(
                alpha: dark ? 0.25 : 0.45,
              ),
              width: 1.r,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: dark ? 0.35 : 0.08),
                blurRadius: 20.r,
                offset: Offset(0, 8.h),
              ),
              BoxShadow(
                color: context.appColors.primary.withValues(
                  alpha: dark ? 0.08 : 0.04,
                ),
                blurRadius: 30.r,
                offset: Offset(0, 10.h),
              ),
            ],
          ),
          clipBehavior: Clip.antiAlias,
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 16, sigmaY: 16),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 8.h).r,
              child: Row(
                children: [
                  for (var i = 0; i < labels.length; i++)
                    Expanded(
                      child: Semantics(
                        selected: index == i,
                        button: true,
                        child: AppBouncingTap(
                          onTap: () => onSelected(i),
                          pressedScale: 0.92,
                          child: Padding(
                            padding: EdgeInsets.symmetric(vertical: 4.h).r,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                AnimatedContainer(
                                  duration: const Duration(milliseconds: 240),
                                  curve: Curves.easeOutCubic,
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 16.w,
                                    vertical: 6.h,
                                  ).r,
                                  decoration: BoxDecoration(
                                    color: index == i
                                        ? context.appColors.primary.withValues(
                                            alpha: 0.14,
                                          )
                                        : Colors.transparent,
                                    borderRadius: BorderRadius.circular(16).r,
                                  ),
                                  child: AnimatedScale(
                                    duration: const Duration(milliseconds: 220),
                                    scale: index == i ? 1.08 : 0.94,
                                    curve: Curves.easeOutBack,
                                    child: Icon(
                                      index == i ? selectedIcons[i] : icons[i],
                                      size: 22.r,
                                      color: index == i
                                          ? context.appColors.primary
                                          : context.appColors.onSurfaceVariant,
                                    ),
                                  ),
                                ),
                                4.verticalSpace,
                                AppText(
                                  labels[i],
                                  textAlign: TextAlign.center,
                                  style: AppTextStyles.labelSmall(context)
                                      .copyWith(
                                        color: index == i
                                            ? context.appColors.primary
                                            : context
                                                  .appColors
                                                  .onSurfaceVariant,
                                        fontWeight: index == i
                                            ? FontWeight.w700
                                            : FontWeight.w500,
                                      ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
