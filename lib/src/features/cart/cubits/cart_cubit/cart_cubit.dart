import 'dart:async';

import 'package:bite_food_delivery/src/features/cart/models/cart_model.dart';
import 'package:bite_food_delivery/src/features/cart/models/cart_item_model.dart';
import 'package:bite_food_delivery/src/services/firebase/firebase_db_conn.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  StreamSubscription? _cartSubscription;

  CartCubit() : super(CartInitial());

  void initialize(String userID) {
    loadCart(userID);
  }

  void loadCart(String userID) {
    _cartSubscription?.cancel();
    Future.delayed(const Duration(seconds: 1));
    _cartSubscription = getCart(userID).listen(
      (cart) {
        if (cart == null || cart.cartItems.isEmpty) {
          emit(CartEmpty());
        } else {
          emit(CartLoaded(cart: cart));
        }
      },
      onError: (error) {
        emit(CartError(message: error.toString()));
      },
    );
  }

  Future<void> addToCart({
    required String userID,
    required CartItemModel cartItem,
  }) async {
    try {
      final db = getCollection('CartDB');

      final cartQuery = await db
          .where('userID', isEqualTo: userID)
          .limit(1)
          .get();
      String cartID;

      if (cartQuery.docs.isEmpty) {
        final newCart = CartModel(userID: userID);
        cartID = newCart.cartID;
        await db.doc(cartID).set(newCart.toJson());
      } else {
        cartID = cartQuery.docs.first.id;
      }

      final productsCollection = db.doc(cartID).collection('Products');
      final existingProduct = await productsCollection
          .where('productID', isEqualTo: cartItem.productID)
          .get();

      if (existingProduct.docs.isEmpty) {
        emit(CartItemAdded(productID: cartItem.productID, cart: null));
        await productsCollection.doc(cartItem.productID).set(cartItem.toJson());
      } else {
        final existingDoc = existingProduct.docs.first;
        final existingItem = CartItemModel.fromJson(existingDoc.data());
        final updatedItem = existingItem.copyWith(
          quantity: existingItem.quantity + cartItem.quantity,
        );
        emit(CartItemUpdated(productID: cartItem.productID, cart: null));
        await productsCollection
            .doc(existingDoc.id)
            .update(updatedItem.toJson());
      }
    } catch (e) {
      emit(CartError(message: 'Failed to add item to cart: ${e.toString()}'));
    }
  }

  Future<void> removeFromCart({
    required String cartID,
    required String productID,
  }) async {
    try {
      final db = getCollection('CartDB');
      await db.doc(cartID).collection('Products').doc(productID).delete();
    } catch (e) {
      emit(
        CartError(message: 'Failed to remove item from cart: ${e.toString()}'),
      );
    }
  }

  Future<void> updateCartItem({
    required String cartID,
    required CartItemModel cartItem,
  }) async {
    try {
      final db = getCollection('CartDB');
      if (cartItem.quantity <= 0) {
        await removeFromCart(cartID: cartID, productID: cartItem.productID);
      } else {
        await db
            .doc(cartID)
            .collection('Products')
            .doc(cartItem.productID)
            .update(cartItem.toJson());
      }
    } catch (e) {
      emit(CartError(message: 'Failed to update cart item: ${e.toString()}'));
    }
  }

  Future<void> clearCart(String userID) async {
    try {
      final db = getCollection('CartDB');
      final cartQuery = await db
          .where('userID', isEqualTo: userID)
          .limit(1)
          .get();

      if (cartQuery.docs.isNotEmpty) {
        final cartID = cartQuery.docs.first.id;
        final products = await db.doc(cartID).collection('Products').get();
        for (var doc in products.docs) {
          await doc.reference.delete();
        }
      }
      emit(CartCleared());
    } catch (e) {
      emit(CartError(message: 'Failed to clear cart: ${e.toString()}'));
    }
  }

  @override
  Future<void> close() {
    _cartSubscription?.cancel();
    return super.close();
  }
}

Stream<CartModel?> getCart(String userID) {
  final db = getCollection('CartDB');
  late StreamController<CartModel?> controller;
  StreamSubscription? outerSubscription;
  StreamSubscription? innerSubscription;

  void startListening() {
    outerSubscription = db
        .where('userID', isEqualTo: userID)
        .limit(1)
        .snapshots()
        .listen(
          (cartSnapshot) {
            if (cartSnapshot.docs.isEmpty) {
              innerSubscription?.cancel();
              controller.add(null);
              return;
            }

            final cartDoc = cartSnapshot.docs.first;
            final cartData = cartDoc.data() as Map<String, dynamic>;
            final cartID = cartDoc.id;

            innerSubscription?.cancel();
            innerSubscription = db
                .doc(cartID)
                .collection('Products')
                .snapshots()
                .listen(
                  (productsSnapshot) {
                    final cartItems = productsSnapshot.docs.map((doc) {
                      return CartItemModel.fromJson(doc.data());
                    }).toList();

                    controller.add(
                      CartModel.fromJson({
                        ...cartData,
                        'cartID': cartID,
                      }, cartItems: cartItems),
                    );
                  },
                  onError: (e) {
                    controller.addError(e);
                  },
                );
          },
          onError: (e) {
            controller.addError(e);
          },
        );
  }

  void stopListening() {
    innerSubscription?.cancel();
    outerSubscription?.cancel();
  }

  controller = StreamController<CartModel?>.broadcast(
    onListen: startListening,
    onCancel: stopListening,
  );

  return controller.stream;
}
