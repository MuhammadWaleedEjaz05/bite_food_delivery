import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bite_food_delivery/features/restaurants/domain/restaurants_repository.dart';
import 'package:bite_food_delivery/features/food_items/domain/food_repository.dart';
import 'package:bite_food_delivery/features/restaurants/models/restaurants_model.dart';
import 'package:bite_food_delivery/features/food_items/models/food_item_model.dart';
part 'discovery_state.dart';

class DiscoveryCubit extends Cubit<DiscoveryState> {
  DiscoveryCubit(this.restaurants, this.foods) : super(const DiscoveryState());
  final RestaurantsRepository restaurants;
  final FoodRepository foods;
  bool _loading = false;
  Future<void> load() async {
    if (_loading || isClosed) return;
    _loading = true;
    emit(state.copyWith(loading: true, failed: false));
    try {
      final results = await Future.wait([
        restaurants.loadRestaurants(),
        foods.loadItems(),
      ]);
      if (!isClosed) {
        emit(
          state.copyWith(
            loading: false,
            loaded: true,
            restaurants: List.unmodifiable(results[0].cast<RestaurantModel>()),
            foods: List.unmodifiable(results[1].cast<FoodItemModel>()),
          ),
        );
      }
    } catch (_) {
      if (!isClosed) emit(state.copyWith(loading: false, failed: true));
    } finally {
      _loading = false;
    }
  }

  void query(String value) => emit(state.copyWith(query: value, limit: 20));
  void category(String value) =>
      emit(state.copyWith(category: value, limit: 20));
  void kind(DiscoveryKind value) =>
      emit(state.copyWith(kind: value, limit: 20));
  void sort(DiscoverySort value) =>
      emit(state.copyWith(sort: value, limit: 20));
  void toggleOpen() =>
      emit(state.copyWith(openOnly: !state.openOnly, limit: 20));
  void reset() => emit(
    state.copyWith(
      query: '',
      category: '',
      kind: DiscoveryKind.all,
      sort: DiscoverySort.recommended,
      openOnly: false,
      limit: 20,
    ),
  );
  void more() => emit(state.copyWith(limit: state.limit + 20));
  void submit(String value) {
    final normalized = value.trim().replaceAll(RegExp(r'\s+'), ' ');
    if (normalized.isEmpty) return;
    emit(
      state.copyWith(
        query: normalized,
        recent: List.unmodifiable(
          [
            normalized,
            ...state.recent.where(
              (e) => e.toLowerCase() != normalized.toLowerCase(),
            ),
          ].take(8),
        ),
        limit: 20,
      ),
    );
  }

  void clearRecent() => emit(state.copyWith(recent: const []));
}
