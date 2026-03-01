import 'package:bite_food_delivery/Cubits/CategorySelectionCubit/category_selection_cubit.dart';
import 'package:bite_food_delivery/Cubits/FilterRestaurantsCubit/filter_restaurants_cubit.dart';
import 'package:bite_food_delivery/Cubits/RestaurantsCubit/restaurants_cubit.dart';
import 'package:bite_food_delivery/GlobalWidgets/bite_app_bar.dart';
import 'package:bite_food_delivery/Screens/CategoryPage/Widgets/bite_drop_down_menu.dart';
import 'package:bite_food_delivery/Screens/CategoryPage/Widgets/bite_filter_modal.dart';
import 'package:bite_food_delivery/GlobalWidgets/bite_heading.dart';
import 'package:bite_food_delivery/GlobalWidgets/bite_restaurant_card.dart';
import 'package:bite_food_delivery/GlobalWidgets/bite_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _AppBarSection(),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 15.w),
        children: [
          const BiteHeading(title: 'Open Restaurants', isSeeAll: false),
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
                        return Center(child: CircularProgressIndicator());
                      } else if (state is RestaurantsError) {
                        return Center(child: Text('Error: ${state.message}'));
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
                          physics: NeverScrollableScrollPhysics(),
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
                        return SizedBox();
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
      title: BiteDropDownMenu(),
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
                child: BiteFilterModal(),
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
