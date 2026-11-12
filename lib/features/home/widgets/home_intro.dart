import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:bite_food_delivery/app/routes/app_navigation.dart';
import 'package:bite_food_delivery/widgets/app_bouncing_tap.dart';
import 'package:bite_food_delivery/widgets/app_text.dart';
import 'package:bite_food_delivery/app/theme/app_text_styles.dart';
import 'package:bite_food_delivery/core/extensions/theme_extensions.dart';

class HomeIntro extends StatelessWidget {
  const HomeIntro({super.key, required this.headline, required this.subtitle});
  final String headline, subtitle;

  @override
  Widget build(BuildContext context) {
    final dark = Theme.of(context).brightness == Brightness.dark;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h).r,
          decoration: BoxDecoration(
            color: context.appColors.primary.withValues(alpha: 0.12),
            borderRadius: BorderRadius.circular(20).r,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.bolt_rounded,
                size: 14.r,
                color: context.appColors.primary,
              ),
              4.horizontalSpace,
              Flexible(
                child: AppText(
                  'INSTANT DELIVERY',
                  style: AppTextStyles.labelSmall(context).copyWith(
                    color: context.appColors.primary,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 0.8,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
        8.verticalSpace,
        AppText(
          headline,
          style: AppTextStyles.headlineLarge(
            context,
          ).copyWith(fontWeight: FontWeight.w800),
        ),
        6.verticalSpace,
        AppText(
          subtitle,
          style: AppTextStyles.bodyMedium(
            context,
          ).copyWith(color: context.appColors.onSurfaceVariant),
        ),
        16.verticalSpace,
        AppBouncingTap(
          onTap: () => AppNavigation.push(context, '/all_restaurants_screen'),
          child: Container(
            width: double.infinity,
            padding: EdgeInsets.all(16.r),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: dark
                    ? [
                        context.appColors.primary.withValues(alpha: 0.85),
                        context.appColors.primaryContainer,
                      ]
                    : [
                        context.appColors.primary,
                        context.appColors.primary.withValues(alpha: 0.82),
                      ],
              ),
              borderRadius: BorderRadius.circular(22).r,
              boxShadow: [
                BoxShadow(
                  color: context.appColors.primary.withValues(alpha: 0.35),
                  blurRadius: 18.r,
                  offset: Offset(0, 8.h),
                ),
              ],
            ),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 8.w,
                          vertical: 3.h,
                        ).r,
                        decoration: BoxDecoration(
                          color: Colors.white.withValues(alpha: 0.22),
                          borderRadius: BorderRadius.circular(8).r,
                        ),
                        child: AppText(
                          'LIMITED TIME',
                          style: AppTextStyles.labelSmall(context).copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            letterSpacing: 0.5,
                          ),
                        ),
                      ),
                      6.verticalSpace,
                      AppText(
                        'Up to 30% OFF Your Favorite Meals',
                        style: AppTextStyles.titleMedium(context).copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      4.verticalSpace,
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Flexible(
                            child: AppText(
                              'Order now',
                              style: AppTextStyles.labelMedium(context)
                                  .copyWith(
                                    color: Colors.white.withValues(alpha: 0.9),
                                    fontWeight: FontWeight.w600,
                                  ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          4.horizontalSpace,
                          Icon(
                            Icons.arrow_forward_rounded,
                            size: 14.r,
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                12.horizontalSpace,
                Container(
                  padding: EdgeInsets.all(12.r),
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.18),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.fastfood_rounded,
                    color: Colors.white,
                    size: 28.r,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
