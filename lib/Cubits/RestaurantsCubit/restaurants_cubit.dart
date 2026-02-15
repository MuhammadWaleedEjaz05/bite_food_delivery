import 'package:bite_food_delivery/Models/restaurants_model.dart';
import 'package:bite_food_delivery/configs/firebase_db_conn.dart';
import 'package:bloc/bloc.dart';

part 'restaurants_state.dart';

class RestaurantsCubit extends Cubit<RestaurantsState> {
  RestaurantsCubit() : super(RestaurantsInitial()) {
    uploadRestaurants();
  }

  Future<void> uploadRestaurants() async {
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
}
