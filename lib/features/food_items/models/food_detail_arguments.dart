import 'package:bite_food_delivery/features/food_items/models/food_item_model.dart';

class FoodDetailArguments {
  const FoodDetailArguments({
    required this.item,
    required this.restaurantName,
    this.restaurantOpen = true,
  });
  final FoodItemModel item;
  final String restaurantName;
  final bool restaurantOpen;
}
