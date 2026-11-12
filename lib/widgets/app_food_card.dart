import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:bite_food_delivery/widgets/app_bouncing_tap.dart';
import 'package:bite_food_delivery/widgets/app_text.dart';
import 'package:bite_food_delivery/app/theme/app_text_styles.dart';
import 'package:bite_food_delivery/core/extensions/theme_extensions.dart';
import 'package:bite_food_delivery/widgets/app_network_image.dart';

class AppFoodCard extends StatelessWidget {
  const AppFoodCard({
    super.key,
    required this.name,
    required this.subtitle,
    required this.price,
    required this.imageUrl,
    required this.onTap,
    required this.availabilityLabel,
    this.available = true,
    this.compact = false,
  });

  final String name, subtitle, price, imageUrl, availabilityLabel;
  final bool available, compact;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final dark = Theme.of(context).brightness == Brightness.dark;

    return AppBouncingTap(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: context.appColors.surfaceContainerLow,
          borderRadius: BorderRadius.circular(20).r,
          border: Border.all(
            color: context.appColors.outlineVariant.withValues(
              alpha: dark ? 0.25 : 0.45,
            ),
            width: 1.r,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: dark ? 0.25 : 0.04),
              blurRadius: 14.r,
              offset: Offset(0, 5.h),
            ),
          ],
        ),
        clipBehavior: Clip.antiAlias,
        child: Padding(
          padding: EdgeInsets.all(10.r),
          child: compact
              ? Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: _FoodCardCopy(
                        name: name,
                        subtitle: subtitle,
                        price: price,
                        available: available,
                        availabilityLabel: availabilityLabel,
                      ),
                    ),
                    12.horizontalSpace,
                    AppNetworkImage(
                      url: imageUrl,
                      width: 84.r,
                      height: 88.r,
                      radius: 14,
                    ),
                  ],
                )
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AspectRatio(
                      aspectRatio: 4 / 3,
                      child: AppNetworkImage(
                        url: imageUrl,
                        width: double.infinity,
                        radius: 14,
                      ),
                    ),
                    10.verticalSpace,
                    _FoodCardCopy(
                      name: name,
                      subtitle: subtitle,
                      price: price,
                      available: available,
                      availabilityLabel: availabilityLabel,
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}

class _FoodCardCopy extends StatelessWidget {
  const _FoodCardCopy({
    required this.name,
    required this.subtitle,
    required this.price,
    required this.available,
    required this.availabilityLabel,
  });

  final String name, subtitle, price, availabilityLabel;
  final bool available;

  @override
  Widget build(BuildContext context) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      AppText(
        name,
        style: AppTextStyles.titleMedium(context),
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
      4.verticalSpace,
      AppText(
        subtitle,
        style: AppTextStyles.bodySmall(
          context,
        ).copyWith(color: context.appColors.onSurfaceVariant),
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
      ),
      8.verticalSpace,
      Wrap(
        spacing: 8.w,
        runSpacing: 4.h,
        crossAxisAlignment: WrapCrossAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 3.h).r,
            decoration: BoxDecoration(
              color: context.appColors.primary.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(8).r,
            ),
            child: AppText(
              price,
              style: AppTextStyles.labelMedium(
                context,
              ).copyWith(color: context.appColors.primary),
            ),
          ),
          if (!available)
            Container(
              padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 2.h).r,
              decoration: BoxDecoration(
                color: context.appColors.error.withValues(alpha: 0.12),
                borderRadius: BorderRadius.circular(6).r,
              ),
              child: AppText(
                availabilityLabel,
                style: AppTextStyles.labelSmall(
                  context,
                ).copyWith(color: context.appColors.error),
              ),
            ),
        ],
      ),
    ],
  );
}
