import 'package:bite_food_delivery/Cubits/RecentSearchesCubit/recent_searches_cubit.dart';
import 'package:bite_food_delivery/Cubits/RestaurantsCubit/restaurants_cubit.dart';
import 'package:bite_food_delivery/GlobalWidgets/bite_restaurant_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BiteSearchBar extends StatelessWidget {
  const BiteSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SearchBar(
      onTapOutside: (event) => FocusScope.of(context).unfocus(),
      onTap: () => showSearch(context: context, delegate: OpenSearchScreen()),
      padding: WidgetStatePropertyAll(
        EdgeInsets.symmetric(horizontal: 15.w, vertical: 5.h),
      ),
      hintText: 'Search for restaurants or dishes',
      hintStyle: WidgetStatePropertyAll(
        Theme.of(context).textTheme.titleSmall!.copyWith(
          color: Colors.grey.shade500,
          fontWeight: FontWeight.normal,
        ),
      ),
      leading: Icon(Icons.search, size: 25.r, color: Colors.grey.shade500),
      elevation: WidgetStatePropertyAll(0),
      shape: WidgetStatePropertyAll(
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
      ),
    );
  }
}

class OpenSearchScreen extends SearchDelegate {
  @override
  Widget buildLeading(BuildContext context) {
    return Row(
      children: [
        8.horizontalSpace,
        IconButton(
          onPressed: () => close(context, Null),

          style: IconButton.styleFrom(
            foregroundColor: Colors.black,
            backgroundColor: Colors.grey.withAlpha(50),
          ),
          icon: Icon(Icons.arrow_back, size: 30.r),
        ),
      ],
    );
  }

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {},
        style: IconButton.styleFrom(
          foregroundColor: Colors.white,
          backgroundColor: Colors.black,
        ),
        icon: Icon(Icons.clear_outlined, size: 30.r),
      ),
      15.horizontalSpace,
    ];
  }

  @override
  Widget buildResults(BuildContext context) {
    return BlocBuilder<RestaurantsCubit, RestaurantsState>(
      builder: (context, state) {
        if (state is RestaurantsLoading) {
          return Center(child: CircularProgressIndicator());
        } else if (state is RestaurantsError) {
          return Center(child: Text('Error: ${state.message}'));
        } else if (state is RestaurantsLoaded) {
          final filteredRestaurants = state.restaurants
              .where(
                (restaurant) =>
                    restaurant.name.toLowerCase().contains(query.toLowerCase()),
              )
              .toList();

          if (filteredRestaurants.isEmpty) {
            return Center(
              child: Text(
                'No restaurants found',
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  color: Colors.grey.shade500,
                  fontWeight: FontWeight.normal,
                ),
              ),
            );
          }

          return ListView.builder(
            padding: EdgeInsets.symmetric(horizontal: 15.w),
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.symmetric(vertical: 10.h),
                child: BiteRestaurantCard(
                  restaurant: filteredRestaurants[index],
                ),
              );
            },
            itemCount: filteredRestaurants.length,
          );
        } else {
          return Text('Unknown state: ${state.runtimeType}');
        }
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return BlocBuilder<RestaurantsCubit, RestaurantsState>(
      builder: (context, state) {
        if (state is RestaurantsLoading) {
          return Center(child: CircularProgressIndicator());
        } else if (state is RestaurantsError) {
          return Center(child: Text('Error: ${state.message}'));
        } else if (state is RestaurantsLoaded) {
          final filteredRestaurants = query.isEmpty
              ? state.restaurants
              : state.restaurants
                    .where(
                      (restaurant) => restaurant.name.toLowerCase().contains(
                        query.toLowerCase(),
                      ),
                    )
                    .toList();

          if (filteredRestaurants.isEmpty) {
            return Center(
              child: Text(
                'No restaurants found',
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  color: Colors.grey.shade500,
                  fontWeight: FontWeight.normal,
                ),
              ),
            );
          }

          return ListView.builder(
            padding: EdgeInsets.symmetric(horizontal: 15.w),
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.symmetric(vertical: 10.h),
                child: BiteRestaurantCard(
                  restaurant: filteredRestaurants[index],
                ),
              );
            },
            itemCount: filteredRestaurants.length,
          );
        } else {
          return Text('Unknown state: ${state.runtimeType}');
        }
      },
    );
  }

  @override
  void showResults(BuildContext context) {
    super.showResults(context);
    FocusScope.of(context).unfocus();
    BlocProvider.of<RecentSearchesCubit>(context).addSearch(query);
  }
}
