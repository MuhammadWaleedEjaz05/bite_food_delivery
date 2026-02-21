import 'package:bite_food_delivery/Cubits/AddressCubit/address_cubit.dart';
import 'package:bite_food_delivery/Cubits/CategoriesCubit/categories_cubit.dart';
import 'package:bite_food_delivery/Cubits/RestaurantsCubit/restaurants_cubit.dart';
import 'package:bite_food_delivery/Cubits/UserAuthCubit/user_auth_cubit.dart';
import 'package:bite_food_delivery/GlobalWidgets/bite_app_bar.dart';
import 'package:bite_food_delivery/GlobalWidgets/bite_category_card.dart';
import 'package:bite_food_delivery/GlobalWidgets/bite_heading.dart';
import 'package:bite_food_delivery/GlobalWidgets/bite_restaurant_card.dart';
import 'package:bite_food_delivery/GlobalWidgets/bite_search_bar.dart';
import 'package:bite_food_delivery/GlobalWidgets/bite_address_selector_modal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _AppBarSection(),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 15.w),
        children: [
          10.verticalSpace,
          _SearchSection(),
          20.verticalSpace,
          _CategorySection(),
          20.verticalSpace,
          _OpenRestaurantsSection(),
        ],
      ),
    );
  }
}

class _CategorySection extends StatelessWidget {
  const _CategorySection();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BiteHeading(
          title: 'All Categories',
          isSeeAll: true,
          onSeeAllPressed: () =>
              Navigator.pushNamed(context, '/all_categories_screen'),
        ),
        20.verticalSpace,
        BlocBuilder<CategoriesCubit, CategoriesState>(
          builder: (context, state) {
            if (state is CategoriesLoading) {
              return Center(child: CircularProgressIndicator());
            } else if (state is CategoriesError) {
              return Center(child: Text('Error: ${state.error}'));
            } else if (state is CategoriesLoaded) {
              return SizedBox(
                height: 179.h,
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    final category = state.categories[index];
                    return BiteCategoryCard(category: category);
                  },
                  itemCount: 3,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                ),
              );
            } else {
              return Text('Unknown state: ${state.runtimeType}');
            }
          },
        ),
      ],
    );
  }
}

class _OpenRestaurantsSection extends StatelessWidget {
  const _OpenRestaurantsSection();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BiteHeading(
          title: 'Open Restaurants',
          isSeeAll: true,
          onSeeAllPressed: () =>
              Navigator.pushNamed(context, '/all_restaurants_screen'),
        ),
        20.verticalSpace,
        BlocBuilder<RestaurantsCubit, RestaurantsState>(
          builder: (context, state) {
            if (state is RestaurantsLoading) {
              return Center(child: CircularProgressIndicator());
            } else if (state is RestaurantsError) {
              return Center(child: Text('Error: ${state.message}'));
            } else if (state is RestaurantsLoaded) {
              return ListView.builder(
                itemBuilder: (context, index) {
                  final restaurant = state.restaurants[index];
                  return Padding(
                    padding: EdgeInsets.symmetric(vertical: 10.h),
                    child: BiteRestaurantCard(restaurant: restaurant),
                  );
                },
                itemCount: state.restaurants.length,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
              );
            } else {
              return Text('Unknown state: ${state.runtimeType}');
            }
          },
        ),
      ],
    );
  }
}

class _AppBarSection extends StatefulWidget implements PreferredSizeWidget {
  const _AppBarSection();

  @override
  Size get preferredSize => Size.fromHeight(100.h);

  @override
  State<_AppBarSection> createState() => _AppBarSectionState();
}

class _AppBarSectionState extends State<_AppBarSection> {
  @override
  void initState() {
    super.initState();
    context.read<AddressCubit>().loadAddresses();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddressCubit, AddressState>(
      builder: (context, addressState) {
        String addressText = 'Select Location';

        if (addressState is AddressesLoaded &&
            addressState.selectedAddress != null) {
          addressText = addressState.selectedAddress!.street;
        }

        return BlocBuilder<UserAuthCubit, UserAuthState>(
          builder: (context, userState) {
            return BiteAppBar(
              isLogoVisible: true,
              title: Column(
                children: [
                  Text(
                    'DELIVER TO',
                    style: GoogleFonts.sen(
                      color: Theme.of(context).primaryColor,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  GestureDetector(
                    onTap: () => showAddressSelectorModal(context),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.location_on,
                          color: Colors.grey.shade600,
                          size: 16.sp,
                        ),
                        SizedBox(width: 4.w),
                        SizedBox(
                          width: 120.w,
                          child: Text(
                            addressText,
                            style: GoogleFonts.sen(
                              color: Colors.grey.shade600,
                              fontSize: 15.sp,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        SizedBox(width: 4.w),
                        Icon(
                          Icons.keyboard_arrow_down,
                          color: Colors.grey.shade600,
                          size: 16.sp,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              actions: [
                IconButton(
                  onPressed: () => Navigator.pushNamed(context, '/cart_screen'),
                  style: IconButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.black,
                  ),
                  icon: Icon(Icons.shopping_bag_outlined, size: 35.r),
                ),
                15.horizontalSpace,
              ],
            );
          },
        );
      },
    );
  }
}

class _SearchSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BlocBuilder<UserAuthCubit, UserAuthState>(
          builder: (context, state) {
            if (state is UserLoggedIn) {
              return Row(
                children: [
                  Text(
                    'Hey ${state.user.fullName}, ',
                    style: GoogleFonts.sen(fontSize: 15.sp),
                  ),
                  Text(
                    'Good Morning! 👋',
                    style: GoogleFonts.sen(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              );
            } else {
              return Row(
                children: [
                  Text('Hey there, ', style: GoogleFonts.sen(fontSize: 15.sp)),
                  Text(
                    'Good Morning! 👋',
                    style: GoogleFonts.sen(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              );
            }
          },
        ),
        20.verticalSpace,
        BiteSearchBar(),
      ],
    );
  }
}
