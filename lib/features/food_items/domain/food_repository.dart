import 'package:bite_food_delivery/features/food_items/models/food_item_model.dart';

abstract interface class FoodRepository {
  Future<List<FoodItemModel>> loadItems({String? restaurantId});
}
