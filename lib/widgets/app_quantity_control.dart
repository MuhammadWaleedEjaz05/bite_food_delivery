import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:bite_food_delivery/widgets/app_bouncing_tap.dart';
import 'package:bite_food_delivery/widgets/app_text.dart';
import 'package:bite_food_delivery/app/theme/app_text_styles.dart';
import 'package:bite_food_delivery/core/extensions/theme_extensions.dart';

class AppQuantityControl extends StatelessWidget {
  const AppQuantityControl({
    super.key,
    required this.value,
    required this.label,
    required this.increaseLabel,
    required this.decreaseLabel,
    required this.onIncrease,
    required this.onDecrease,
  });

  final int value;
  final String label, increaseLabel, decreaseLabel;
  final VoidCallback? onIncrease, onDecrease;

  @override
  Widget build(BuildContext context) => Wrap(
    alignment: WrapAlignment.spaceBetween,
    crossAxisAlignment: WrapCrossAlignment.center,
    spacing: 16.r,
    runSpacing: 12.r,
    children: [
      AppText(label, style: AppTextStyles.titleMedium(context)),
      Container(
        decoration: BoxDecoration(
          color: context.appColors.surfaceContainerLow,
          borderRadius: BorderRadius.circular(16).r,
          border: Border.all(
            color: context.appColors.outlineVariant.withValues(alpha: 0.35),
            width: 1.r,
          ),
        ),
        padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 3.h).r,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            AppBouncingTap(
              onTap: onDecrease,
              pressedScale: 0.88,
              child: Container(
                width: 32.r,
                height: 32.r,
                decoration: BoxDecoration(
                  color: onDecrease != null
                      ? context.appColors.primary.withValues(alpha: 0.1)
                      : context.appColors.surfaceContainerHighest.withValues(
                          alpha: 0.5,
                        ),
                  borderRadius: BorderRadius.circular(10).r,
                ),
                child: Icon(
                  Icons.remove_rounded,
                  size: 16.r,
                  color: onDecrease != null
                      ? context.appColors.primary
                      : context.appColors.onSurface.withValues(alpha: 0.3),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 14.w).r,
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 180),
                transitionBuilder: (child, animation) =>
                    ScaleTransition(scale: animation, child: child),
                child: AppText(
                  '$value',
                  key: ValueKey<int>(value),
                  style: AppTextStyles.titleMedium(
                    context,
                  ).copyWith(fontWeight: FontWeight.w700),
                ),
              ),
            ),
            AppBouncingTap(
              onTap: onIncrease,
              pressedScale: 0.88,
              child: Container(
                width: 32.r,
                height: 32.r,
                decoration: BoxDecoration(
                  color: onIncrease != null
                      ? context.appColors.primary
                      : context.appColors.surfaceContainerHighest.withValues(
                          alpha: 0.5,
                        ),
                  borderRadius: BorderRadius.circular(10).r,
                ),
                child: Icon(
                  Icons.add_rounded,
                  size: 16.r,
                  color: onIncrease != null
                      ? context.appColors.onPrimary
                      : context.appColors.onSurface.withValues(alpha: 0.3),
                ),
              ),
            ),
          ],
        ),
      ),
    ],
  );
}
