import 'package:bite_food_delivery/core/extensions/theme_extensions.dart';
import 'package:flutter/material.dart';
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

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(count, (index) {
        final isSelected = index == currentIndex;
        return AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          curve: Curves.easeInOut,
          margin: EdgeInsets.symmetric(horizontal: 4.w),
          height: 8.h,
          width: isSelected ? 24.w : 8.w,
          decoration: BoxDecoration(
            color: isSelected
                ? colors.primary
                : colors.onSurfaceVariant.withValues(alpha: 0.25),
            borderRadius: BorderRadius.circular(4.r),
          ),
        );
      }),
    );
  }
}
