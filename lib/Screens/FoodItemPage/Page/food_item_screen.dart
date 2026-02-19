import 'package:bite_food_delivery/Cubits/FavouriteCubit/favourite_cubit.dart';
import 'package:bite_food_delivery/GlobalWidgets/bite_app_bar.dart';
import 'package:bite_food_delivery/Models/food_item_model.dart';
import 'package:bite_food_delivery/Screens/FoodItemPage/Widgets/bite_flavor_list_tile.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class FoodItemScreen extends StatelessWidget {
  const FoodItemScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>? ??
        {};
    final foodItem = args['foodItem'] as FoodItemModel;
    final restaurantName = args['restaurantName'] as String;
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
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
                  image: CachedNetworkImageProvider(foodItem.images[0]),
                  fit: BoxFit.cover,
                ),
              ),
              child: Column(children: [_AppBarSection(foodItem)]),
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
                _FoodDescSection(foodItem, restaurantName),
                20.verticalSpace,
                _FoodSizeSelectionSection(foodItem),
                30.verticalSpace,
                _FlavorSelectionSection(foodItem),
                150.verticalSpace,
              ],
            ),
          ),
        ],
      ),
      bottomSheet: _AddCardBottomSheet(foodItem),
    );
  }
}

class _AddCardBottomSheet extends StatelessWidget {
  final FoodItemModel foodItem;
  const _AddCardBottomSheet(this.foodItem);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(32.r),
          topRight: Radius.circular(32.r),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            10.verticalSpace,
            Row(
              children: [
                10.horizontalSpace,
                Text(
                  'RS ${foodItem.price.toStringAsFixed(2)}',
                  style: GoogleFonts.sen(
                    fontSize: 25.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Spacer(),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.blueGrey,
                    borderRadius: BorderRadius.circular(30.r),
                  ),
                  child: Row(
                    spacing: 5.w,
                    children: [
                      IconButton(
                        icon: Icon(Icons.remove),
                        style: IconButton.styleFrom(
                          backgroundColor: Colors.blueGrey.shade200,
                          foregroundColor: Colors.white,
                        ),
                        onPressed: () {},
                      ),
                      Text(
                        '1',
                        style: GoogleFonts.sen(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.add),
                        style: IconButton.styleFrom(
                          backgroundColor: Colors.blueGrey.shade200,
                          foregroundColor: Colors.white,
                        ),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
              ],
            ),
            20.verticalSpace,
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(vertical: 10.h),
                      backgroundColor: Colors.deepOrange,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                    ),
                    child: Text(
                      'Add to cart',
                      style: GoogleFonts.sen(
                        fontSize: 25.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _FlavorSelectionSection extends StatelessWidget {
  final FoodItemModel foodItem;
  const _FlavorSelectionSection(this.foodItem);

  @override
  Widget build(BuildContext context) {
    if (foodItem.flavors.isEmpty) return SizedBox.shrink();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Choose your flavor',
          style: GoogleFonts.sen(fontSize: 20.sp, fontWeight: FontWeight.bold),
        ),
        10.verticalSpace,
        ListView.separated(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) => BiteFlavorListTile(),
          separatorBuilder: (context, index) => 10.verticalSpace,
          itemCount: 5,
        ),
      ],
    );
  }
}

class _FoodSizeSelectionSection extends StatelessWidget {
  final FoodItemModel foodItem;
  const _FoodSizeSelectionSection(this.foodItem);

  @override
  Widget build(BuildContext context) {
    if (foodItem.sizes.isEmpty) return SizedBox.shrink();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Choose your size',
          style: GoogleFonts.sen(fontSize: 20.sp, fontWeight: FontWeight.bold),
        ),
        10.verticalSpace,
        Row(
          spacing: 10.w,
          children: [
            TextButton(
              onPressed: () {},
              style: TextButton.styleFrom(
                foregroundColor: Colors.black,
                backgroundColor: Colors.grey.shade300,
                textStyle: GoogleFonts.sen(fontSize: 20.sp),
              ),
              child: Text('10 inch'),
            ),
            TextButton(
              onPressed: () {},
              style: TextButton.styleFrom(
                foregroundColor: Colors.black,
                backgroundColor: Colors.grey.shade300,
                textStyle: GoogleFonts.sen(fontSize: 20.sp),
              ),
              child: Text('16 inch'),
            ),
            TextButton(
              onPressed: () {},
              style: TextButton.styleFrom(
                foregroundColor: Colors.black,
                backgroundColor: Colors.grey.shade300,
                textStyle: GoogleFonts.sen(fontSize: 20.sp),
              ),
              child: Text('20 inch'),
            ),
          ],
        ),
      ],
    );
  }
}

class _FoodDescSection extends StatelessWidget {
  final FoodItemModel foodItem;
  final String restaurantName;
  const _FoodDescSection(this.foodItem, this.restaurantName);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          foodItem.name,
          style: GoogleFonts.sen(fontSize: 30.sp, fontWeight: FontWeight.bold),
        ),
        5.verticalSpace,
        Text(
          restaurantName,
          style: GoogleFonts.sen(fontSize: 20.sp, color: Colors.grey),
        ),
        20.verticalSpace,
        10.verticalSpace,
        Text(
          foodItem.description,
          style: GoogleFonts.sen(fontSize: 16.sp, color: Colors.grey),
        ),
      ],
    );
  }
}

class _AppBarSection extends StatelessWidget {
  final FoodItemModel foodItem;
  const _AppBarSection(this.foodItem);

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
                    state.type == FavouriteType.foodItem &&
                    state.id == foodItem.id
                ? state.isFavourite
                : foodItem.isFavorite ?? false;
            return IconButton(
              onPressed: () {
                if (isFavourite) {
                  context.read<FavouriteCubit>().removeFoodItemFromFavourite(
                    foodItem.id,
                  );
                } else {
                  context.read<FavouriteCubit>().addFoodItemToFavourite(
                    foodItem.id,
                  );
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
