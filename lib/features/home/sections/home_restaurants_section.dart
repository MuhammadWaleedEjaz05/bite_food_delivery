import 'package:bite_food_delivery/app/routes/app_navigation.dart';
import 'package:bite_food_delivery/core/extensions/responsive_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:bite_food_delivery/l10n/app_localizations.dart';
import 'package:bite_food_delivery/features/restaurants/bloc/restaurants_cubit.dart';
import 'package:bite_food_delivery/widgets/app_section_heading.dart';
import 'package:bite_food_delivery/widgets/app_feedback.dart';
import 'package:bite_food_delivery/widgets/app_staggered_entrance.dart';
import 'package:bite_food_delivery/src/shared/widgets/bite_restaurant_card.dart';

class HomeRestaurantsSection extends StatelessWidget {
  const HomeRestaurantsSection({super.key});
  @override
  Widget build(BuildContext context) => SliverPadding(
    padding: context.contentInsets(),
    sliver: SliverMainAxisGroup(
      slivers: [
        SliverToBoxAdapter(
          child: AppSectionHeading(
            title: AppLocalizations.of(context)!.openRestaurants,
            actionLabel: AppLocalizations.of(context)!.seeAll,
            onAction: () =>
                AppNavigation.push(context, '/all_restaurants_screen'),
          ),
        ),
        BlocBuilder<RestaurantsCubit, RestaurantsState>(
          builder: (context, state) {
            final strings = AppLocalizations.of(context)!;
            if (state is RestaurantsLoaded) {
              return SliverMainAxisGroup(
                slivers: [
                  if (state.refreshFailed)
                    SliverToBoxAdapter(
                      child: AppFeedback(
                        message: strings.catalogRefreshFailure,
                        actionLabel: strings.retryAction,
                        onAction: context
                            .read<RestaurantsCubit>()
                            .loadRestaurants,
                      ),
                    ),
                  if (state.openRestaurants.isEmpty)
                    SliverToBoxAdapter(
                      child: AppFeedback(message: strings.noOpenRestaurants),
                    )
                  else
                    SliverList.separated(
                      itemCount: state.openRestaurants.length,
                      itemBuilder: (context, index) => AppStaggeredEntrance(
                        index: index,
                        child: BiteRestaurantCard(
                          restaurant: state.openRestaurants[index],
                        ),
                      ),
                      separatorBuilder: (_, _) => 16.verticalSpace,
                    ),
                ],
              );
            }
            return SliverToBoxAdapter(
              child: state is RestaurantsError
                  ? AppFeedback(
                      message: strings.catalogLoadFailure,
                      actionLabel: strings.retryAction,
                      onAction: context
                          .read<RestaurantsCubit>()
                          .loadRestaurants,
                    )
                  : const AppLoadingCard(),
            );
          },
        ),
      ],
    ),
  );
}
