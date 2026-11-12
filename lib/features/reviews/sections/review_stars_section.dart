import 'package:bite_food_delivery/app/theme/app_text_styles.dart';
import 'package:bite_food_delivery/core/extensions/responsive_extensions.dart';
import 'package:bite_food_delivery/core/extensions/theme_extensions.dart';
import 'package:bite_food_delivery/features/reviews/bloc/review_editor_cubit.dart';
import 'package:bite_food_delivery/features/reviews/bloc/review_editor_state.dart';
import 'package:bite_food_delivery/features/reviews/widgets/star_rating_bar.dart';
import 'package:bite_food_delivery/l10n/app_localizations.dart';
import 'package:bite_food_delivery/widgets/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ReviewStarsSection extends StatelessWidget {
  const ReviewStarsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = context.appColors;
    final t = AppLocalizations.of(context)!;
    final cubit = context.read<ReviewEditorCubit>();

    return SliverPadding(
      padding: context.contentInsets(bottom: 20),
      sliver: SliverToBoxAdapter(
        child: BlocBuilder<ReviewEditorCubit, ReviewEditorState>(
          builder: (context, state) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Order Rating Card
                Container(
                  padding: const EdgeInsets.all(18).r,
                  decoration: BoxDecoration(
                    color: colors.surfaceContainerLow,
                    borderRadius: BorderRadius.circular(20).r,
                    border: Border.all(color: colors.outlineVariant, width: 1),
                  ),
                  child: Column(
                    children: [
                      AppText(
                        t.rateOrder,
                        style: AppTextStyles.titleMedium(context),
                      ),
                      12.verticalSpace,
                      StarRatingBar(
                        rating: state.orderRating,
                        size: 32.r,
                        spacing: 8,
                        onRatingChanged: cubit.setOrderRating,
                      ),
                      8.verticalSpace,
                      AppText(
                        '${state.orderRating.toStringAsFixed(1)} / 5.0',
                        style: AppTextStyles.labelLarge(context).copyWith(
                          color: colors.primary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                16.verticalSpace,
                // Restaurant Rating Card
                Container(
                  padding: const EdgeInsets.all(18).r,
                  decoration: BoxDecoration(
                    color: colors.surfaceContainerLow,
                    borderRadius: BorderRadius.circular(20).r,
                    border: Border.all(color: colors.outlineVariant, width: 1),
                  ),
                  child: Column(
                    children: [
                      AppText(
                        t.rateRestaurant,
                        style: AppTextStyles.titleMedium(context),
                      ),
                      12.verticalSpace,
                      StarRatingBar(
                        rating: state.restaurantRating,
                        size: 32.r,
                        spacing: 8,
                        onRatingChanged: cubit.setRestaurantRating,
                      ),
                      8.verticalSpace,
                      AppText(
                        '${state.restaurantRating.toStringAsFixed(1)} / 5.0',
                        style: AppTextStyles.labelLarge(context).copyWith(
                          color: colors.primary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
