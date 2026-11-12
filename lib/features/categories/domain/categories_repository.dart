import 'package:bite_food_delivery/features/categories/models/category_model.dart';

abstract interface class CategoriesRepository {
  Future<List<CategoryModel>> loadCategories();
}
