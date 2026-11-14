import 'package:material_ui/material_ui.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bite_food_delivery/core/di/di.dart';
import 'package:bite_food_delivery/features/catalog/bloc/catalog_route_cubit.dart';
import 'package:bite_food_delivery/features/catalog/pages/catalog_loading_screen.dart';
import 'package:bite_food_delivery/features/restaurants/bloc/restaurant_menu_cubit.dart';
import 'package:bite_food_delivery/features/restaurants/pages/restaurant_screen.dart';
import 'package:bite_food_delivery/features/food_items/bloc/food_details_cubit.dart';
import 'package:bite_food_delivery/features/food_items/pages/food_item_screen.dart';

class CatalogRouteScope extends StatelessWidget {
  const CatalogRouteScope({super.key, required this.id, this.food = false});
  final String id;
  final bool food;
  @override
  Widget build(BuildContext context) => BlocProvider(
    create: (_) => Di.sl<CatalogRouteCubit>()..load(id, food: food),
    child: BlocBuilder<CatalogRouteCubit, CatalogRouteState>(
      builder: (context, state) {
        if (state.status != CatalogRouteStatus.ready) {
          return CatalogLoadingScreen(id: id, food: food);
        }
        if (food) {
          return BlocProvider(
            create: (_) => Di.sl<FoodDetailsCubit>(param1: state.food!),
            child: const FoodItemScreen(),
          );
        }
        return BlocProvider(
          create: (_) =>
              Di.sl<RestaurantMenuCubit>(param1: state.restaurant!)..load(),
          child: const RestaurantScreen(),
        );
      },
    ),
  );
}
