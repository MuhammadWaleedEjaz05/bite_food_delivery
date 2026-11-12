import '../models/cart_model.dart';

abstract interface class CartRepository {
  Stream<CartModel?> watch(String userId);
  Future<void> setQuantity({
    required String userId,
    required String cartId,
    required String lineId,
    required int expectedQuantity,
    required int quantity,
  });
}
