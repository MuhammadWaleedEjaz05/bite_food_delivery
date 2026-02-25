import 'dart:async';
import 'dart:convert';

import 'package:bite_food_delivery/Cubits/NotificationCubit/notifications_cubit.dart';
import 'package:bite_food_delivery/Models/cart_model.dart';
import 'package:bite_food_delivery/Models/order_model.dart';
import 'package:bite_food_delivery/configs/firebase_db_conn.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'order_state.dart';

const String _activeOrderKey = 'active_order';

class OrderCubit extends Cubit<OrderState> {
  final NotificationsCubit _notificationsCubit;

  OrderCubit({required NotificationsCubit notificationsCubit})
    : _notificationsCubit = notificationsCubit,
      super(OrderInitial());

  OrderModel? _activeOrder;
  OrderModel? get activeOrder => _activeOrder;
  bool get hasActiveOrder =>
      _activeOrder != null &&
      _activeOrder!.orderStatus != OrderStatus.delivered &&
      _activeOrder!.orderStatus != OrderStatus.cancelled;

  StreamSubscription? _activeOrderSubscription;
  StreamSubscription? _orderHistorySubscription;

  Future<void> _saveActiveOrder(OrderModel order) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_activeOrderKey, jsonEncode(order.toJson()));
  }

  Future<void> _clearSavedActiveOrder() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_activeOrderKey);
  }

  void _listenToActiveOrder(String orderId) {
    _activeOrderSubscription?.cancel();

    final db = getCollection('OrdersDB');
    _activeOrderSubscription = db
        .doc(orderId)
        .snapshots()
        .listen(
          (snapshot) {
            if (!snapshot.exists) return;

            final data = snapshot.data() as Map<String, dynamic>?;
            if (data == null) return;

            final updatedOrder = OrderModel.fromJson(data);

            if (_activeOrder == null ||
                _activeOrder!.orderStatus != updatedOrder.orderStatus) {
              if (updatedOrder.orderStatus == OrderStatus.delivered) {
                _notificationsCubit.notifyOrderStatusChanged(updatedOrder);
                _activeOrder = null;
                _clearSavedActiveOrder();
                _activeOrderSubscription?.cancel();
                _activeOrderSubscription = null;
                emit(ActiveOrderDelivered(updatedOrder));
              } else {
                if (_activeOrder != null) {
                  _notificationsCubit.notifyOrderStatusChanged(updatedOrder);
                }
                _activeOrder = updatedOrder;
                _saveActiveOrder(updatedOrder);
                emit(ActiveOrderUpdated(updatedOrder));
              }
            }
          },
          onError: (error) {
            emit(OrderError(error.toString()));
          },
        );
  }

  Future<void> loadActiveOrder() async {
    final prefs = await SharedPreferences.getInstance();
    final raw = prefs.getString(_activeOrderKey);
    if (raw != null) {
      try {
        final order = OrderModel.fromJson(
          jsonDecode(raw) as Map<String, dynamic>,
        );
        if (order.orderStatus != OrderStatus.delivered) {
          _activeOrder = order;
          emit(OrderPlaced(order));
          _listenToActiveOrder(order.orderId);
        } else {
          await prefs.remove(_activeOrderKey);
        }
      } catch (_) {
        await prefs.remove(_activeOrderKey);
      }
    }
  }

  Future<void> placeOrder(OrderModel order) async {
    emit(OrderLoading());
    try {
      final db = getCollection('OrdersDB');
      final cartDB = getCollection('CartDB');
      final cartProducts = cartDB.doc(order.cartID).collection('Products');
      final cartData = await cartProducts.get();
      if (cartData.docs.isEmpty) {
        emit(const OrderError('Cart is empty'));
        return;
      }
      final batch = database.batch();
      batch.set(db.doc(order.orderId), order.toJson());
      final orderItemsRef = db.doc(order.orderId).collection('Items');
      for (final doc in cartData.docs) {
        batch.set(orderItemsRef.doc(), doc.data());
        batch.delete(doc.reference);
      }
      batch.delete(cartDB.doc(order.cartID));
      await batch.commit();

      _activeOrder = order;
      await _saveActiveOrder(order);
      emit(OrderPlaced(order));
      _notificationsCubit.notifyOrderPlaced(order);

      _listenToActiveOrder(order.orderId);
    } catch (e) {
      emit(OrderError(e.toString()));
    }
  }

  Future<void> clearActiveOrder() async {
    _activeOrderSubscription?.cancel();
    _activeOrderSubscription = null;
    _activeOrder = null;
    await _clearSavedActiveOrder();
    emit(OrderInitial());
  }

  void loadOrderHistory(String userId) {
    emit(OrderLoading());
    _orderHistorySubscription?.cancel();

    final db = getCollection('OrdersDB');
    _orderHistorySubscription = db
        .where('userId', isEqualTo: userId)
        .snapshots()
        .listen(
          (querySnapshot) {
            final orders = querySnapshot.docs
                .map(
                  (doc) =>
                      OrderModel.fromJson(doc.data() as Map<String, dynamic>),
                )
                .toList();
            emit(OrderHistoryLoaded(orders));
          },
          onError: (error) {
            emit(OrderError(error.toString()));
          },
        );
  }

  void stopListeningToOrderHistory() {
    _orderHistorySubscription?.cancel();
    _orderHistorySubscription = null;
  }

  Future<void> updateOrderStatus(String orderId, OrderStatus newStatus) async {
    emit(OrderLoading());
    try {
      final db = getCollection('OrdersDB');
      final orderDoc = db.doc(orderId);
      final orderSnapshot = await orderDoc.get();
      if (!orderSnapshot.exists) {
        emit(const OrderError('Order not found'));
        return;
      }
      final orderData = orderSnapshot.data() as Map<String, dynamic>;
      final order = OrderModel.fromJson(orderData);
      final updatedOrder = order.copyWith(orderStatus: newStatus);
      await orderDoc.update({'orderStatus': newStatus.name});

      if (_activeOrder?.orderId == orderId) {
        if (newStatus == OrderStatus.delivered) {
          _activeOrder = null;
          await _clearSavedActiveOrder();
        } else {
          _activeOrder = updatedOrder;
          await _saveActiveOrder(updatedOrder);
        }
      }

      emit(OrderStatusUpdated(updatedOrder));
    } catch (e) {
      emit(OrderError(e.toString()));
    }
  }

  Future<void> cancelOrder(String orderId) async {
    emit(OrderLoading());
    try {
      final db = getCollection('OrdersDB');
      final orderDoc = db.doc(orderId);
      final orderSnapshot = await orderDoc.get();

      if (!orderSnapshot.exists) {
        emit(const OrderError('Order not found'));
        return;
      }

      final orderData = orderSnapshot.data() as Map<String, dynamic>;
      final order = OrderModel.fromJson(orderData);

      if (order.orderStatus == OrderStatus.dispatched ||
          order.orderStatus == OrderStatus.delivered) {
        emit(const OrderError('Order cannot be cancelled at this stage'));
        return;
      }

      if (_activeOrder?.orderId == orderId) {
        _activeOrderSubscription?.cancel();
        _activeOrderSubscription = null;
        _activeOrder = null;
        await _clearSavedActiveOrder();
      }

      await orderDoc.update({'orderStatus': OrderStatus.cancelled.name});
      final cancelledOrder = order.copyWith(orderStatus: OrderStatus.cancelled);
      _notificationsCubit.notifyOrderStatusChanged(cancelledOrder);
      emit(OrderCancelled(cancelledOrder));
    } catch (e) {
      emit(OrderError(e.toString()));
    }
  }

  Future<void> reorderFromHistory(String orderId, String userId) async {
    emit(OrderLoading());
    try {
      final orderDB = getCollection('OrdersDB');
      final cartDB = getCollection('CartDB');

      // Fetch items from the old order
      final orderItems = await orderDB.doc(orderId).collection('Items').get();
      if (orderItems.docs.isEmpty) {
        emit(const OrderError('No items found in this order'));
        return;
      }

      // Clear any existing cart for the user
      final existingCart = await cartDB
          .where('userID', isEqualTo: userId)
          .limit(1)
          .get();

      final batch = database.batch();

      if (existingCart.docs.isNotEmpty) {
        final oldCartId = existingCart.docs.first.id;
        final oldProducts = await cartDB
            .doc(oldCartId)
            .collection('Products')
            .get();
        for (final doc in oldProducts.docs) {
          batch.delete(doc.reference);
        }
        batch.delete(cartDB.doc(oldCartId));
      }

      // Create a new cart with the old order's items
      final newCart = CartModel(userID: userId);
      batch.set(cartDB.doc(newCart.cartID), newCart.toJson());

      final newProductsRef = cartDB.doc(newCart.cartID).collection('Products');
      for (final doc in orderItems.docs) {
        final data = doc.data();
        final productID = data['productID'] as String? ?? doc.id;
        batch.set(newProductsRef.doc(productID), data);
      }

      await batch.commit();

      emit(ReorderLoaded(newCart.cartID));
    } catch (e) {
      emit(OrderError(e.toString()));
    }
  }

  @override
  Future<void> close() {
    _activeOrderSubscription?.cancel();
    _orderHistorySubscription?.cancel();
    return super.close();
  }
}
