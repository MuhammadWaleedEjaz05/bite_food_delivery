part of 'restaurants_cubit.dart';

sealed class RestaurantsState {}

final class RestaurantsInitial extends RestaurantsState {}

final class RestaurantsLoading extends RestaurantsState {}

final class RestaurantsLoaded extends RestaurantsState {
  final List<RestaurantModel> restaurants;

  RestaurantsLoaded({required this.restaurants});
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
