import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:bite_food_delivery/widgets/app_text.dart';
import 'package:bite_food_delivery/widgets/app_network_image.dart';
import 'package:bite_food_delivery/app/theme/app_text_styles.dart';
import 'package:bite_food_delivery/core/extensions/theme_extensions.dart';

class AppRestaurantCard extends StatelessWidget {
  const AppRestaurantCard({
    super.key,
    required this.name,
    required this.imageUrl,
    required this.category,
    required this.rating,
    required this.deliveryTime,
    required this.deliveryFee,
    required this.onTap,
  });
  final String name, imageUrl, category, rating, deliveryTime, deliveryFee;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) => Material(
    color: context.appColors.surfaceContainerLow,
    borderRadius: BorderRadius.circular(24).r,
    clipBehavior: Clip.antiAlias,
    child: InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(12).r,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppNetworkImage(
              url: imageUrl,
              height: 170.r,
              width: double.infinity,
              radius: 16,
            ),
            14.verticalSpace,
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: AppText(
                    name,
                    style: AppTextStyles.titleMedium(context),
                    maxLines: 2,
                  ),
                ),
                8.horizontalSpace,
                Icon(
                  Icons.star_rounded,
                  color: context.appColors.primary,
                  size: 18.r,
                ),
                4.horizontalSpace,
                AppText(rating, style: AppTextStyles.labelLarge(context)),
              ],
            ),
            4.verticalSpace,
            AppText(
              category,
              style: AppTextStyles.bodyMedium(
                context,
              ).copyWith(color: context.appColors.onSurfaceVariant),
              maxLines: 2,
            ),
            12.verticalSpace,
            Wrap(
              spacing: 16.r,
              runSpacing: 8.r,
              children: [
                _Metadata(icon: Icons.schedule_rounded, label: deliveryTime),
                _Metadata(
                  icon: Icons.delivery_dining_rounded,
                  label: deliveryFee,
                ),
              ],
            ),
            4.verticalSpace,
          ],
        ),
      ),
    ),
  );
}

class _Metadata extends StatelessWidget {
  const _Metadata({required this.icon, required this.label});
  final IconData icon;
  final String label;
  @override
  Widget build(BuildContext context) => Row(
    mainAxisSize: MainAxisSize.min,
    children: [
      Icon(icon, size: 18.r, color: context.appColors.onSurfaceVariant),
      6.horizontalSpace,
      Flexible(
        child: AppText(
          label,
          style: AppTextStyles.labelSmall(
            context,
          ).copyWith(color: context.appColors.onSurfaceVariant),
        ),
      ),
    ],
  );
}
