import 'package:material_ui/material_ui.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:bite_food_delivery/app/theme/app_text_styles.dart';
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
        padding: EdgeInsets.fromLTRB(18.w, 0, 18.w, 8.h).r,
        child: Container(
          decoration: BoxDecoration(
            color: dark ? const Color(0xFF18181E) : const Color(0xFF141416),
            borderRadius: BorderRadius.circular(30).r,
            border: Border.all(
              color: Colors.white.withValues(alpha: dark ? 0.12 : 0.08),
              width: 1.r,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.32),
                blurRadius: 20.r,
                offset: Offset(0, 6.h),
              ),
            ],
          ),
          padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 5.h).r,
          child: LayoutBuilder(
            builder: (context, constraints) {
              final tabCount = labels.isEmpty ? 1 : labels.length;
              final tabWidth = constraints.maxWidth / tabCount;
              final safeIndex = index.clamp(0, tabCount - 1);

              return Stack(
                alignment: Alignment.centerLeft,
                children: [
                  // Sliding Liquid Mercury Capsule
                  AnimatedPositioned(
                    duration: const Duration(milliseconds: 260),
                    curve: Curves.easeOutCubic,
                    left: safeIndex * tabWidth,
                    width: tabWidth,
                    top: 0,
                    bottom: 0,
                    child: Padding(
                      padding: EdgeInsets.all(2.r),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(24).r,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.white.withValues(alpha: 0.18),
                              blurRadius: 10.r,
                              offset: Offset(0, 2.h),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                  // Tab Items
                  Row(
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
                                padding: EdgeInsets.symmetric(
                                  horizontal: 4.w,
                                  vertical: 6.h,
                                ).r,
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    AnimatedScale(
                                      scale: index == i ? 1.08 : 1.0,
                                      duration: const Duration(milliseconds: 200),
                                      curve: Curves.easeOutCubic,
                                      child: Icon(
                                        index == i ? selectedIcons[i] : icons[i],
                                        size: 19.r,
                                        color: index == i
                                            ? const Color(0xFF141416)
                                            : Colors.white.withValues(alpha: 0.65),
                                      ),
                                    ),
                                    2.verticalSpace,
                                    AppText(
                                      labels[i],
                                      textAlign: TextAlign.center,
                                      style: AppTextStyles.labelSmall(context).copyWith(
                                        fontSize: 10.sp,
                                        color: index == i
                                            ? const Color(0xFF141416)
                                            : Colors.white.withValues(alpha: 0.7),
                                        fontWeight: index == i
                                            ? FontWeight.w800
                                            : FontWeight.w500,
                                      ),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
