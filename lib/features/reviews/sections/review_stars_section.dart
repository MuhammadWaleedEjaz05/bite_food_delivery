import 'package:bite_food_delivery/app/theme/app_text_styles.dart';
import 'package:bite_food_delivery/core/extensions/responsive_extensions.dart';
import 'package:bite_food_delivery/core/extensions/theme_extensions.dart';
import 'package:bite_food_delivery/features/reviews/bloc/review_editor_cubit.dart';
import 'package:bite_food_delivery/features/reviews/bloc/review_editor_state.dart';
import 'package:bite_food_delivery/features/reviews/widgets/star_rating_bar.dart';
import 'package:bite_food_delivery/l10n/app_localizations.dart';
import 'package:bite_food_delivery/widgets/app_text.dart';
import 'package:material_ui/material_ui.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ReviewStarsSection extends StatelessWidget {
  const ReviewStarsSection({super.key});

  String _ratingReaction(double rating) {
    if (rating >= 4.8) return '🤩 Exceptional!';
    if (rating >= 4.0) return '😋 Delicious!';
    if (rating >= 3.0) return '😐 Pretty Good';
    if (rating >= 2.0) return '😕 Could Be Better';
    return '😡 Disappointing';
  }

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
                      6.verticalSpace,
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 10.w,
                          vertical: 4.h,
                        ).r,
                        decoration: BoxDecoration(
                          color: colors.primary.withValues(alpha: 0.1),
                          borderRadius: BorderRadius.circular(12).r,
                        ),
                        child: AnimatedSwitcher(
                          duration: const Duration(milliseconds: 200),
                          child: AppText(
                            _ratingReaction(state.orderRating),
                            key: ValueKey(state.orderRating),
                            style: AppTextStyles.labelSmall(context).copyWith(
                              color: colors.primary,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
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
                      6.verticalSpace,
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 10.w,
                          vertical: 4.h,
                        ).r,
                        decoration: BoxDecoration(
                          color: colors.primary.withValues(alpha: 0.1),
                          borderRadius: BorderRadius.circular(12).r,
                        ),
                        child: AnimatedSwitcher(
                          duration: const Duration(milliseconds: 200),
                          child: AppText(
                            _ratingReaction(state.restaurantRating),
                            key: ValueKey(state.restaurantRating),
                            style: AppTextStyles.labelSmall(context).copyWith(
                              color: colors.primary,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
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
