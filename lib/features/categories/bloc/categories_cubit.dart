import 'package:bite_food_delivery/features/categories/domain/categories_repository.dart';
import 'package:bite_food_delivery/features/categories/models/category_model.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
part 'categories_state.dart';

class CategoriesCubit extends Cubit<CategoriesState> {
  CategoriesCubit(this._repository) : super(CategoriesInitial());
  final CategoriesRepository _repository;
  bool _loading = false;
  Future<void> loadCategories() async {
    if (_loading) return;
    _loading = true;
    final previous = state;
    if (previous is CategoriesLoaded) {
      emit(CategoriesLoaded(categories: previous.categories, refreshing: true));
    } else {
      emit(CategoriesLoading());
    }
    try {
      final categories = await _repository.loadCategories();
      if (!isClosed) {
        emit(CategoriesLoaded(categories: List.unmodifiable(categories)));
      }
    } catch (_) {
      if (!isClosed) {
        emit(
          previous is CategoriesLoaded
              ? CategoriesLoaded(
                  categories: previous.categories,
                  refreshFailed: true,
                )
              : const CategoriesError(error: 'catalog_unavailable'),
        );
      }
    } finally {
      _loading = false;
    }
  }

  Future<void> refreshCategories() => loadCategories();
}
