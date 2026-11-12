import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:bite_food_delivery/features/food_items/domain/food_repository.dart';
import 'package:bite_food_delivery/features/food_items/models/food_item_model.dart';

class FirestoreFoodRepository implements FoodRepository {
  const FirestoreFoodRepository(this._database);
  final FirebaseFirestore _database;
  @override
  Future<List<FoodItemModel>> loadItems({String? restaurantId}) async {
    Query<Map<String, dynamic>> query = _database.collection('FoodItemsDB');
    if (restaurantId != null) {
      query = query.where('RestuarantId', isEqualTo: restaurantId);
    }
    final snapshot = await query.get();
    return List.unmodifiable(
      snapshot.docs.map(
        (doc) => FoodItemModel.fromJson({
          ...doc.data(),
          'id': doc.data()['id'] ?? doc.id,
        }),
      ),
    );
  }
}
