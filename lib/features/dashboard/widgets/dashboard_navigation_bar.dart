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
        padding: EdgeInsets.fromLTRB(20.w, 0, 20.w, 6.h).r,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(24).r,
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
            child: Container(
              decoration: BoxDecoration(
                color:
                    (dark
                            ? context.appColors.surfaceContainerLow
                            : context.appColors.surface)
                        .withValues(alpha: dark ? 0.35 : 0.45),
                borderRadius: BorderRadius.circular(24).r,
                border: Border.all(
                  color:
                      (dark ? Colors.white : context.appColors.outlineVariant)
                          .withValues(alpha: dark ? 0.14 : 0.25),
                  width: 1.r,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: dark ? 0.25 : 0.05),
                    blurRadius: 16.r,
                    offset: Offset(0, 4.h),
                  ),
                ],
              ),
              padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 3.h).r,
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
                            padding: EdgeInsets.symmetric(vertical: 2.h).r,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                AnimatedContainer(
                                  duration: const Duration(milliseconds: 240),
                                  curve: Curves.easeOutCubic,
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 10.w,
                                    vertical: 3.h,
                                  ).r,
                                  decoration: BoxDecoration(
                                    color: index == i
                                        ? context.appColors.primary.withValues(
                                            alpha: 0.14,
                                          )
                                        : Colors.transparent,
                                    borderRadius: BorderRadius.circular(12).r,
                                  ),
                                  child: AnimatedScale(
                                    duration: const Duration(milliseconds: 220),
                                    scale: index == i ? 1.06 : 0.94,
                                    curve: Curves.easeOutBack,
                                    child: Icon(
                                      index == i ? selectedIcons[i] : icons[i],
                                      size: 20.r,
                                      color: index == i
                                          ? context.appColors.primary
                                          : context.appColors.onSurfaceVariant,
                                    ),
                                  ),
                                ),
                                2.verticalSpace,
                                AppText(
                                  labels[i],
                                  textAlign: TextAlign.center,
                                  style: AppTextStyles.labelSmall(context)
                                      .copyWith(
                                        fontSize: 10.sp,
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
