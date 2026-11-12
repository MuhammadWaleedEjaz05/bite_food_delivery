import 'package:bite_food_delivery/features/food_items/models/food_item_model.dart';
import 'package:bite_food_delivery/features/food_items/domain/food_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'food_item_state.dart';

class FoodItemCubit extends Cubit<FoodItemState> {
  FoodItemCubit(this._repository) : super(FoodItemInitial());
  final FoodRepository _repository;

  Future<void> loadFoodItem() async {
    emit(FoodItemLoading());
    try {
      final items = await _repository.loadItems();
      if (!isClosed) emit(FoodItemLoaded(foodItems: items));
    } catch (e) {
      if (!isClosed) emit(const FoodItemError(message: 'catalog_unavailable'));
    }
  }
}
