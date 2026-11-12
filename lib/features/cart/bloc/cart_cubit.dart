import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../domain/cart_repository.dart';
import '../models/cart_model.dart';
import '../models/cart_item_model.dart';
part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit(this.repository) : super(CartInitial());
  final CartRepository repository;
  StreamSubscription<CartModel?>? _subscription;
  String? _userId;
  int _generation = 0;
  CartModel? _cart;
  Set<String> _pending = {};
  bool _failed = false;
  String? get userId => _userId;
  void initialize(String userId) {
    if (_userId != userId) loadCart(userId);
  }

  void clearSession() {
    ++_generation;
    _subscription?.cancel();
    _userId = null;
    _cart = null;
    _pending = {};
    _failed = false;
    if (!isClosed) emit(CartEmpty());
  }

  void loadCart(String userId) {
    if (isClosed) return;
    final changed = _userId != userId;
    final generation = ++_generation;
    _subscription?.cancel();
    _userId = userId;
    if (changed) {
      _cart = null;
      _pending = {};
    }
    _failed = false;
    if (_cart == null) emit(CartLoading());
    _subscription = repository
        .watch(userId)
        .listen(
          (cart) {
            if (isClosed || generation != _generation) return;
            if (cart != null && cart.userID != userId) return;
            _cart = cart;
            _failed = false;
            _publish();
          },
          onError: (Object error) {
            if (isClosed || generation != _generation) return;
            _failed = true;
            _publish();
          },
        );
  }

  void retry() {
    final user = _userId;
    if (user != null && _pending.isEmpty) loadCart(user);
  }

  void _publish() {
    if (isClosed) return;
    final cart = _cart;
    if (cart != null && cart.cartItems.isNotEmpty) {
      emit(
        CartLoaded(
          cart: cart,
          pending: Set.unmodifiable(_pending),
          failed: _failed,
        ),
      );
    } else if (_failed) {
      emit(CartError(message: 'cart_update_failed'));
    } else {
      emit(CartEmpty());
    }
  }

  Future<void> updateCartItem({
    required String cartID,
    required CartItemModel cartItem,
  }) async {
    final user = _userId;
    final cart = _cart;
    if (isClosed ||
        user == null ||
        cart == null ||
        cart.cartID != cartID ||
        _pending.contains(cartItem.documentID) ||
        cartItem.quantity < 0 ||
        cartItem.quantity > 99) {
      return;
    }
    final original = cart.cartItems
        .where((item) => item.documentID == cartItem.documentID)
        .firstOrNull;
    if (original == null) return;
    final generation = _generation;
    _pending = {..._pending, cartItem.documentID};
    _failed = false;
    _publish();
    try {
      await repository.setQuantity(
        userId: user,
        cartId: cartID,
        lineId: original.documentID,
        expectedQuantity: original.quantity,
        quantity: cartItem.quantity,
      );
    } catch (_) {
      if (generation == _generation) _failed = true;
    } finally {
      if (!isClosed && generation == _generation) {
        _pending = {..._pending}..remove(original.documentID);
        _publish();
      }
    }
  }

  @override
  Future<void> close() async {
    ++_generation;
    await _subscription?.cancel();
    return super.close();
  }
}
