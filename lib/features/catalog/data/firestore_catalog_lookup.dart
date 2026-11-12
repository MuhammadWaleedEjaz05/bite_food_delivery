import 'package:cloud_firestore/cloud_firestore.dart';
import '../domain/catalog_lookup.dart';
import 'package:bite_food_delivery/features/restaurants/data/restaurant_dto.dart';
import 'package:bite_food_delivery/features/restaurants/models/restaurants_model.dart';
import 'package:bite_food_delivery/features/food_items/models/food_item_model.dart';

class FirestoreCatalogLookup implements CatalogLookup {
  const FirestoreCatalogLookup(this.database);
  final FirebaseFirestore database;
  Future<Map<String, dynamic>?> _find(String collection, String id) async {
    if (id.isEmpty || id.contains('/')) return null;
    final reference = database.collection(collection);
    // Some legacy records have a business ID different from their document ID.
    final matching = await reference.where('id', isEqualTo: id).limit(1).get();
    if (matching.docs.isNotEmpty) {
      return {...matching.docs.first.data(), 'id': id};
    }
    final document = await reference.doc(id).get();
    if (!document.exists) return null;
    return {...document.data()!, 'id': document.data()!['id'] ?? document.id};
  }

  @override
  Future<RestaurantModel?> restaurant(String id) async {
    final data = await _find('RestaurantsDB', id);
    return data == null ? null : RestaurantDto.decode(data);
  }

  @override
  Future<FoodItemModel?> food(String id) async {
    final data = await _find('FoodItemsDB', id);
    return data == null ? null : FoodItemModel.fromJson(data);
  }
}
