import 'package:bite_food_delivery/features/restaurants/data/restaurant_dto.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:bite_food_delivery/features/restaurants/domain/restaurants_repository.dart';
import 'package:bite_food_delivery/features/restaurants/models/restaurants_model.dart';

class FirestoreRestaurantsRepository implements RestaurantsRepository {
  const FirestoreRestaurantsRepository(this._database);
  final FirebaseFirestore _database;
  @override
  Future<List<RestaurantModel>> loadRestaurants() async {
    final snapshot = await _database.collection('RestaurantsDB').get();
    return List.unmodifiable(
      snapshot.docs.map(
        (doc) => RestaurantDto.decode({
          ...doc.data(),
          'id': doc.data()['id'] ?? doc.id,
        }),
      ),
    );
  }
}
