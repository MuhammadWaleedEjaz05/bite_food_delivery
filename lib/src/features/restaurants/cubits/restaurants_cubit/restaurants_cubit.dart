import 'package:bite_food_delivery/src/features/restaurants/models/restaurants_model.dart';
import 'package:bite_food_delivery/src/services/firebase/firebase_db_conn.dart';
import 'package:bloc/bloc.dart';

part 'restaurants_state.dart';

class RestaurantsCubit extends Cubit<RestaurantsState> {
  RestaurantsCubit() : super(RestaurantsInitial());

  Future<void> loadRestaurants() async {
    emit(RestaurantsLoading());
    try {
      final db = getCollection('RestaurantsDB');
      await db.get().then((data) {
        final restaurants = data.docs
            .map(
              (doc) =>
                  RestaurantModel.fromJson(doc.data() as Map<String, dynamic>),
            )
            .toList();
        emit(RestaurantsLoaded(restaurants: restaurants));
      });
    } catch (e) {
      emit(RestaurantsError(message: e.toString()));
    }
  }

  String getRestaurantNameById(String restaurantId) {
    final currentState = state;
    if (currentState is RestaurantsLoaded) {
      final match = currentState.restaurants.where((r) => r.id == restaurantId);
      if (match.isNotEmpty) return match.first.name;
    }
    return restaurantId;
  }
}
