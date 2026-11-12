import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../domain/cart_repository.dart';
import '../models/cart_model.dart';
import '../models/cart_item_model.dart';

class FirestoreCartRepository implements CartRepository {
  const FirestoreCartRepository(this.database);
  final FirebaseFirestore database;
  @override
  Stream<CartModel?> watch(String userId) {
    late StreamController<CartModel?> controller;
    StreamSubscription? carts, lines;
    var generation = 0;
    var cancelled = false;
    void error(Object e) {
      if (!cancelled) controller.addError(e);
    }

    controller = StreamController<CartModel?>(
      onListen: () {
        carts = database
            .collection('CartDB')
            .where('userID', isEqualTo: userId)
            .limit(1)
            .snapshots()
            .listen((snapshot) {
              if (cancelled) return;
              final current = ++generation;
              lines?.cancel();
              if (snapshot.docs.isEmpty) {
                controller.add(null);
                return;
              }
              final parent = snapshot.docs.first;
              lines = parent.reference
                  .collection('Products')
                  .snapshots()
                  .listen(
                    (snapshot) {
                      if (cancelled || current != generation) return;
                      try {
                        controller.add(
                          CartModel(
                            cartID: parent.id,
                            userID: userId,
                            cartItems: snapshot.docs
                                .map(
                                  (doc) => CartItemModel.fromJson({
                                    ...doc.data(),
                                    'lineID': doc.id,
                                  }),
                                )
                                .toList(),
                          ),
                        );
                      } catch (e) {
                        error(e);
                      }
                    },
                    onError: (Object e) {
                      if (current == generation) error(e);
                    },
                  );
            }, onError: error);
      },
      onCancel: () async {
        cancelled = true;
        ++generation;
        await lines?.cancel();
        await carts?.cancel();
      },
    );
    return controller.stream;
  }

  @override
  Future<void> setQuantity({
    required String userId,
    required String cartId,
    required String lineId,
    required int expectedQuantity,
    required int quantity,
  }) async {
    if (quantity < 0 || quantity > 99 || userId.isEmpty) {
      throw StateError('invalid_quantity');
    }
    final cart = database.collection('CartDB').doc(cartId);
    final line = cart.collection('Products').doc(lineId);
    await database.runTransaction((transaction) async {
      final parent = await transaction.get(cart);
      final previous = await transaction.get(line);
      if (parent.data()?['checkoutQuoteId'] != null) {
        throw StateError('payment_pending');
      }
      if (parent.data()?['userID'] != userId) throw StateError('cart_owner');
      if (!previous.exists ||
          previous.data()?['quantity'] != expectedQuantity) {
        throw StateError('cart_changed');
      }
      if (quantity == 0) {
        transaction.delete(line);
      } else {
        transaction.update(line, {'quantity': quantity});
      }
    });
  }
}
