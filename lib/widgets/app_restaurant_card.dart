import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:bite_food_delivery/widgets/app_bouncing_tap.dart';
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
    this.favouriteButton,
  });

  final String name, imageUrl, category, rating, deliveryTime, deliveryFee;
  final VoidCallback onTap;
  final Widget? favouriteButton;

  @override
  Widget build(BuildContext context) {
    final dark = Theme.of(context).brightness == Brightness.dark;

    return AppBouncingTap(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: context.appColors.surfaceContainerLow,
          borderRadius: BorderRadius.circular(22).r,
          border: Border.all(
            color: context.appColors.outlineVariant.withValues(
              alpha: dark ? 0.25 : 0.45,
            ),
            width: 1.r,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: dark ? 0.28 : 0.04),
              blurRadius: 16.r,
              offset: Offset(0, 6.h),
            ),
            BoxShadow(
              color: context.appColors.primary.withValues(
                alpha: dark ? 0.04 : 0.02,
              ),
              blurRadius: 24.r,
              offset: Offset(0, 10.h),
            ),
          ],
        ),
        clipBehavior: Clip.antiAlias,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                AppNetworkImage(
                  url: imageUrl,
                  height: 160.r,
                  width: double.infinity,
                  radius: 0,
                ),
                Positioned.fill(
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.black.withValues(alpha: 0.25),
                          Colors.transparent,
                          Colors.black.withValues(alpha: 0.55),
                        ],
                      ),
                    ),
                  ),
                ),
                if (favouriteButton != null)
                  Positioned(
                    top: 10.r,
                    right: 10.r,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.black.withValues(alpha: 0.4),
                        shape: BoxShape.circle,
                      ),
                      child: favouriteButton!,
                    ),
                  ),
                Positioned(
                  bottom: 10.r,
                  left: 10.r,
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 8.w,
                      vertical: 4.h,
                    ).r,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16).r,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.18),
                          blurRadius: 6.r,
                          offset: Offset(0, 2.h),
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.star_rounded,
                          color: const Color(0xFFFFB800),
                          size: 15.r,
                        ),
                        4.horizontalSpace,
                        AppText(
                          rating,
                          style: AppTextStyles.labelMedium(context).copyWith(
                            color: const Color(0xFF141416),
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(12.r),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppText(
                    name,
                    style: AppTextStyles.titleMedium(
                      context,
                    ).copyWith(fontWeight: FontWeight.bold),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  4.verticalSpace,
                  AppText(
                    category,
                    style: AppTextStyles.bodySmall(
                      context,
                    ).copyWith(color: context.appColors.onSurfaceVariant),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  10.verticalSpace,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: Wrap(
                          spacing: 8.w,
                          runSpacing: 6.h,
                          children: [
                            _MetadataChip(
                              icon: Icons.schedule_rounded,
                              label: deliveryTime,
                            ),
                            _MetadataChip(
                              icon: Icons.delivery_dining_rounded,
                              label: deliveryFee,
                            ),
                          ],
                        ),
                      ),
                      8.horizontalSpace,
                      Container(
                        padding: EdgeInsets.all(7.r),
                        decoration: BoxDecoration(
                          color: dark ? Colors.white : const Color(0xFF141416),
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.arrow_forward_rounded,
                          size: 13.r,
                          color: dark ? const Color(0xFF141416) : Colors.white,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _MetadataChip extends StatelessWidget {
  const _MetadataChip({required this.icon, required this.label});
  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) => Container(
    padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 3.h).r,
    decoration: BoxDecoration(
      color: context.appColors.surfaceContainerHighest.withValues(alpha: 0.6),
      borderRadius: BorderRadius.circular(8).r,
    ),
    child: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 14.r, color: context.appColors.onSurfaceVariant),
        4.horizontalSpace,
        Flexible(
          child: AppText(
            label,
            style: AppTextStyles.labelSmall(
              context,
            ).copyWith(color: context.appColors.onSurfaceVariant),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    ),
  );
}
