import 'package:bite_food_delivery/Cubits/FavouriteCubit/favourite_cubit.dart';
import 'package:bite_food_delivery/Cubits/FoodItemCubit/food_item_cubit.dart';
import 'package:bite_food_delivery/Cubits/RestaurantsCubit/restaurants_cubit.dart';
import 'package:bite_food_delivery/GlobalWidgets/bite_app_bar.dart';
import 'package:bite_food_delivery/Screens/FavouritePage/Widgets/bite_favourite_block.dart';
import 'package:bite_food_delivery/Screens/FavouritePage/Widgets/bite_favourite_restaurant_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _AppSection(),
      body: DefaultTabController(
        initialIndex: 0,
        length: 2,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          child: Column(
            children: [
              _TabSection(),
              20.verticalSpace,
              Expanded(child: _FavouriteSection()),
            ],
          ),
        ),
      ),
    );
  }
}

class _FavouriteSection extends StatelessWidget {
  const _FavouriteSection();

  @override
  Widget build(BuildContext context) {
    return TabBarView(
      children: [_FoodFavouriteSection(), _ReataurantFavouriteSection()],
    );
  }
}

class _ReataurantFavouriteSection extends StatelessWidget {
  const _ReataurantFavouriteSection();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavouriteCubit, FavouriteState>(
      builder: (context, state) {
        if (state is FavouriteChanged &&
            state.type == FavouriteType.restaurant) {
          context.read<RestaurantsCubit>().loadRestaurants();
        }
        return BlocBuilder<RestaurantsCubit, RestaurantsState>(
          builder: (context, state) {
            if (state is RestaurantsLoading) {
              return Center(child: CircularProgressIndicator());
            } else if (state is RestaurantsError) {
              return Center(child: Text('Error: ${state.message}'));
            } else if (state is RestaurantsLoaded) {
              final favouriteRestaurants = state.restaurants
                  .where((restaurant) => restaurant.isFavorite)
                  .toList();
              if (favouriteRestaurants.isEmpty) {
                return Center(child: Text('No favourite restaurants found.'));
              }
              return ListView.separated(
                itemBuilder: (context, index) => BiteFavouriteRestaurantCard(
                  restaurant: favouriteRestaurants[index],
                ),
                separatorBuilder: (context, index) => 10.verticalSpace,
                itemCount: favouriteRestaurants.length,
              );
            } else {
              return SizedBox.shrink();
            }
          },
        );
      },
    );
  }
}

class _FoodFavouriteSection extends StatelessWidget {
  const _FoodFavouriteSection();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavouriteCubit, FavouriteState>(
      builder: (context, state) {
        if (state is FavouriteChanged && state.type == FavouriteType.foodItem) {
          context.read<FoodItemCubit>().loadFoodItem();
        }
        return BlocBuilder<FoodItemCubit, FoodItemState>(
          builder: (context, state) {
            if (state is FoodItemLoading) {
              return Center(child: CircularProgressIndicator());
            } else if (state is FoodItemError) {
              return Center(child: Text('Error: ${state.message}'));
            } else if (state is FoodItemLoaded) {
              final favouriteFoodItems = state.foodItems
                  .where((foodItem) => foodItem.isFavorite ?? false)
                  .toList();
              if (favouriteFoodItems.isEmpty) {
                return Center(child: Text('No favourite foods found.'));
              }
              return ListView.separated(
                itemBuilder: (context, index) =>
                    BiteFavouriteBlock(foodItem: favouriteFoodItems[index]),
                separatorBuilder: (context, index) => 10.verticalSpace,
                itemCount: favouriteFoodItems.length,
              );
            } else {
              return SizedBox.shrink();
            }
          },
        );
      },
    );
  }
}

class _TabSection extends StatelessWidget {
  const _TabSection();

  @override
  Widget build(BuildContext context) {
    return TabBar(
      indicatorSize: TabBarIndicatorSize.tab,
      indicator: BoxDecoration(
        color: Colors.deepOrange,
        borderRadius: BorderRadius.circular(30.r),
      ),
      dividerColor: Colors.transparent,
      labelColor: Colors.white,
      unselectedLabelColor: Colors.black,
      labelStyle: Theme.of(context).textTheme.titleSmall,
      unselectedLabelStyle: Theme.of(
        context,
      ).textTheme.titleSmall!.copyWith(fontWeight: FontWeight.normal),
      tabs: [
        Tab(text: 'Foods'),
        Tab(text: 'Restaurants'),
      ],
    );
  }
}

class _AppSection extends StatelessWidget implements PreferredSizeWidget {
  const _AppSection();
  @override
  Size get preferredSize => Size.fromHeight(100.h);

  @override
  Widget build(BuildContext context) {
    return BiteAppBar(
      backButton: true,
      title: Text(
        'Favourite',
        style: GoogleFonts.sen(
          fontSize: Theme.of(context).textTheme.displaySmall!.fontSize,
          fontWeight: Theme.of(context).textTheme.displaySmall!.fontWeight,
          color: Colors.deepOrange,
        ),
      ),
      actions: [],
    );
  }
}
