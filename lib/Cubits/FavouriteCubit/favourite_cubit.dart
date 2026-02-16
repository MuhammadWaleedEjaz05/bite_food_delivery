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
    emit(FavouriteAdded());
  }

  Future<void> removeFromFavourite(String restaurantId) async {
    final db = getCollection('RestaurantsDB');
    final restaurantDoc = db.doc(restaurantId);
    await restaurantDoc.update({'isFavorite': false});
    emit(FavouriteRemoved());
  }
}
