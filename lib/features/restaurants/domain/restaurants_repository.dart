import 'package:bite_food_delivery/features/restaurants/models/restaurants_model.dart';

abstract interface class RestaurantsRepository {
  Future<List<RestaurantModel>> loadRestaurants();
}
