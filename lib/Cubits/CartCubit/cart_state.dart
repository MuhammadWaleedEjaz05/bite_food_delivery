part of 'cart_cubit.dart';

@immutable
sealed class CartState {}

final class CartInitial extends CartState {}

final class CartLoading extends CartState {}

final class CartLoaded extends CartState {
  final List<CartModel> cartItems;
  double get totalAmount =>
      cartItems.fold(0, (sum, item) => sum + item.totalPrice);
  CartLoaded({required this.cartItems});
}

final class CartError extends CartState {
  final String message;

  CartError({required this.message});
}

final class CartEmpty extends CartState {}

final class CartItemAdded extends CartState {
  final String productID;
  final List<CartModel> cartItems;
  CartItemAdded({required this.productID, required this.cartItems});
}

final class CartItemRemoved extends CartState {
  final List<CartModel> cartItems;
  CartItemRemoved({required this.cartItems});
}

final class CartItemUpdated extends CartState {
  final String productID;
  final List<CartModel> cartItems;
  CartItemUpdated({required this.productID, required this.cartItems});
}

final class CartCleared extends CartState {}
