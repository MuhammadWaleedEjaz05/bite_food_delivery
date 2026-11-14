import 'package:material_ui/material_ui.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:bite_food_delivery/widgets/app_text.dart';
import 'package:bite_food_delivery/app/theme/app_text_styles.dart';
import 'package:bite_food_delivery/core/extensions/theme_extensions.dart';

class RestaurantServiceInfo extends StatelessWidget {
  const RestaurantServiceInfo({
    super.key,
    required this.rating,
    required this.time,
    required this.fee,
    required this.status,
  });
  final String rating, time, fee, status;

  @override
  Widget build(BuildContext context) {
    final colors = context.appColors;

    return Wrap(
      spacing: 10.w,
      runSpacing: 8.h,
      children: [
        _ServiceBadge(
          icon: Icons.star_rounded,
          label: rating,
          iconColor: const Color(0xFFFFB800),
        ),
        _ServiceBadge(
          icon: Icons.access_time_rounded,
          label: time,
          iconColor: colors.primary,
        ),
        _ServiceBadge(
          icon: Icons.delivery_dining_rounded,
          label: fee,
          iconColor: const Color(0xFF00C853),
        ),
        _ServiceBadge(
          icon: Icons.storefront_rounded,
          label: status,
          iconColor: colors.primary,
        ),
      ],
    );
  }
}

class _ServiceBadge extends StatelessWidget {
  const _ServiceBadge({
    required this.icon,
    required this.label,
    this.iconColor,
  });
  final IconData icon;
  final String label;
  final Color? iconColor;

  @override
  Widget build(BuildContext context) {
    final colors = context.appColors;
    final effectiveColor = iconColor ?? colors.primary;

    return DecoratedBox(
      decoration: BoxDecoration(
        color: colors.surfaceContainerLow,
        borderRadius: BorderRadius.circular(16).r,
        border: Border.all(
          color: colors.outlineVariant.withValues(alpha: 0.5),
          width: 1.r,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.03),
            blurRadius: 6.r,
            offset: Offset(0, 2.h),
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h).r,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 16.r, color: effectiveColor),
            6.horizontalSpace,
            Flexible(
              child: AppText(
                label,
                style: AppTextStyles.labelSmall(
                  context,
                ).copyWith(fontWeight: FontWeight.w700),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
