import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:bite_food_delivery/core/models/coordinates.dart';
import 'package:bite_food_delivery/features/restaurants/models/restaurants_model.dart';

abstract final class RestaurantDto {
  static RestaurantModel decode(Map<String, dynamic> json) {
    final location = json['geoLocation'];
    final coordinates = switch (location) {
      GeoPoint p => Coordinates(p.latitude, p.longitude),
      Map m => Coordinates(
        (m['latitude'] as num?)?.toDouble() ?? 0,
        (m['longitude'] as num?)?.toDouble() ?? 0,
      ),
      _ => const Coordinates(0, 0),
    };
    return RestaurantModel(
      id: json['id'] as String,
      name: json['name'] as String,
      logoUrl: json['logoUrl'] as String? ?? '',
      description: json['description'] as String? ?? '',
      address: json['address'] as String? ?? '',
      rating: (json['rating'] as num?)?.toDouble() ?? 0,
      reviewsCount: (json['reviewsCount'] as num?)?.toInt() ?? 0,
      deliveryFee: (json['deliveryFee'] as num?)?.toDouble() ?? 0,
      deliveryTime: (json['deliveryTime'] as num?)?.toDouble() ?? 0,
      isOpen: json['isOpen'] as bool? ?? false,
      category: json['category'] as String? ?? '',
      isFavorite: json['isFavorite'] as bool? ?? false,
      geoLocation: coordinates,
    );
  }

  static Map<String, dynamic> encode(RestaurantModel restaurant) => {
    'id': restaurant.id,
    'name': restaurant.name,
    'logoUrl': restaurant.logoUrl,
    'description': restaurant.description,
    'address': restaurant.address,
    'rating': restaurant.rating,
    'reviewsCount': restaurant.reviewsCount,
    'deliveryFee': restaurant.deliveryFee,
    'deliveryTime': restaurant.deliveryTime,
    'isOpen': restaurant.isOpen,
    'category': restaurant.category,
    'isFavorite': restaurant.isFavorite,
    'geoLocation': GeoPoint(
      restaurant.geoLocation.latitude,
      restaurant.geoLocation.longitude,
    ),
  };
}
