import 'package:equatable/equatable.dart';
import 'package:uuid/uuid.dart';

final Uuid uuid = Uuid();

class CartModel extends Equatable {
  final String cartID;
  final String productID;
  final String userID;
  final String productName;
  final String productImage;
  final double productPrice;
  final int quantity;
  CartModel({
    String? cartID,
    required this.productID,
    required this.productName,
    required this.userID,
    required this.productImage,
    required this.productPrice,
    required this.quantity,
  }) : cartID = cartID ?? uuid.v4();

  double get totalPrice => productPrice * quantity;

  factory CartModel.fromJson(Map<String, dynamic> json) {
    return CartModel(
      cartID: json['cartID'],
      productID: json['productID'],
      userID: json['userID'],
      productName: json['productName'],
      productImage: json['productImage'],
      productPrice: json['productPrice'].toDouble(),
      quantity: json['quantity'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'cartID': cartID,
      'productID': productID,
      'userID': userID,
      'productName': productName,
      'productImage': productImage,
      'productPrice': productPrice,
      'quantity': quantity,
    };
  }

  CartModel copyWith({
    String? cartID,
    String? productID,
    String? userID,
    String? productName,
    String? productImage,
    double? productPrice,
    int? quantity,
  }) {
    return CartModel(
      cartID: cartID ?? this.cartID,
      productID: productID ?? this.productID,
      userID: userID ?? this.userID,
      productName: productName ?? this.productName,
      productImage: productImage ?? this.productImage,
      productPrice: productPrice ?? this.productPrice,
      quantity: quantity ?? this.quantity,
    );
  }

  @override
  List<Object?> get props => [
    cartID,
    productID,
    userID,
    productName,
    productImage,
    productPrice,
    quantity,
  ];
}
