import 'dart:async';

import 'package:bite_food_delivery/Models/cart_model.dart';
import 'package:bite_food_delivery/configs/firebase_db_conn.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  StreamSubscription? _cartSubscription;
  List<CartModel> _currentCartItems = [];
  
  CartCubit() : super(CartInitial());

  void initialize(String userID) {
    loadCartItems(userID);
  }

  void loadCartItems(String userID) {
    _cartSubscription?.cancel();

    _cartSubscription = getCartItems(userID).listen(
      (items) {
        _currentCartItems = items;
        if (items.isEmpty) {
          emit(CartEmpty());
        } else {
          emit(CartLoaded(cartItems: items));
        }
      },
      onError: (error) {
        emit(CartError(message: error.toString()));
      },
    );
  }

  Future<void> addToCart(CartModel cartItem) async {
    try {
      final db = getCollection('CartDB');
      final existingItem = await db
          .where('userID', isEqualTo: cartItem.userID)
          .where('productID', isEqualTo: cartItem.productID)
          .get();
      if (existingItem.docs.isEmpty) {
        await db.doc(cartItem.cartID).set(cartItem.toJson());
        emit(CartItemAdded(productID: cartItem.productID, cartItems: _currentCartItems));
      } else {
        final existingDoc = existingItem.docs.first;
        final existingCartItem = CartModel.fromJson(
          existingDoc.data() as Map<String, dynamic>,
        );
        final updatedCartItem = existingCartItem.copyWith(
          quantity: existingCartItem.quantity + cartItem.quantity,
        );
        await db.doc(existingDoc.id).update(updatedCartItem.toJson());
        emit(CartItemUpdated(productID: cartItem.productID, cartItems: _currentCartItems));
      }
    } catch (e) {
      emit(CartError(message: 'Failed to add item to cart: ${e.toString()}'));
    }
  }

  Future<void> removeFromCart(String cartID) async {
    try {
      final db = getCollection('CartDB');
      await db.doc(cartID).delete();
      emit(CartItemRemoved(cartItems: _currentCartItems));
    } catch (e) {
      emit(
        CartError(message: 'Failed to remove item from cart: ${e.toString()}'),
      );
    }
  }

  Future<void> updateCartItem(CartModel cartItem) async {
    try {
      final db = getCollection('CartDB');
      if (cartItem.quantity <= 0) {
        await removeFromCart(cartItem.cartID);
      } else {
        await db.doc(cartItem.cartID).update(cartItem.toJson());
        emit(CartItemUpdated(productID: cartItem.productID, cartItems: _currentCartItems));
      }
    } catch (e) {
      emit(CartError(message: 'Failed to update cart item: ${e.toString()}'));
    }
  }

  Future<void> clearCart(String userID) async {
    try {
      final db = getCollection('CartDB');
      final snapshot = await db.where('userID', isEqualTo: userID).get();
      for (var doc in snapshot.docs) {
        await doc.reference.delete();
      }
      emit(CartCleared());
    } catch (e) {
      emit(CartError(message: 'Failed to clear cart: ${e.toString()}'));
    }
  }
}

Stream<List<CartModel>> getCartItems(String userID) {
  final db = getCollection('CartDB');
  return db.where('userID', isEqualTo: userID).snapshots().map((snapshot) {
    return snapshot.docs.map((doc) {
      return CartModel.fromJson(doc.data() as Map<String, dynamic>);
    }).toList();
  });
}
