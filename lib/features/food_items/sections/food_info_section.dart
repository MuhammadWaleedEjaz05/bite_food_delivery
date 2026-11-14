import 'package:material_ui/material_ui.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:bite_food_delivery/core/extensions/responsive_extensions.dart';
import 'package:bite_food_delivery/core/extensions/price_format.dart';
import 'package:bite_food_delivery/core/extensions/theme_extensions.dart';
import 'package:bite_food_delivery/app/theme/app_text_styles.dart';
import 'package:bite_food_delivery/widgets/app_text.dart';
import 'package:bite_food_delivery/features/food_items/bloc/food_details_cubit.dart';
import 'package:bite_food_delivery/features/food_items/widgets/food_quick_metrics_row.dart';
import 'package:bite_food_delivery/features/food_items/widgets/food_details_courier_snippet.dart';

class FoodInfoSection extends StatelessWidget {
  const FoodInfoSection({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<FoodDetailsCubit>();
    final item = cubit.arguments.item;
    final colors = context.appColors;

    return SliverPadding(
      padding: context.contentInsets(bottom: 12),
      sliver: SliverToBoxAdapter(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (cubit.arguments.restaurantName.isNotEmpty) ...[
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h).r,
                decoration: BoxDecoration(
                  color: colors.primary.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(16).r,
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.storefront_rounded,
                      size: 14.r,
                      color: colors.primary,
                    ),
                    5.horizontalSpace,
                    Flexible(
                      child: AppText(
                        cubit.arguments.restaurantName,
                        style: AppTextStyles.labelMedium(context).copyWith(
                          color: colors.primary,
                          fontWeight: FontWeight.w700,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
              8.verticalSpace,
            ],
            AppText(
              item.name,
              style: AppTextStyles.headlineMedium(
                context,
              ).copyWith(fontWeight: FontWeight.w800),
            ),
            12.verticalSpace,
            // Bold price pill & freshness badge
            Wrap(
              crossAxisAlignment: WrapCrossAlignment.center,
              spacing: 10.w,
              runSpacing: 8.h,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 14.w,
                    vertical: 6.h,
                  ).r,
                  decoration: BoxDecoration(
                    color: colors.primary,
                    borderRadius: BorderRadius.circular(20).r,
                    boxShadow: [
                      BoxShadow(
                        color: colors.primary.withValues(alpha: 0.3),
                        blurRadius: 10.r,
                        offset: Offset(0, 4.h),
                      ),
                    ],
                  ),
                  child: AppText(
                    context.priceLabel(item.price),
                    style: AppTextStyles.headlineSmall(context).copyWith(
                      fontWeight: FontWeight.w900,
                      color: Colors.white,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 10.w,
                    vertical: 5.h,
                  ).r,
                  decoration: BoxDecoration(
                    color: colors.surfaceContainerHighest,
                    borderRadius: BorderRadius.circular(14).r,
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      AppText(
                        'Nutrition',
                        style: AppTextStyles.labelSmall(context).copyWith(
                          fontWeight: FontWeight.w700,
                          fontSize: 11.sp,
                        ),
                      ),
                      4.horizontalSpace,
                      Icon(
                        Icons.info_outline_rounded,
                        size: 13.r,
                        color: colors.primary,
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 10.w,
                    vertical: 5.h,
                  ).r,
                  decoration: BoxDecoration(
                    color: const Color(0xFF00C853).withValues(alpha: 0.12),
                    borderRadius: BorderRadius.circular(14).r,
                    border: Border.all(
                      color: const Color(0xFF00C853).withValues(alpha: 0.3),
                      width: 1.r,
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        width: 6.r,
                        height: 6.r,
                        decoration: const BoxDecoration(
                          color: Color(0xFF00C853),
                          shape: BoxShape.circle,
                        ),
                      ),
                      6.horizontalSpace,
                      AppText(
                        'Freshly Prepared',
                        style: AppTextStyles.labelSmall(context).copyWith(
                          color: const Color(0xFF00C853),
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            10.verticalSpace,
            // Quick metrics row (⭐ 4.6 · ⏱ 20-25 min · 🔥 320 Kcal)
            const FoodQuickMetricsRow(),
            if (item.description.isNotEmpty) ...[
              10.verticalSpace,
              AppText(
                'Description',
                style: AppTextStyles.titleMedium(
                  context,
                ).copyWith(fontWeight: FontWeight.bold),
              ),
              4.verticalSpace,
              AppText(
                item.description,
                style: AppTextStyles.bodyMedium(
                  context,
                ).copyWith(color: colors.onSurfaceVariant, height: 1.4),
              ),
            ],
            10.verticalSpace,
            // Courier snippet card
            const FoodDetailsCourierSnippet(),
          ],
        ),
      ),
    );
  }
}
