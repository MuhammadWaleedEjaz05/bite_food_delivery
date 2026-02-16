part of 'filter_restaurants_cubit.dart';

enum RatingFilterRange { below35, between35And40, above40 }

enum DeliveryTimeFilterRange { under15, between15And30, over30 }

final class FilterRestaurantsState extends Equatable {
  const FilterRestaurantsState({this.ratingRange, this.deliveryTimeRange});

  final RatingFilterRange? ratingRange;
  final DeliveryTimeFilterRange? deliveryTimeRange;

  FilterRestaurantsState copyWith({
    RatingFilterRange? ratingRange,
    DeliveryTimeFilterRange? deliveryTimeRange,
  }) {
    return FilterRestaurantsState(
      ratingRange: ratingRange ?? this.ratingRange,
      deliveryTimeRange: deliveryTimeRange ?? this.deliveryTimeRange,
    );
  }

  @override
  List<Object?> get props => [ratingRange, deliveryTimeRange];
}
