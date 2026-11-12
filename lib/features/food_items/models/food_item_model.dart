import 'package:equatable/equatable.dart';

class FoodItemModel extends Equatable {
  final String id;
  final String name;
  final String category;
  final String description;
  final String restaurantId;
  final double price;
  final List<String> images;
  final List<String> sizes;
  final Map<String, String> flavors;
  final bool? isAvailable;
  final bool? isPopular;
  final bool? isFavorite;

  const FoodItemModel({
    required this.id,
    required this.name,
    required this.category,
    required this.description,
    required this.restaurantId,
    required this.price,
    required this.images,
    required this.sizes,
    required this.flavors,
    this.isAvailable = true,
    this.isPopular = false,
    this.isFavorite = false,
  });

  factory FoodItemModel.fromJson(Map<String, dynamic> json) {
    return FoodItemModel(
      id: json['id'] as String,
      name: json['name'] as String,
      category: json['category'] as String,
      description: json['description'] as String,
      restaurantId: json['RestuarantId'] as String,
      price: (json['price'] as num).toDouble(),
      images: List<String>.unmodifiable(json['images'] as List? ?? const []),
      sizes: List<String>.unmodifiable(json['sizes'] as List? ?? const []),
      flavors: Map<String, String>.unmodifiable(
        Map<String, String>.from(json['flavors'] as Map? ?? const {}),
      ),
      isAvailable: json['isAvailable'] as bool? ?? true,
      isPopular: json['isPopular'] as bool?,
      isFavorite: json['isFavorite'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'category': category,
      'description': description,
      'RestuarantId': restaurantId,
      'price': price,
      'images': images,
      'sizes': sizes,
      'flavors': flavors,
      'isAvailable': isAvailable,
      'isPopular': isPopular,
      'isFavorite': isFavorite,
    };
  }

  FoodItemModel copyWith({
    String? id,
    String? name,
    String? category,
    String? description,
    String? restaurantId,
    double? price,
    List<String>? images,
    List<String>? sizes,
    Map<String, String>? flavors,
    bool? isAvailable,
    bool? isPopular,
    bool? isFavorite,
  }) {
    return FoodItemModel(
      id: id ?? this.id,
      name: name ?? this.name,
      category: category ?? this.category,
      description: description ?? this.description,
      restaurantId: restaurantId ?? this.restaurantId,
      price: price ?? this.price,
      images: images ?? this.images,
      sizes: sizes ?? this.sizes,
      flavors: flavors ?? this.flavors,
      isAvailable: isAvailable ?? this.isAvailable,
      isPopular: isPopular ?? this.isPopular,
      isFavorite: isFavorite ?? this.isFavorite,
    );
  }

  @override
  List<Object?> get props => [
    id,
    name,
    category,
    description,
    restaurantId,
    price,
    images,
    sizes,
    flavors,
    isAvailable,
    isPopular,
    isFavorite,
  ];
}
