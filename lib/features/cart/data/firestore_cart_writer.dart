import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:bite_food_delivery/features/cart/domain/cart_writer.dart';
import 'package:bite_food_delivery/features/cart/models/cart_item_model.dart';

class FirestoreCartWriter implements CartWriter {
  const FirestoreCartWriter(this._database);
  final FirebaseFirestore _database;
  @override
  Future<void> add({
    required String userId,
    required CartItemModel item,
  }) async {
    if (userId.isEmpty ||
        item.quantity < 1 ||
        item.product.isAvailable == false) {
      throw StateError('invalid_cart_item');
    }
    final carts = _database.collection('CartDB');
    final existing = await carts
        .where('userID', isEqualTo: userId)
        .limit(1)
        .get();
    // New carts use a stable per-user ID; retain existing legacy cart IDs.
    final cart = existing.docs.isEmpty
        ? carts.doc(userId)
        : existing.docs.first.reference;
    final products = cart.collection('Products');
    final legacy = await products
        .where('productID', isEqualTo: item.productID)
        .get();
    var line = products.doc(item.configurationID);
    for (final doc in legacy.docs) {
      if (CartItemModel.fromJson(doc.data()).configurationID ==
          item.configurationID) {
        line = doc.reference;
        break;
      }
    }
    await _database.runTransaction((transaction) async {
      final parent = await transaction.get(cart);
      final previous = await transaction.get(line);
      if (parent.data()?['checkoutQuoteId'] != null) {
        throw StateError('payment_pending');
      }
      final quantity = previous.exists
          ? CartItemModel.fromJson(previous.data()!).quantity
          : 0;
      if (!parent.exists) {
        transaction.set(cart, {'cartID': cart.id, 'userID': userId});
      }
      transaction.set(
        line,
        item
            .copyWith(lineID: line.id, quantity: quantity + item.quantity)
            .toJson(),
      );
    });
  }
}
