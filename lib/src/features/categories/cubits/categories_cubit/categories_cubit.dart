import 'package:bite_food_delivery/src/features/categories/models/category_model.dart';
import 'package:bite_food_delivery/src/services/firebase/firebase_db_conn.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'categories_state.dart';

class CategoriesCubit extends Cubit<CategoriesState> {
  final List<CategoryModel> _caches = [];
  CategoriesCubit() : super(CategoriesInitial());

  Future<void> loadCategories() async {
    _caches.clear();
    emit(CategoriesLoading());
    try {
      final db = getCollection('CategoriesDB');
      await db.get().then((data) {
        final categories = data.docs
            .map(
              (entry) =>
                  CategoryModel.fromJson(entry.data() as Map<String, dynamic>),
            )
            .toList();
        _caches.addAll(categories);
        emit(CategoriesLoaded(categories: categories));
      });
    } catch (e) {
      emit(CategoriesError(error: e.toString()));
    }
  }

  Future<void> refreshCategories() async {
    await loadCategories();
  }
}
