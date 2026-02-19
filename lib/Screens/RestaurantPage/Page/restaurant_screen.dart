import 'package:bite_food_delivery/Cubits/FavouriteCubit/favourite_cubit.dart';
import 'package:bite_food_delivery/Cubits/CategorySelectionCubit/category_selection_cubit.dart';
import 'package:bite_food_delivery/Cubits/FoodItemCubit/food_item_cubit.dart';
import 'package:bite_food_delivery/GlobalWidgets/bite_app_bar.dart';
import 'package:bite_food_delivery/Models/restaurants_model.dart';
import 'package:bite_food_delivery/Screens/RestaurantPage/Widgets/bite_food_card.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class RestaurantScreen extends StatelessWidget {
  const RestaurantScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final restaurant =
        ModalRoute.of(context)!.settings.arguments as RestaurantModel;
    return Scaffold(
      body: ListView(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(32.r),
              bottomRight: Radius.circular(32.r),
            ),
            child: Container(
              height: 250.h,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: CachedNetworkImageProvider(restaurant.logoUrl),
                  fit: BoxFit.cover,
                ),
              ),
              child: Column(children: [_AppBarSection(restaurant)]),
            ),
          ),
          Container(
            decoration: BoxDecoration(color: Colors.white),
            child: ListView(
              padding: EdgeInsets.symmetric(horizontal: 15.w),
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              children: [
                20.verticalSpace,
                _RatingAndTimeSection(restaurant),
                10.verticalSpace,
                _FoodNameAndDescSection(restaurant),
                20.verticalSpace,
                _CategorySelectionSection(restaurant.id),
                20.verticalSpace,
                _FoodItemSection(restaurant),
                20.verticalSpace,
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _FoodItemSection extends StatelessWidget {
  final RestaurantModel restaurant;
  const _FoodItemSection(this.restaurant);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategorySelectionCubit, String>(
      builder: (context, selectedCategory) {
        return BlocBuilder<FoodItemCubit, FoodItemState>(
          builder: (context, state) {
            if (state is FoodItemLoading) {
              return Center(child: CircularProgressIndicator());
            } else if (state is FoodItemError) {
              return Center(
                child: Text(
                  'Failed to load food items. Please try again later.',
                ),
              );
            } else if (state is FoodItemLoaded) {
              final restaurantFoodItems = state.foodItems
                  .where((item) => item.RestuarantId == restaurant.id)
                  .toList();
              final filteredItems = selectedCategory.isEmpty
                  ? restaurantFoodItems
                  : restaurantFoodItems
                        .where((item) => item.category == selectedCategory)
                        .toList();
              if (filteredItems.isEmpty) {
                return Center(
                  child: Text('No food items available for this category.'),
                );
              } else {
                return ListView(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  children: [
                    Text(
                      selectedCategory.isEmpty ? 'All Items' : selectedCategory,
                      style: GoogleFonts.sen(
                        fontSize: 25.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    GridView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 10.w,
                        mainAxisSpacing: 10.h,
                        childAspectRatio: .63,
                      ),
                      itemBuilder: (context, index) => BiteFoodCard(
                        foodItem: filteredItems[index],
                        restaurantName: restaurant.name,
                      ),
                      itemCount: filteredItems.length,
                    ),
                  ],
                );
              }
            } else {
              return SizedBox.shrink();
            }
          },
        );
      },
    );
  }
}

class _CategorySelectionSection extends StatelessWidget {
  final String restaurantId;
  const _CategorySelectionSection(this.restaurantId);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategorySelectionCubit, String>(
      builder: (context, selectedCategory) {
        return BlocBuilder<FoodItemCubit, FoodItemState>(
          builder: (context, state) {
            if (state is FoodItemLoading) {
              return Center(child: CircularProgressIndicator());
            } else if (state is FoodItemError) {
              return Center(
                child: Text(
                  'Failed to load food items. Please try again later.',
                ),
              );
            } else if (state is FoodItemLoaded) {
              if (state.foodItems.isEmpty) {
                return SizedBox.shrink();
              } else {
                final restaurantFoodItems = state.foodItems
                    .where((item) => item.RestuarantId == restaurantId)
                    .toList();
                final categories = restaurantFoodItems
                    .map((item) => item.category)
                    .toSet()
                    .toList();
                final categoryList = ['All', ...categories];
                return SizedBox(
                  height: 40.h,
                  child: ListView.separated(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      final category = categoryList[index];
                      final isSelected = category == 'All'
                          ? selectedCategory.isEmpty
                          : selectedCategory == category;
                      return TextButton(
                        onPressed: () {
                          context.read<CategorySelectionCubit>().selectCategory(
                            category == 'All' ? '' : category,
                          );
                        },
                        style: TextButton.styleFrom(
                          foregroundColor: isSelected
                              ? Colors.white
                              : Colors.black45,
                          backgroundColor: isSelected
                              ? Colors.deepOrange
                              : Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.r),
                            side: BorderSide(color: Colors.grey.shade200),
                          ),
                          textStyle: GoogleFonts.sen(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.bold,
                          ),
                          padding: EdgeInsets.symmetric(
                            horizontal: 15.w,
                            vertical: 5.h,
                          ),
                        ),
                        child: Text(category),
                      );
                    },
                    separatorBuilder: (context, index) => 5.horizontalSpace,
                    itemCount: categoryList.length,
                  ),
                );
              }
            } else {
              return SizedBox.shrink();
            }
          },
        );
      },
    );
  }
}

class _FoodNameAndDescSection extends StatelessWidget {
  const _FoodNameAndDescSection(this.restaurant);

  final RestaurantModel restaurant;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          restaurant.name,
          style: GoogleFonts.sen(fontSize: 30.sp, fontWeight: FontWeight.bold),
        ),
        Text(
          restaurant.description,
          style: GoogleFonts.sen(fontSize: 16.sp, color: Colors.grey),
        ),
      ],
    );
  }
}

class _RatingAndTimeSection extends StatelessWidget {
  final RestaurantModel restaurant;
  const _RatingAndTimeSection(this.restaurant);

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 20.w,
      children: [
        Row(
          spacing: 5.w,
          children: [
            Icon(Icons.star_outlined, color: Colors.deepOrange, size: 20.r),
            Text(
              restaurant.rating.toString(),
              style: GoogleFonts.sen(
                fontSize: 16.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        Row(
          spacing: 5.w,
          children: [
            Icon(
              Icons.delivery_dining_outlined,
              color: Colors.deepOrange,
              size: 20.r,
            ),
            Text(
              restaurant.deliveryFee == 0
                  ? 'Free'
                  : '\$${restaurant.deliveryFee}',
              style: GoogleFonts.sen(
                fontSize: 16.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        Row(
          spacing: 5.w,
          children: [
            Icon(Icons.timer_outlined, color: Colors.deepOrange, size: 20.r),
            Text(
              '${restaurant.deliveryTime} min',
              style: GoogleFonts.sen(
                fontSize: 16.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _AppBarSection extends StatelessWidget {
  final RestaurantModel restaurant;
  const _AppBarSection(this.restaurant);

  @override
  Widget build(BuildContext context) {
    return BiteAppBar(
      backButton: true,
      isDarkMode: true,
      title: SizedBox.shrink(),
      actions: [
        BlocBuilder<FavouriteCubit, FavouriteState>(
          builder: (context, state) {
            final isFavourite =
                state is FavouriteChanged &&
                    state.type == FavouriteType.restaurant &&
                    state.id == restaurant.id
                ? state.isFavourite
                : restaurant.isFavorite;
            return IconButton(
              onPressed: () {
                if (isFavourite) {
                  context.read<FavouriteCubit>().removeFromFavourite(
                    restaurant.id,
                  );
                } else {
                  context.read<FavouriteCubit>().addToFavourite(restaurant.id);
                }
              },
              style: IconButton.styleFrom(
                foregroundColor: Colors.red,
                backgroundColor: Colors.grey.shade200,
              ),
              icon: Icon(
                isFavourite ? Icons.favorite : Icons.favorite_outline,
                size: 30.r,
              ),
            );
          },
        ),
        15.horizontalSpace,
      ],
    );
  }
}
