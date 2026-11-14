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
      padding: context.contentInsets(bottom: 20),
      sliver: SliverToBoxAdapter(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (cubit.arguments.restaurantName.isNotEmpty) ...[
              AppText(
                cubit.arguments.restaurantName,
                style: AppTextStyles.labelLarge(
                  context,
                ).copyWith(color: colors.primary, fontWeight: FontWeight.w600),
              ),
              6.verticalSpace,
            ],
            AppText(
              item.name,
              style: AppTextStyles.headlineMedium(
                context,
              ).copyWith(fontWeight: FontWeight.w800),
            ),
            10.verticalSpace,
            // Bold price pill
            AppText(
              context.priceLabel(item.price),
              style: AppTextStyles.headlineSmall(
                context,
              ).copyWith(fontWeight: FontWeight.w900, color: colors.onSurface),
            ),
            14.verticalSpace,
            // Quick metrics row (⭐ 4.6 · ⏱ 20-25 min · 🔥 320 Kcal)
            const FoodQuickMetricsRow(),
            16.verticalSpace,
            // Courier snippet card
            const FoodDetailsCourierSnippet(),
            if (item.description.isNotEmpty) ...[
              18.verticalSpace,
              AppText(
                'Description',
                style: AppTextStyles.titleMedium(
                  context,
                ).copyWith(fontWeight: FontWeight.bold),
              ),
              8.verticalSpace,
              AppText(
                item.description,
                style: AppTextStyles.bodyMedium(
                  context,
                ).copyWith(color: colors.onSurfaceVariant, height: 1.5),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
