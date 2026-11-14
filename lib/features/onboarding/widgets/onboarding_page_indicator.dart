import 'package:bite_food_delivery/core/extensions/theme_extensions.dart';
import 'package:material_ui/material_ui.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnboardingPageIndicator extends StatelessWidget {
  final int count;
  final int currentIndex;

  const OnboardingPageIndicator({
    super.key,
    required this.count,
    required this.currentIndex,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.appColors;
    final dark = Theme.of(context).brightness == Brightness.dark;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(count, (index) {
        final isSelected = index == currentIndex;

        return AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOutCubic,
          margin: EdgeInsets.symmetric(horizontal: 4.w).r,
          height: 8.h,
          width: isSelected ? 30.w : 8.w,
          decoration: BoxDecoration(
            color: isSelected
                ? colors.primary
                : colors.onSurfaceVariant.withValues(
                    alpha: dark ? 0.30 : 0.22,
                  ),
            borderRadius: BorderRadius.circular(12).r,
            boxShadow: [
              BoxShadow(
                color: colors.primary.withValues(
                  alpha: isSelected ? (dark ? 0.50 : 0.32) : 0.0,
                ),
                blurRadius: isSelected ? 8.r : 0.0,
                offset: Offset(0, isSelected ? 2.h : 0.0),
              ),
            ],
          ),
        );
      }),
    );
  }
}
