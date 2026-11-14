import 'package:bite_food_delivery/app/theme/app_text_styles.dart';
import 'package:bite_food_delivery/core/extensions/theme_extensions.dart';
import 'package:bite_food_delivery/widgets/app_text.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:material_ui/material_ui.dart';

class AppStepperPill extends StatelessWidget {
  const AppStepperPill({
    super.key,
    required this.quantity,
    this.onIncrease,
    this.onDecrease,
    this.compact = false,
  });

  final int quantity;
  final VoidCallback? onIncrease;
  final VoidCallback? onDecrease;
  final bool compact;

  @override
  Widget build(BuildContext context) {
    final colors = context.appColors;

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: compact ? 3.w : 6.w,
        vertical: compact ? 2.h : 3.h,
      ).r,
      decoration: BoxDecoration(
        color: colors.surfaceContainerHighest.withValues(alpha: 0.5),
        borderRadius: BorderRadius.circular(24).r,
        border: Border.all(
          color: colors.outlineVariant.withValues(alpha: 0.3),
          width: 1.r,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            icon: Icon(Icons.remove, size: compact ? 14.r : 16.r),
            visualDensity: VisualDensity.compact,
            padding: EdgeInsets.zero,
            constraints: BoxConstraints(
              minWidth: compact ? 24.r : 28.r,
              minHeight: compact ? 24.r : 28.r,
            ),
            onPressed: onDecrease,
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: compact ? 2.w : 4.w,
            ).r,
            child: AppText(
              quantity.toString().padLeft(2, '0'),
              style: (compact
                      ? AppTextStyles.labelMedium(context)
                      : AppTextStyles.labelLarge(context))
                  .copyWith(fontWeight: FontWeight.bold),
            ),
          ),
          IconButton(
            icon: Icon(Icons.add, size: compact ? 14.r : 16.r),
            visualDensity: VisualDensity.compact,
            padding: EdgeInsets.zero,
            constraints: BoxConstraints(
              minWidth: compact ? 24.r : 28.r,
              minHeight: compact ? 24.r : 28.r,
            ),
            onPressed: onIncrease,
          ),
        ],
      ),
    );
  }
}

