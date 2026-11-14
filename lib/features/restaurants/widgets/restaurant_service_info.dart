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
  Widget build(BuildContext context) => Wrap(
    spacing: 12.r,
    runSpacing: 10.r,
    children: [
      _ServiceBadge(icon: Icons.star_rounded, label: rating),
      _ServiceBadge(icon: Icons.schedule_outlined, label: time),
      _ServiceBadge(icon: Icons.delivery_dining, label: fee),
      _ServiceBadge(icon: Icons.storefront_outlined, label: status),
    ],
  );
}

class _ServiceBadge extends StatelessWidget {
  const _ServiceBadge({required this.icon, required this.label});
  final IconData icon;
  final String label;
  @override
  Widget build(BuildContext context) => DecoratedBox(
    decoration: BoxDecoration(
      color: context.appColors.surfaceContainerLow,
      borderRadius: BorderRadius.circular(14).r,
      border: Border.all(
        color: context.appColors.outlineVariant.withValues(alpha: 0.6),
        width: 1,
      ),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withValues(alpha: 0.02),
          blurRadius: 4.r,
          offset: Offset(0, 1.r),
        ),
      ],
    ),
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8).r,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 16.r, color: context.appColors.primary),
          6.horizontalSpace,
          Flexible(
            child: AppText(
              label,
              style: AppTextStyles.labelSmall(
                context,
              ).copyWith(fontWeight: FontWeight.w600),
            ),
          ),
        ],
      ),
    ),
  );
}
