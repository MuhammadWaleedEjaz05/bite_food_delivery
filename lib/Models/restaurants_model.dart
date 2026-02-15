import 'package:equatable/equatable.dart';

class RestaurantModel extends Equatable {
  final String id;
  final String name;
  final String logoUrl;
  final String description;
  final String address;
  final double rating;
  final int reviewsCount;
  final double deliveryFee;
  final double distance;
  final bool isOpen;
  final String category;

  const RestaurantModel({
    required this.id,
    required this.name,
    required this.logoUrl,
    required this.description,
    required this.address,
    required this.rating,
    required this.reviewsCount,
    required this.deliveryFee,
    required this.distance,
    required this.isOpen,
    required this.category,
  });

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
      distance: (json['distance'] as num).toDouble(),
      isOpen: json['isOpen'],
      category: json['category'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'logoUrl': logoUrl,
      'description': description,
      'address': address,
      'rating': rating,
      'reviewsCount': reviewsCount,
      'deliveryFee': deliveryFee,
      'distance': distance,
      'isOpen': isOpen,
      'category': category,
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
    double? distance,
    bool? isOpen,
    String? category,
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
      distance: distance ?? this.distance,
      isOpen: isOpen ?? this.isOpen,
      category: category ?? this.category,
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
    distance,
    isOpen,
    category,
  ];
}
