import 'package:bite_food_delivery/src/features/address_management/cubits/address_cubit/address_cubit.dart';
import 'package:bite_food_delivery/src/features/cart/cubits/cart_cubit/cart_cubit.dart';
import 'package:bite_food_delivery/src/features/categories/cubits/categories_cubit/categories_cubit.dart';
import 'package:bite_food_delivery/src/features/food_items/cubits/food_item_cubit/food_item_cubit.dart';
import 'package:bite_food_delivery/src/features/restaurants/cubits/restaurants_cubit/restaurants_cubit.dart';
import 'package:bite_food_delivery/src/services/firebase/firebase_auth_conn.dart';
import 'package:bite_food_delivery/src/features/home/pages/home_screen.dart';
import 'package:bite_food_delivery/src/features/profile/pages/profile_screen.dart';
import 'package:bite_food_delivery/src/features/search/pages/search_screen.dart';
import 'package:bite_food_delivery/src/shared/widgets/bite_bottom_navigation_bar.dart';
import 'package:bite_food_delivery/l10n/app_localizations.dart';
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

  final cartCubit = context.read<CartCubit>();
  if (cartCubit.state is CartInitial) {
    final user = getCurrentUser();
    if (user != null) cartCubit.initialize(user.uid);
  }

  final foodItemCubit = context.read<FoodItemCubit>();
  if (foodItemCubit.state is FoodItemInitial) {
    foodItemCubit.loadFoodItem();
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
    title: AppLocalizations.of(context)!.home,
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
    title: AppLocalizations.of(context)!.search,
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
    title: AppLocalizations.of(context)!.profile,
    page: const ProfileScreen(),
  ),
];
