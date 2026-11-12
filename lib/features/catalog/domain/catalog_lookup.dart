import 'package:bite_food_delivery/features/restaurants/models/restaurants_model.dart';
import 'package:bite_food_delivery/features/food_items/models/food_item_model.dart';

abstract interface class CatalogLookup {
  Future<RestaurantModel?> restaurant(String id);
  Future<FoodItemModel?> food(String id);
}
