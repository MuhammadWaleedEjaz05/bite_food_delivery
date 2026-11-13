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
            padding: EdgeInsets.all(14.r),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: dark
                    ? [
                        context.appColors.primary,
                        context.appColors.primary.withValues(alpha: 0.75),
                      ]
                    : [context.appColors.primary, const Color(0xFFFF6D3A)],
              ),
              borderRadius: BorderRadius.circular(22).r,
              boxShadow: [
                BoxShadow(
                  color: context.appColors.primary.withValues(alpha: 0.38),
                  blurRadius: 18.r,
                  offset: Offset(0, 6.h),
                ),
              ],
            ),
            child: Stack(
              children: [
                Positioned(
                  right: -15.r,
                  bottom: -20.r,
                  child: Container(
                    width: 90.r,
                    height: 90.r,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white.withValues(alpha: 0.1),
                    ),
                  ),
                ),
                Row(
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
                              color: Colors.white.withValues(alpha: 0.25),
                              borderRadius: BorderRadius.circular(10).r,
                            ),
                            child: AppText(
                              'LIMITED TIME',
                              style: AppTextStyles.labelSmall(context).copyWith(
                                color: Colors.white,
                                fontWeight: FontWeight.w800,
                                letterSpacing: 0.5,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          6.verticalSpace,
                          AppText(
                            'Up to 30% OFF Your Favorite Meals',
                            style: AppTextStyles.titleMedium(context).copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.w800,
                              fontSize: 15.sp,
                            ),
                          ),
                          8.verticalSpace,
                          Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 8.w,
                              vertical: 3.5.h,
                            ).r,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20).r,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withValues(alpha: 0.12),
                                  blurRadius: 6.r,
                                  offset: Offset(0, 2.h),
                                ),
                              ],
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Flexible(
                                  child: AppText(
                                    'Order now',
                                    style: AppTextStyles.labelMedium(context)
                                        .copyWith(
                                          color: context.appColors.primary,
                                          fontWeight: FontWeight.w800,
                                        ),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                4.horizontalSpace,
                                Icon(
                                  Icons.arrow_forward_rounded,
                                  size: 13.r,
                                  color: context.appColors.primary,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    10.horizontalSpace,
                    Container(
                      padding: EdgeInsets.all(10.r),
                      decoration: BoxDecoration(
                        color: Colors.white.withValues(alpha: 0.22),
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Colors.white.withValues(alpha: 0.35),
                          width: 1.5.r,
                        ),
                      ),
                      child: Icon(
                        Icons.fastfood_rounded,
                        color: Colors.white,
                        size: 26.r,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
