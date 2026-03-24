import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

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
  final LatLng geoLocation;

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
    LatLng? geoLocation,
  }) : geoLocation = geoLocation ?? const LatLng(0, 0);

  factory RestaurantModel.fromJson(Map<String, dynamic> json) {
    return RestaurantModel(
      id: json['id'],
      name: json['name'],
      logoUrl: json['logoUrl'],
      description: json['description'],
      address: json['address'],
      rating: (json['rating'] as num).toDouble(),
      reviewsCount: json['reviewsCount'],
      deliveryFee: (json['deliveryFee'] as num).toDouble(),
      deliveryTime: (json['deliveryTime'] as num).toDouble(),
      isOpen: json['isOpen'],
      category: json['category'],
      isFavorite: json['isFavorite'],
      geoLocation: json['geoLocation'] != null
          ? LatLng(
              (json['geoLocation'] as GeoPoint).latitude,
              (json['geoLocation'] as GeoPoint).longitude,
            )
          : const LatLng(0, 0),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'logoUrl': logoUrl,
      'address': address,
      'rating': rating,
      'reviewsCount': reviewsCount,
      'deliveryFee': deliveryFee,
      'deliveryTime': deliveryTime,
      'isOpen': isOpen,
      'category': category,
      'isFavorite': isFavorite,
      'geoLocation': {
        'latitude': geoLocation.latitude,
        'longitude': geoLocation.longitude,
      },
    };
  }

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
    LatLng? geoLocation,
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
