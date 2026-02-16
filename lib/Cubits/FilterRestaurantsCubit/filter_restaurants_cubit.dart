import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'filter_restaurants_state.dart';

class FilterRestaurantsCubit extends Cubit<FilterRestaurantsState> {
  FilterRestaurantsCubit() : super(FilterRestaurantsInitial());

  void filterByRating(double rating) {
    emit(RestaurantFilteredByRating(rating: rating));
  }

  void filterByDeliveryTime(int deliveryTime) {
    emit(RestaurantFilteredByDeliveryTime(deliveryTime: deliveryTime));
  }

  void filterByPriceRange(String priceRange) {
    emit(RestaurantFilteredByPricing(priceRange: priceRange));
  }
}
