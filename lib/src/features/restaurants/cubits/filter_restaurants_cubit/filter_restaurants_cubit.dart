import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'filter_restaurants_state.dart';

class FilterRestaurantsCubit extends Cubit<FilterRestaurantsState> {
  FilterRestaurantsCubit() : super(const FilterRestaurantsState());

  void setRatingRange(RatingFilterRange? range) {
    emit(state.copyWith(ratingRange: range));
  }

  void setDeliveryTimeRange(DeliveryTimeFilterRange? range) {
    emit(state.copyWith(deliveryTimeRange: range));
  }

  void clearFilters() {
    emit(const FilterRestaurantsState());
  }
}
