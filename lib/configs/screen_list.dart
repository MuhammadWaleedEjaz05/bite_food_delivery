import 'package:bite_food_delivery/Cubits/AddressCubit/address_cubit.dart';
import 'package:bite_food_delivery/Cubits/CategoriesCubit/categories_cubit.dart';
import 'package:bite_food_delivery/Cubits/RestaurantsCubit/restaurants_cubit.dart';
import 'package:bite_food_delivery/Screens/HomePage/Page/home_screen.dart';
import 'package:bite_food_delivery/Screens/ProfilePage/Page/profile_screen.dart';
import 'package:bite_food_delivery/Screens/SearchPage/Page/search_screen.dart';
import 'package:bite_food_delivery/GlobalWidgets/bite_bottom_navigation_bar.dart';
import 'package:bite_food_delivery/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void _ensureHomeCubitsReady(BuildContext context) {
  final addressCubit = context.read<AddressCubit>();
  if (addressCubit.state is AddressInitial) {
    addressCubit.loadAddresses();
  }

  final categoriesCubit = context.read<CategoriesCubit>();
  if (categoriesCubit.state is CategoriesInitial) {
    categoriesCubit.loadCategories();
  }

  final restaurantsCubit = context.read<RestaurantsCubit>();
  if (restaurantsCubit.state is RestaurantsInitial) {
    restaurantsCubit.loadRestaurants();
  }
}

void _ensureSearchCubitsReady(BuildContext context) {
  final restaurantsCubit = context.read<RestaurantsCubit>();
  if (restaurantsCubit.state is RestaurantsInitial) {
    restaurantsCubit.loadRestaurants();
  }
}

List<BiteBottomItemModel> screenList(BuildContext context) => [
  BiteBottomItemModel(
    icon: Icons.home_outlined,
    selectedIcon: Icons.home,
    title: S.of(context).home,
    page: Builder(
      builder: (context) {
        _ensureHomeCubitsReady(context);
        return const HomeScreen();
      },
    ),
  ),
  BiteBottomItemModel(
    icon: Icons.search_outlined,
    selectedIcon: Icons.search,
    title: S.of(context).search,
    page: Builder(
      builder: (context) {
        _ensureSearchCubitsReady(context);
        return const SearchScreen();
      },
    ),
  ),
  BiteBottomItemModel(
    icon: Icons.person_outlined,
    selectedIcon: Icons.person,
    title: S.of(context).profile,
    page: const ProfileScreen(),
  ),
];
