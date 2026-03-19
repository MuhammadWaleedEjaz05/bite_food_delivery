import 'package:bite_food_delivery/src/features/cart/models/cart_item_model.dart';
import 'package:equatable/equatable.dart';
import 'package:uuid/uuid.dart';

const Uuid uuid = Uuid();

class CartModel extends Equatable {
  final String cartID;
  final String userID;
  final List<CartItemModel> cartItems;

  CartModel({
    String? cartID,
    required this.userID,
    List<CartItemModel>? cartItems,
  }) : cartID = cartID ?? uuid.v4(),
       cartItems = cartItems ?? [];

  double get totalPrice =>
      cartItems.fold(0.0, (sum, item) => sum + item.totalPrice);

  int get totalItems => cartItems.fold(0, (sum, item) => sum + item.quantity);

  factory CartModel.fromJson(
    Map<String, dynamic> json, {
    List<CartItemModel>? cartItems,
  }) {
    return CartModel(
      cartID: json['cartID'] as String,
      userID: json['userID'] as String,
      cartItems: cartItems,
    );
  }

  Map<String, dynamic> toJson() {
    return {'cartID': cartID, 'userID': userID};
  }

  CartModel copyWith({
    String? cartID,
    String? userID,
    List<CartItemModel>? cartItems,
  }) {
    return CartModel(
      cartID: cartID ?? this.cartID,
      userID: userID ?? this.userID,
      cartItems: cartItems ?? this.cartItems,
    );
  }

  @override
  List<Object?> get props => [cartID, userID, cartItems];
}
