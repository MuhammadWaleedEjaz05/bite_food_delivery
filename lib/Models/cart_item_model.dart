import 'package:bite_food_delivery/Models/food_item_model.dart';
import 'package:equatable/equatable.dart';

class CartItemModel extends Equatable {
  final String productID;
  final FoodItemModel product;
  final int quantity;
  final String? selectedSize;
  final String? selectedFlavor;

  const CartItemModel({
    required this.productID,
    required this.product,
    required this.quantity,
    this.selectedSize,
    this.selectedFlavor,
  });

  double get totalPrice => product.price * quantity;

  factory CartItemModel.fromJson(Map<String, dynamic> json) {
    return CartItemModel(
      productID: json['productID'] as String,
      product: FoodItemModel.fromJson(json['product'] as Map<String, dynamic>),
      quantity: json['quantity'] as int,
      selectedSize: json['selectedSize'] as String?,
      selectedFlavor: json['selectedFlavor'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'productID': productID,
      'product': product.toJson(),
      'quantity': quantity,
      'selectedSize': selectedSize,
      'selectedFlavor': selectedFlavor,
    };
  }

  CartItemModel copyWith({
    String? productID,
    FoodItemModel? product,
    int? quantity,
    String? selectedSize,
    String? selectedFlavor,
  }) {
    return CartItemModel(
      productID: productID ?? this.productID,
      product: product ?? this.product,
      quantity: quantity ?? this.quantity,
      selectedSize: selectedSize ?? this.selectedSize,
      selectedFlavor: selectedFlavor ?? this.selectedFlavor,
    );
  }

  @override
  List<Object?> get props => [
    productID,
    product,
    quantity,
    selectedSize,
    selectedFlavor,
  ];
}
