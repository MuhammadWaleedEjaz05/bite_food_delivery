import 'package:material_ui/material_ui.dart';
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
      pressedScale: 0.97,
      child: Container(
        decoration: BoxDecoration(
          color: dark
              ? const Color(0xFF181820)
              : Colors.white,
          borderRadius: BorderRadius.circular(26).r,
          border: Border.all(
            color: dark
                ? Colors.white.withValues(alpha: 0.1)
                : const Color(0xFFEEEEEE),
            width: 1.r,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: dark ? 0.35 : 0.06),
              blurRadius: 18.r,
              offset: Offset(0, 6.h),
            ),
          ],
        ),
        clipBehavior: Clip.antiAlias,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Top Hero Image Stage
            Stack(
              children: [
                AppNetworkImage(
                  url: imageUrl,
                  height: 165.r,
                  width: double.infinity,
                  radius: 0,
                  fit: BoxFit.cover,
                ),
                Positioned.fill(
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.black.withValues(alpha: 0.32),
                          Colors.transparent,
                          Colors.black.withValues(alpha: 0.52),
                        ],
                      ),
                    ),
                  ),
                ),
                // Top-Left Fast Delivery Tag
                Positioned(
                  top: 10.r,
                  left: 10.r,
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 8.w,
                      vertical: 4.h,
                    ).r,
                    decoration: BoxDecoration(
                      color: const Color(0xFF141416).withValues(alpha: 0.85),
                      borderRadius: BorderRadius.circular(14).r,
                      border: Border.all(
                        color: Colors.white.withValues(alpha: 0.15),
                        width: 1.r,
                      ),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.bolt_rounded,
                          size: 13.r,
                          color: const Color(0xFFFFB800),
                        ),
                        4.horizontalSpace,
                        AppText(
                          'FEATURED',
                          style: AppTextStyles.labelSmall(context).copyWith(
                            color: Colors.white,
                            fontSize: 9.sp,
                            fontWeight: FontWeight.w800,
                            letterSpacing: 0.5,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                // Top-Right Favorite Button
                if (favouriteButton != null)
                  Positioned(
                    top: 10.r,
                    right: 10.r,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.black.withValues(alpha: 0.35),
                        shape: BoxShape.circle,
                      ),
                      child: favouriteButton!,
                    ),
                  ),
                // Bottom-Left Rating Pill
                Positioned(
                  bottom: 10.r,
                  left: 10.r,
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 9.w,
                      vertical: 4.h,
                    ).r,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16).r,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.2),
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
                            fontWeight: FontWeight.w900,
                            fontSize: 11.sp,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            // Bottom Metadata & Content Section
            Padding(
              padding: EdgeInsets.all(14.r),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: AppText(
                          name,
                          style: AppTextStyles.titleMedium(
                            context,
                          ).copyWith(
                            fontWeight: FontWeight.w900,
                            fontSize: 16.sp,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      8.horizontalSpace,
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 8.w,
                          vertical: 3.h,
                        ).r,
                        decoration: BoxDecoration(
                          color: context.appColors.primary.withValues(alpha: 0.1),
                          borderRadius: BorderRadius.circular(10).r,
                        ),
                        child: AppText(
                          category,
                          style: AppTextStyles.labelSmall(context).copyWith(
                            color: context.appColors.primary,
                            fontWeight: FontWeight.w800,
                            fontSize: 10.sp,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  12.verticalSpace,
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
                        width: 34.r,
                        height: 34.r,
                        decoration: BoxDecoration(
                          color: dark
                              ? Colors.white
                              : const Color(0xFF141416),
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withValues(alpha: 0.18),
                              blurRadius: 6.r,
                              offset: Offset(0, 2.h),
                            ),
                          ],
                        ),
                        child: Center(
                          child: Icon(
                            Icons.arrow_forward_rounded,
                            size: 15.r,
                            color: dark
                                ? const Color(0xFF141416)
                                : Colors.white,
                          ),
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
    padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h).r,
    decoration: BoxDecoration(
      color: context.appColors.surfaceContainerHighest.withValues(alpha: 0.55),
      borderRadius: BorderRadius.circular(10).r,
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
            ).copyWith(
              color: context.appColors.onSurfaceVariant,
              fontWeight: FontWeight.w600,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    ),
  );
}
