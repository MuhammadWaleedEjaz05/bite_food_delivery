import 'dart:convert';
import 'package:bite_food_delivery/features/food_items/models/food_item_model.dart';
import 'package:equatable/equatable.dart';

class CartItemModel extends Equatable {
  final String productID;
  final String? lineID;
  String get documentID => lineID ?? productID;
  String get configurationID {
    final flavors =
        (selectedFlavors ?? (selectedFlavor ?? '').split(', '))
            .where((f) => f.isNotEmpty)
            .toSet()
            .toList()
          ..sort();
    return base64Url.encode(
      utf8.encode(jsonEncode([productID, selectedSize ?? '', flavors])),
    );
  }

  final FoodItemModel product;
  final int quantity;
  final String? selectedSize;
  final String? selectedFlavor;
  final List<String>? selectedFlavors;

  const CartItemModel({
    required this.productID,
    this.lineID,
    required this.product,
    required this.quantity,
    this.selectedSize,
    this.selectedFlavor,
    this.selectedFlavors,
  });

  double get totalPrice => product.price * quantity;

  factory CartItemModel.fromJson(Map<String, dynamic> json) {
    return CartItemModel(
      productID: json['productID'] as String,
      lineID: json['lineID'] as String?,
      product: FoodItemModel.fromJson(json['product'] as Map<String, dynamic>),
      quantity: json['quantity'] as int,
      selectedSize: json['selectedSize'] as String?,
      selectedFlavor: json['selectedFlavor'] as String?,
      selectedFlavors: json['selectedFlavors'] is List
          ? List<String>.unmodifiable(json['selectedFlavors'] as List)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'productID': productID,
      if (lineID != null) 'lineID': lineID,
      'product': product.toJson(),
      'quantity': quantity,
      'selectedSize': selectedSize,
      'selectedFlavor': selectedFlavor,
      if (selectedFlavors != null) 'selectedFlavors': selectedFlavors,
    };
  }

  CartItemModel copyWith({
    String? productID,
    String? lineID,
    FoodItemModel? product,
    int? quantity,
    String? selectedSize,
    String? selectedFlavor,
    List<String>? selectedFlavors,
  }) {
    return CartItemModel(
      productID: productID ?? this.productID,
      lineID: lineID ?? this.lineID,
      product: product ?? this.product,
      quantity: quantity ?? this.quantity,
      selectedSize: selectedSize ?? this.selectedSize,
      selectedFlavor: selectedFlavor ?? this.selectedFlavor,
      selectedFlavors: selectedFlavors ?? this.selectedFlavors,
    );
  }

  @override
  List<Object?> get props => [
    productID,
    lineID,
    product,
    quantity,
    selectedSize,
    selectedFlavor,
    selectedFlavors,
  ];
}
