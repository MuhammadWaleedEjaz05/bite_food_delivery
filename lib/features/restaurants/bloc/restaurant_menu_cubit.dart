import 'package:bloc/bloc.dart';
import 'package:bite_food_delivery/features/restaurants/models/restaurants_model.dart';
import 'package:bite_food_delivery/features/food_items/models/food_item_model.dart';
import 'package:bite_food_delivery/features/food_items/domain/food_repository.dart';
part 'restaurant_menu_state.dart';

class RestaurantMenuCubit extends Cubit<RestaurantMenuState> {
  RestaurantMenuCubit(this.restaurant, this._repository)
    : super(const RestaurantMenuState());
  final RestaurantModel restaurant;
  final FoodRepository _repository;
  bool _loading = false;
  Future<void> load() async {
    if (_loading) return;
    _loading = true;
    emit(
      RestaurantMenuState(
        items: state.items,
        selectedCategory: state.selectedCategory,
        loading: true,
      ),
    );
    try {
      final items = await _repository.loadItems(restaurantId: restaurant.id);
      if (!isClosed) {
        emit(
          RestaurantMenuState(
            items: List.unmodifiable(
              items.where((i) => i.restaurantId == restaurant.id),
            ),
          ),
        );
      }
    } catch (_) {
      if (!isClosed) {
        emit(
          RestaurantMenuState(
            items: state.items,
            selectedCategory: state.selectedCategory,
            failed: true,
          ),
        );
      }
    } finally {
      _loading = false;
    }
  }

  void selectCategory(String category) {
    if (category.isNotEmpty && !state.categories.contains(category)) return;
    emit(
      RestaurantMenuState(
        items: state.items,
        selectedCategory: category,
        failed: state.failed,
        loading: state.loading,
      ),
    );
  }
}
