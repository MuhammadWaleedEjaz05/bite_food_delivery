part of 'cart_cubit.dart';

sealed class CartState {}

final class CartInitial extends CartState {}

final class CartLoading extends CartState {}

final class CartEmpty extends CartState {}

final class CartError extends CartState {
  CartError({required this.message});
  final String message;
}

final class CartLoaded extends CartState {
  CartLoaded({
    required this.cart,
    this.pending = const {},
    this.failed = false,
  });
  final CartModel cart;
  final Set<String> pending;
  final bool failed;
  double get totalAmount => cart.totalPrice;
  int get totalItems => cart.totalItems;
  List<CartItemModel> get cartItems => cart.cartItems;
  bool get validForCheckout =>
      pending.isEmpty &&
      !failed &&
      cartItems.isNotEmpty &&
      cartItems.every(
        (line) =>
            line.quantity > 0 &&
            line.quantity <= 99 &&
            line.product.restaurantId.isNotEmpty &&
            line.product.price.isFinite &&
            line.product.price >= 0 &&
            line.product.isAvailable != false,
      ) &&
      cartItems.map((line) => line.product.restaurantId).toSet().length == 1;
}
