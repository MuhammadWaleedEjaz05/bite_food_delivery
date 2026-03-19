import 'package:bite_food_delivery/l10n/app_localizations.dart';
import 'package:bite_food_delivery/src/features/categories/cubits/category_selection_cubit/category_selection_cubit.dart';
import 'package:bite_food_delivery/src/features/restaurants/cubits/filter_restaurants_cubit/filter_restaurants_cubit.dart';
import 'package:bite_food_delivery/src/features/restaurants/cubits/restaurants_cubit/restaurants_cubit.dart';
import 'package:bite_food_delivery/src/shared/widgets/bite_app_bar.dart';
import 'package:bite_food_delivery/src/features/categories/widgets/bite_drop_down_menu.dart';
import 'package:bite_food_delivery/src/features/categories/widgets/bite_filter_modal.dart';
import 'package:bite_food_delivery/src/shared/widgets/bite_heading.dart';
import 'package:bite_food_delivery/src/shared/widgets/bite_restaurant_card.dart';
import 'package:bite_food_delivery/src/shared/widgets/bite_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const _AppBarSection(),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 15.w),
        children: [
          BiteHeading(
            title: AppLocalizations.of(context)!.openRestaurants,
            isSeeAll: false,
          ),
          20.verticalSpace,
          BlocBuilder<CategorySelectionCubit, String>(
            builder: (context, selectedCategory) {
              return BlocBuilder<
                FilterRestaurantsCubit,
                FilterRestaurantsState
              >(
                builder: (context, filterState) {
                  return BlocBuilder<RestaurantsCubit, RestaurantsState>(
                    builder: (context, state) {
                      if (state is RestaurantsLoading) {
                        return Center(
                          child: Lottie.asset(
                            'assets/animations/loading.json',
                            height: 75.h,
                            width: 75.w,
                          ),
                        );
                      } else if (state is RestaurantsError) {
                        return Center(
                          child: Text(
                            AppLocalizations.of(
                              context,
                            )!.errorStatemessage(state.message),
                          ),
                        );
                      } else if (state is RestaurantsLoaded) {
                        final filteredRestaurants = state.restaurants.where((
                          restaurant,
                        ) {
                          final isCategoryMatch =
                              selectedCategory.isEmpty ||
                              restaurant.category.toLowerCase() ==
                                  selectedCategory.toLowerCase();
                          final isRatingMatch = _isRatingMatch(
                            restaurant.rating,
                            filterState.ratingRange,
                          );
                          final isDeliveryTimeMatch = _isDeliveryTimeMatch(
                            restaurant.deliveryTime,
                            filterState.deliveryTimeRange,
                          );
                          return isCategoryMatch &&
                              isRatingMatch &&
                              isDeliveryTimeMatch;
                        }).toList();

                        return ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: filteredRestaurants.length,
                          itemBuilder: (context, index) {
                            final restaurant = filteredRestaurants[index];
                            return Padding(
                              padding: EdgeInsets.symmetric(vertical: 10.h),
                              child: BiteRestaurantCard(restaurant: restaurant),
                            );
                          },
                        );
                      } else {
                        return const SizedBox();
                      }
                    },
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }

  bool _isRatingMatch(double rating, RatingFilterRange? range) {
    if (range == null) {
      return true;
    }
    if (range == RatingFilterRange.below35) {
      return rating < 3.5;
    } else if (range == RatingFilterRange.between35And40) {
      return rating >= 3.5 && rating <= 4.0;
    }
    return rating > 4.0;
  }

  bool _isDeliveryTimeMatch(
    double deliveryTime,
    DeliveryTimeFilterRange? range,
  ) {
    if (range == null) {
      return true;
    }
    if (range == DeliveryTimeFilterRange.under15) {
      return deliveryTime < 15;
    } else if (range == DeliveryTimeFilterRange.between15And30) {
      return deliveryTime >= 15 && deliveryTime <= 30;
    }
    return deliveryTime > 30;
  }
}

class _AppBarSection extends StatelessWidget implements PreferredSizeWidget {
  const _AppBarSection();
  @override
  Size get preferredSize => Size.fromHeight(100.h);

  @override
  Widget build(BuildContext context) {
    return BiteAppBar(
      backButton: true,
      title: const BiteDropDownMenu(),
      actions: [
        IconButton(
          onPressed: () =>
              showSearch(context: context, delegate: OpenSearchScreen()),
          style: IconButton.styleFrom(
            foregroundColor: Theme.of(context).colorScheme.surface,
            backgroundColor: Theme.of(context).colorScheme.onSurface,
          ),
          icon: Icon(Icons.search_outlined, size: 30.r),
        ),
        15.horizontalSpace,
        IconButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) => Dialog(
                backgroundColor: Theme.of(context).colorScheme.surface,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.r),
                ),
                child: const BiteFilterModal(),
              ),
            );
          },
          style: IconButton.styleFrom(
            foregroundColor: Theme.of(context).colorScheme.onSurface,
            backgroundColor: Theme.of(context).colorScheme.onSecondaryFixed,
          ),
          icon: Icon(Icons.filter_alt_outlined, size: 30.r),
        ),
        15.horizontalSpace,
      ],
    );
  }
}
