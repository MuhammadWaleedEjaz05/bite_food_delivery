import 'package:bite_food_delivery/features/cart/models/cart_item_model.dart';

abstract interface class CartWriter {
  Future<void> add({required String userId, required CartItemModel item});
}
