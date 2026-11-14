import 'package:material_ui/material_ui.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:bite_food_delivery/core/extensions/theme_extensions.dart';
import 'package:bite_food_delivery/widgets/app_text.dart';
import 'package:bite_food_delivery/app/theme/app_text_styles.dart';

class FoodQuickMetricsRow extends StatelessWidget {
  const FoodQuickMetricsRow({
    super.key,
    this.rating = '4.6',
    this.duration = '20-25 min',
    this.calories = '320 Kcal',
  });

  final String rating;
  final String duration;
  final String calories;

  @override
  Widget build(BuildContext context) {
    final colors = context.appColors;
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final pillBg = isDark
        ? colors.surfaceContainerHighest.withValues(alpha: 0.5)
        : colors.surfaceContainerLowest;

    return Wrap(
      spacing: 10.w,
      runSpacing: 8.h,
      children: [
        _MetricPill(
          icon: Icons.star_rounded,
          iconColor: const Color(0xFFFFB800),
          label: rating,
          bgColor: pillBg,
        ),
        _MetricPill(
          icon: Icons.access_time_rounded,
          iconColor: colors.primary,
          label: duration,
          bgColor: pillBg,
        ),
        _MetricPill(
          icon: Icons.local_fire_department_rounded,
          iconColor: const Color(0xFFFF5222),
          label: calories,
          bgColor: pillBg,
        ),
      ],
    );
  }
}

class _MetricPill extends StatelessWidget {
  const _MetricPill({
    required this.icon,
    required this.iconColor,
    required this.label,
    required this.bgColor,
  });

  final IconData icon;
  final Color iconColor;
  final String label;
  final Color bgColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 6.h).r,
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(20).r,
        border: Border.all(
          color: context.appColors.outlineVariant.withValues(alpha: 0.35),
          width: 1.r,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 16.r, color: iconColor),
          6.horizontalSpace,
          AppText(
            label,
            style: AppTextStyles.labelMedium(
              context,
            ).copyWith(fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }
}
