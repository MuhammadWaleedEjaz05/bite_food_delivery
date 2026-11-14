import 'package:material_ui/material_ui.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:bite_food_delivery/features/restaurants/models/restaurants_model.dart';
import 'package:bite_food_delivery/widgets/app_network_image.dart';
import 'package:bite_food_delivery/widgets/app_text.dart';
import 'package:bite_food_delivery/app/theme/app_text_styles.dart';

class RestaurantHeroBanner extends StatelessWidget {
  const RestaurantHeroBanner({
    super.key,
    required this.restaurant,
  });

  final RestaurantModel restaurant;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 220.r,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(26).r,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.12),
            blurRadius: 18.r,
            offset: Offset(0, 8.h),
          ),
        ],
      ),
      clipBehavior: Clip.antiAlias,
      child: Stack(
        fit: StackFit.expand,
        children: [
          // Background Hero Food Cover Image
          AppNetworkImage(
            url: restaurant.logoUrl,
            height: 220.r,
            width: double.infinity,
            radius: 26,
            fit: BoxFit.cover,
          ),

          // Cinematic Contrast Scrim Gradient
          DecoratedBox(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.black.withValues(alpha: 0.4),
                  Colors.transparent,
                  Colors.black.withValues(alpha: 0.75),
                ],
                stops: const [0.0, 0.45, 1.0],
              ),
            ),
          ),

          // Top Floating Chips: Status & Category
          Positioned(
            top: 12.r,
            left: 12.r,
            right: 12.r,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Live Status Pill
                Flexible(
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 8.w,
                      vertical: 4.h,
                    ).r,
                    decoration: BoxDecoration(
                      color: const Color(0xFF141416).withValues(alpha: 0.8),
                      borderRadius: BorderRadius.circular(20).r,
                      border: Border.all(
                        color: Colors.white.withValues(alpha: 0.2),
                        width: 1.r,
                      ),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          width: 6.r,
                          height: 6.r,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: restaurant.isOpen
                                ? const Color(0xFF00E676)
                                : const Color(0xFFFF5252),
                          ),
                        ),
                        5.horizontalSpace,
                        Flexible(
                          child: AppText(
                            restaurant.isOpen ? 'OPEN' : 'CLOSED',
                            style: AppTextStyles.labelSmall(context).copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.w800,
                              fontSize: 10.sp,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                8.horizontalSpace,
                // Category Tag
                if (restaurant.category.isNotEmpty)
                  Flexible(
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 8.w,
                        vertical: 4.h,
                      ).r,
                      decoration: BoxDecoration(
                        color: Colors.white.withValues(alpha: 0.92),
                        borderRadius: BorderRadius.circular(20).r,
                      ),
                      child: AppText(
                        restaurant.category,
                        style: AppTextStyles.labelSmall(context).copyWith(
                          color: const Color(0xFF141416),
                          fontWeight: FontWeight.w800,
                          fontSize: 10.sp,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
              ],
            ),
          ),

          // Bottom Floating Badge Row: Rating & Delivery Time
          Positioned(
            bottom: 12.r,
            left: 12.r,
            right: 12.r,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Star Rating Capsule
                Flexible(
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
                          size: 15.r,
                          color: const Color(0xFFFFB800),
                        ),
                        4.horizontalSpace,
                        AppText(
                          restaurant.rating.toStringAsFixed(1),
                          style: AppTextStyles.labelMedium(context).copyWith(
                            fontWeight: FontWeight.w900,
                            color: const Color(0xFF141416),
                          ),
                        ),
                        if (restaurant.reviewsCount > 0) ...[
                          4.horizontalSpace,
                          Flexible(
                            child: AppText(
                              '(${restaurant.reviewsCount})',
                              style: AppTextStyles.labelSmall(context).copyWith(
                                color: const Color(0xFF757575),
                                fontWeight: FontWeight.w600,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ],
                    ),
                  ),
                ),
                8.horizontalSpace,
                // Delivery Time Pill
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 8.w,
                    vertical: 4.h,
                  ).r,
                  decoration: BoxDecoration(
                    color: const Color(0xFF141416).withValues(alpha: 0.82),
                    borderRadius: BorderRadius.circular(16).r,
                    border: Border.all(
                      color: Colors.white.withValues(alpha: 0.18),
                      width: 1.r,
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.schedule_rounded,
                        size: 13.r,
                        color: Colors.white,
                      ),
                      4.horizontalSpace,
                      AppText(
                        '${restaurant.deliveryTime.round()} min',
                        style: AppTextStyles.labelSmall(context).copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 10.5.sp,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
