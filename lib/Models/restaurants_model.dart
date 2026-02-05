import 'package:equatable/equatable.dart';

class RestaurantsModel extends Equatable {
  final String restaurantsID;
  final String restaurantsName;
  final String restaurantsCategory;
  final String restaurantsImage;
  final double restaurantsRating;
  final String restaurantsAddress;
  final String restaurantsDeliveryTime;
  final double restaurantsDeliveryFee;
  final bool isOpen;

  const RestaurantsModel({
    required this.restaurantsID,
    required this.restaurantsName,
    required this.restaurantsCategory,
    required this.restaurantsImage,
    required this.restaurantsRating,
    required this.restaurantsAddress,
    required this.restaurantsDeliveryTime,
    required this.restaurantsDeliveryFee,
    this.isOpen = true,
  });

  factory RestaurantsModel.fromJson(Map<String, dynamic> json) {
    return RestaurantsModel(
      restaurantsID: json['id'] as String,
      restaurantsName: json['name'] as String,
      restaurantsCategory: json['category'] as String,
      restaurantsImage: json['image'] as String,
      restaurantsRating: (json['rating'] as num).toDouble(),
      restaurantsAddress: json['address'] as String,
      restaurantsDeliveryTime: json['delivery_time'] as String,
      restaurantsDeliveryFee: (json['delivery_fee'] as num).toDouble(),
      isOpen: json['is_open'] as bool? ?? true,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': restaurantsID,
      'name': restaurantsName,
      'category': restaurantsCategory,
      'image': restaurantsImage,
      'rating': restaurantsRating,
      'address': restaurantsAddress,
      'delivery_time': restaurantsDeliveryTime,
      'delivery_fee': restaurantsDeliveryFee,
      'is_open': isOpen,
    };
  }

  @override
  List<Object?> get props => [
    restaurantsID,
    restaurantsName,
    restaurantsCategory,
    restaurantsImage,
    restaurantsRating,
    restaurantsAddress,
    restaurantsDeliveryTime,
    restaurantsDeliveryFee,
    isOpen,
  ];
}
