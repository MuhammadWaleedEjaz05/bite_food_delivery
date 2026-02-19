import 'package:bite_food_delivery/configs/firebase_db_conn.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'favourite_state.dart';

class FavouriteCubit extends Cubit<FavouriteState> {
  FavouriteCubit() : super(FavouriteInitial());

  Future<void> addToFavourite(String restaurantId) async {
    final db = getCollection('RestaurantsDB');
    final restaurantDoc = db.doc(restaurantId);
    await restaurantDoc.update({'isFavorite': true});
    emit(
      FavouriteChanged(
        id: restaurantId,
        type: FavouriteType.restaurant,
        isFavourite: true,
      ),
    );
  }

  Future<void> removeFromFavourite(String restaurantId) async {
    final db = getCollection('RestaurantsDB');
    final restaurantDoc = db.doc(restaurantId);
    await restaurantDoc.update({'isFavorite': false});
    emit(
      FavouriteChanged(
        id: restaurantId,
        type: FavouriteType.restaurant,
        isFavourite: false,
      ),
    );
  }

  Future<void> addFoodItemToFavourite(String foodItemId) async {
    final db = getCollection('FoodItemsDB');
    final foodItemDoc = db.doc(foodItemId);
    await foodItemDoc.update({'isFavorite': true});
    emit(
      FavouriteChanged(
        id: foodItemId,
        type: FavouriteType.foodItem,
        isFavourite: true,
      ),
    );
  }

  Future<void> removeFoodItemFromFavourite(String foodItemId) async {
    final db = getCollection('FoodItemsDB');
    final foodItemDoc = db.doc(foodItemId);
    await foodItemDoc.update({'isFavorite': false});
    emit(
      FavouriteChanged(
        id: foodItemId,
        type: FavouriteType.foodItem,
        isFavourite: false,
      ),
    );
  }
}
