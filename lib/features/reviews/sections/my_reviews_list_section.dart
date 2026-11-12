import 'package:bite_food_delivery/app/routes/app_navigation.dart';
import 'package:bite_food_delivery/core/extensions/responsive_extensions.dart';
import 'package:bite_food_delivery/features/restaurants/bloc/restaurants_cubit.dart';
import 'package:bite_food_delivery/features/reviews/bloc/rating_and_review_cubit.dart';
import 'package:bite_food_delivery/features/reviews/bloc/rating_and_review_state.dart';
import 'package:bite_food_delivery/features/reviews/widgets/review_card.dart';
import 'package:bite_food_delivery/l10n/app_localizations.dart';
import 'package:bite_food_delivery/widgets/app_feedback.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyReviewsListSection extends StatelessWidget {
  const MyReviewsListSection({super.key});

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context)!;
    final cubit = context.read<RatingAndReviewCubit>();
    final restaurantsCubit = context.read<RestaurantsCubit>();

    return SliverPadding(
      padding: context.contentInsets(bottom: 24),
      sliver: BlocBuilder<RatingAndReviewCubit, RatingAndReviewState>(
        builder: (context, state) {
          if (state is RatingAndReviewLoading) {
            return const SliverToBoxAdapter(child: AppLoadingCard());
          }
          if (state is RatingAndReviewError) {
            return SliverToBoxAdapter(
              child: AppFeedback(
                message: state.message,
                actionLabel: t.retryAction,
                onAction: cubit.init,
              ),
            );
          }
          if (state is RatingAndReviewLoaded) {
            final reviews = state.reviews;
            if (reviews.isEmpty) {
              return SliverToBoxAdapter(
                child: AppFeedback(
                  message: t.noReviewsYet,
                  icon: Icons.rate_review_outlined,
                  actionLabel: t.browseRestaurants,
                  onAction: () =>
                      AppNavigation.push(context, '/all_restaurants_screen'),
                ),
              );
            }
            return SliverList.separated(
              itemCount: reviews.length,
              separatorBuilder: (_, _) => 12.verticalSpace,
              itemBuilder: (context, index) {
                final review = reviews[index];
                final rName = restaurantsCubit.getRestaurantNameById(
                  review.restaurantId,
                );
                return ReviewCard(review: review, restaurantName: rName);
              },
            );
          }
          return const SliverToBoxAdapter(child: SizedBox.shrink());
        },
      ),
    );
  }
}
