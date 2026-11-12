import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:bite_food_delivery/features/categories/domain/categories_repository.dart';
import 'package:bite_food_delivery/features/categories/models/category_model.dart';

class FirestoreCategoriesRepository implements CategoriesRepository {
  const FirestoreCategoriesRepository(this._database);
  final FirebaseFirestore _database;
  @override
  Future<List<CategoryModel>> loadCategories() async {
    final snapshot = await _database.collection('CategoriesDB').get();
    return List.unmodifiable(
      snapshot.docs.map(
        (doc) => CategoryModel.fromJson({
          ...doc.data(),
          'id': doc.data()['id'] ?? doc.id,
        }),
      ),
    );
  }
}
