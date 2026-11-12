import 'package:bite_food_delivery/features/restaurants/domain/restaurants_repository.dart';
import 'package:bite_food_delivery/features/restaurants/models/restaurants_model.dart';
import 'package:bloc/bloc.dart';
part 'restaurants_state.dart';

class RestaurantsCubit extends Cubit<RestaurantsState> {
  RestaurantsCubit(this._repository) : super(RestaurantsInitial());
  final RestaurantsRepository _repository;
  bool _loading = false;
  Future<void> loadRestaurants() async {
    if (_loading) return;
    _loading = true;
    final previous = state;
    if (previous is RestaurantsLoaded) {
      emit(
        RestaurantsLoaded(restaurants: previous.restaurants, refreshing: true),
      );
    } else {
      emit(RestaurantsLoading());
    }
    try {
      final restaurants = await _repository.loadRestaurants();
      if (!isClosed) {
        emit(RestaurantsLoaded(restaurants: List.unmodifiable(restaurants)));
      }
    } catch (_) {
      if (!isClosed) {
        emit(
          previous is RestaurantsLoaded
              ? RestaurantsLoaded(
                  restaurants: previous.restaurants,
                  refreshFailed: true,
                )
              : RestaurantsError(message: 'catalog_unavailable'),
        );
      }
    } finally {
      _loading = false;
    }
  }

  String getRestaurantNameById(String restaurantId) {
    final current = state;
    if (current is RestaurantsLoaded) {
      for (final restaurant in current.restaurants) {
        if (restaurant.id == restaurantId) return restaurant.name;
      }
    }
    return restaurantId;
  }
}
