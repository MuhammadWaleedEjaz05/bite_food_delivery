import 'package:equatable/equatable.dart';
import 'package:bite_food_delivery/core/models/coordinates.dart';

class RestaurantModel extends Equatable {
  final String id;
  final String name;
  final String logoUrl;
  final String description;
  final String address;
  final double rating;
  final int reviewsCount;
  final double deliveryFee;
  final double deliveryTime;
  final bool isOpen;
  final String category;
  final bool isFavorite;
  final Coordinates geoLocation;

  const RestaurantModel({
    required this.id,
    required this.name,
    required this.logoUrl,
    required this.description,
    required this.address,
    required this.rating,
    required this.reviewsCount,
    required this.deliveryFee,
    required this.deliveryTime,
    required this.isOpen,
    required this.category,
    required this.isFavorite,
    Coordinates? geoLocation,
  }) : geoLocation = geoLocation ?? const Coordinates(0, 0);

  RestaurantModel copyWith({
    String? id,
    String? name,
    String? logoUrl,
    String? description,
    String? address,
    double? rating,
    int? reviewsCount,
    double? deliveryFee,
    double? deliveryTime,
    bool? isFavorite,
    bool? isOpen,
    String? category,
    Coordinates? geoLocation,
  }) {
    return RestaurantModel(
      id: id ?? this.id,
      name: name ?? this.name,
      logoUrl: logoUrl ?? this.logoUrl,
      description: description ?? this.description,
      address: address ?? this.address,
      rating: rating ?? this.rating,
      reviewsCount: reviewsCount ?? this.reviewsCount,
      deliveryFee: deliveryFee ?? this.deliveryFee,
      deliveryTime: deliveryTime ?? this.deliveryTime,
      isFavorite: isFavorite ?? this.isFavorite,
      isOpen: isOpen ?? this.isOpen,
      category: category ?? this.category,
      geoLocation: geoLocation ?? this.geoLocation,
    );
  }

  @override
  List<Object?> get props => [
    id,
    name,
    logoUrl,
    description,
    address,
    rating,
    reviewsCount,
    deliveryFee,
    deliveryTime,
    isFavorite,
    isOpen,
    category,
    geoLocation,
  ];
}
