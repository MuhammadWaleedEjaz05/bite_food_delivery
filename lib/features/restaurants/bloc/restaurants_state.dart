part of 'restaurants_cubit.dart';

sealed class RestaurantsState {}

final class RestaurantsInitial extends RestaurantsState {}

final class RestaurantsLoading extends RestaurantsState {}

final class RestaurantsLoaded extends RestaurantsState {
  final List<RestaurantModel> restaurants;

  RestaurantsLoaded({
    required this.restaurants,
    this.refreshing = false,
    this.refreshFailed = false,
  });
  late final List<RestaurantModel> openRestaurants = restaurants
      .where((restaurant) => restaurant.isOpen)
      .toList(growable: false);
  final bool refreshing;
  final bool refreshFailed;
}

final class RestaurantsError extends RestaurantsState {
  final String message;

  RestaurantsError({required this.message});
}

final class RestaurantsUploading extends RestaurantsState {}

final class RestaurantsUploaded extends RestaurantsState {
  final RestaurantModel restaurant;

  RestaurantsUploaded({required this.restaurant});
}
