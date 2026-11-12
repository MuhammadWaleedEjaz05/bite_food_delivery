part of 'catalog_route_cubit.dart';

enum CatalogRouteStatus { loading, ready, missing, failed }

class CatalogRouteState {
  const CatalogRouteState({
    this.status = CatalogRouteStatus.loading,
    this.restaurant,
    this.food,
  });
  final CatalogRouteStatus status;
  final RestaurantModel? restaurant;
  final FoodDetailArguments? food;
}
