import 'package:material_ui/material_ui.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bite_food_delivery/core/di/di.dart';
import 'package:bite_food_delivery/features/restaurants/models/restaurants_model.dart';
import 'package:bite_food_delivery/features/restaurants/bloc/restaurant_menu_cubit.dart';
import 'package:bite_food_delivery/features/restaurants/pages/restaurant_screen.dart';
import 'package:bite_food_delivery/features/restaurants/pages/catalog_unavailable_screen.dart';
import 'package:bite_food_delivery/features/food_items/models/food_item_model.dart';
import 'package:bite_food_delivery/features/food_items/models/food_detail_arguments.dart';
import 'package:bite_food_delivery/features/food_items/bloc/food_details_cubit.dart';
import 'package:bite_food_delivery/features/food_items/pages/food_item_screen.dart';

abstract final class CatalogRoutes {
  static Widget restaurant(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments;
    if (args is! RestaurantModel) return const CatalogUnavailableScreen();
    return BlocProvider(
      create: (_) => Di.sl<RestaurantMenuCubit>(param1: args)..load(),
      child: const RestaurantScreen(),
    );
  }

  static Widget food(BuildContext context) {
    final raw = ModalRoute.of(context)?.settings.arguments;
    final args = raw is FoodDetailArguments
        ? raw
        : raw is Map &&
              raw['foodItem'] is FoodItemModel &&
              raw['restaurantName'] is String
        ? FoodDetailArguments(
            item: raw['foodItem'] as FoodItemModel,
            restaurantName: raw['restaurantName'] as String,
          )
        : null;
    if (args == null) return const CatalogUnavailableScreen();
    return BlocProvider(
      create: (_) => Di.sl<FoodDetailsCubit>(param1: args),
      child: const FoodItemScreen(),
    );
  }
}
