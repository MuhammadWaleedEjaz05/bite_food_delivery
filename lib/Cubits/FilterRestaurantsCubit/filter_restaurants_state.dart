part of 'filter_restaurants_cubit.dart';

sealed class FilterRestaurantsState extends Equatable {
  const FilterRestaurantsState();

  @override
  List<Object> get props => [];
}

final class FilterRestaurantsInitial extends FilterRestaurantsState {}

final class RestaurantFilteredByRating extends FilterRestaurantsState {
  final double rating;
  const RestaurantFilteredByRating({required this.rating});
}

final class RestaurantFilteredByDeliveryTime extends FilterRestaurantsState {
  final int deliveryTime;
  const RestaurantFilteredByDeliveryTime({required this.deliveryTime});
}

final class RestaurantFilteredByPricing extends FilterRestaurantsState {
  final String priceRange;
  const RestaurantFilteredByPricing({required this.priceRange});
}
