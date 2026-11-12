import 'package:flutter_bloc/flutter_bloc.dart';
import '../domain/catalog_lookup.dart';
import 'package:bite_food_delivery/features/restaurants/models/restaurants_model.dart';
import 'package:bite_food_delivery/features/food_items/models/food_detail_arguments.dart';
part 'catalog_route_state.dart';

class CatalogRouteCubit extends Cubit<CatalogRouteState> {
  CatalogRouteCubit(this.lookup) : super(const CatalogRouteState());
  final CatalogLookup lookup;
  bool _loading = false;
  Future<void> load(String id, {required bool food}) async {
    if (_loading || isClosed) return;
    _loading = true;
    emit(const CatalogRouteState());
    try {
      if (id.isEmpty || id.contains('/')) {
        if (!isClosed) {
          emit(const CatalogRouteState(status: CatalogRouteStatus.missing));
        }
        return;
      }
      if (food) {
        final item = await lookup.food(id);
        final restaurant = item == null
            ? null
            : await lookup.restaurant(item.restaurantId);
        if (!isClosed) {
          emit(
            item == null || restaurant == null
                ? const CatalogRouteState(status: CatalogRouteStatus.missing)
                : CatalogRouteState(
                    status: CatalogRouteStatus.ready,
                    food: FoodDetailArguments(
                      item: item,
                      restaurantName: restaurant.name,
                      restaurantOpen: restaurant.isOpen,
                    ),
                  ),
          );
        }
      } else {
        final restaurant = await lookup.restaurant(id);
        if (!isClosed) {
          emit(
            CatalogRouteState(
              status: restaurant == null
                  ? CatalogRouteStatus.missing
                  : CatalogRouteStatus.ready,
              restaurant: restaurant,
            ),
          );
        }
      }
    } catch (_) {
      if (!isClosed) {
        emit(const CatalogRouteState(status: CatalogRouteStatus.failed));
      }
    } finally {
      _loading = false;
    }
  }
}
