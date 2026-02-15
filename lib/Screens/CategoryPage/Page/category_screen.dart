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
    final String categoryImage =
        ModalRoute.of(context)?.settings.arguments as String? ?? "";
    return Scaffold(
      appBar: _AppBarSection(categoryImage),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 15.w),
        children: [
          const BiteHeading(title: 'Open Restaurants', isSeeAll: false),
          20.verticalSpace,
          BlocBuilder<RestaurantsCubit, RestaurantsState>(
            builder: (context, state) {
              if (state is RestaurantsLoading) {
                return Center(child: CircularProgressIndicator());
              } else if (state is RestaurantsError) {
                return Center(child: Text('Error: ${state.message}'));
              } else if (state is RestaurantsLoaded) {
                final filteredRestaurants = state.restaurants
                    .where(
                      (restaurant) =>
                          restaurant.category.toLowerCase() ==
                          categoryImage.toLowerCase(),
                    )
                    .toList();
                return ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    final restaurant = filteredRestaurants[index];
                    return Padding(
                      padding: EdgeInsets.symmetric(vertical: 10.h),
                      child: BiteRestaurantCard(restaurant: restaurant),
                    );
                  },
                  itemCount: filteredRestaurants.length,
                );
              } else {
                return SizedBox();
              }
            },
          ),
        ],
      ),
    );
  }
}

class _AppBarSection extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  const _AppBarSection(this.title);
  @override
  Size get preferredSize => Size.fromHeight(100.h);

  @override
  Widget build(BuildContext context) {
    return BiteAppBar(
      backButton: true,
      title: BiteDropDownMenu(title: title),
      actions: [
        IconButton(
          onPressed: () =>
              showSearch(context: context, delegate: OpenSearchScreen()),
          style: IconButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: Colors.black,
          ),
          icon: Icon(Icons.search_outlined, size: 30.r),
        ),
        15.horizontalSpace,
        IconButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) => Dialog(
                backgroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.r),
                ),
                child: BiteFilterModal(),
              ),
            );
          },
          style: IconButton.styleFrom(
            foregroundColor: Colors.black,
            backgroundColor: Colors.grey.shade200,
          ),
          icon: Icon(Icons.filter_alt_outlined, size: 30.r),
        ),
        15.horizontalSpace,
      ],
    );
  }
}
