part of 'cart_cubit.dart';

@immutable
sealed class CartState {}

final class CartInitial extends CartState {}

final class CartLoading extends CartState {}

final class CartLoaded extends CartState {
  final CartModel cart;
  double get totalAmount => cart.totalPrice;
  int get totalItems => cart.totalItems;
  List<CartItemModel> get cartItems => cart.cartItems;

  CartLoaded({required this.cart});
}

final class CartError extends CartState {
  final String message;

  CartError({required this.message});
}

final class CartEmpty extends CartState {}

final class CartItemAdded extends CartState {
  final String productID;
  final CartModel? cart;
  CartItemAdded({required this.productID, this.cart});
}

final class CartItemRemoved extends CartState {
  final CartModel? cart;
  CartItemRemoved({this.cart});
}

final class CartItemUpdated extends CartState {
  final String productID;
  final CartModel? cart;
  CartItemUpdated({required this.productID, this.cart});
}

final class CartCleared extends CartState {}
