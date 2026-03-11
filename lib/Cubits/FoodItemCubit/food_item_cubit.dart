import 'package:bite_food_delivery/Models/food_item_model.dart';
import 'package:bite_food_delivery/configs/firebase_db_conn.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'food_item_state.dart';

class FoodItemCubit extends Cubit<FoodItemState> {
  FoodItemCubit() : super(FoodItemInitial());

  Future<void> loadFoodItem() async {
    emit(FoodItemLoading());
    try {
      final db = getCollection('FoodItemsDB');
      await db.get().then((data) {
        final foodItems = data.docs
            .map(
              (doc) =>
                  FoodItemModel.fromJson(doc.data() as Map<String, dynamic>),
            )
            .toList();
        emit(FoodItemLoaded(foodItems: foodItems));
      });
    } catch (e) {
      emit(FoodItemError(message: e.toString()));
    }
  }
}
