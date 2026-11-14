import 'dart:async';
import 'package:bite_food_delivery/features/notifications/bloc/notifications_state.dart';
import 'package:bite_food_delivery/features/notifications/models/notification_model.dart';
import 'package:bite_food_delivery/features/orders/models/order_model.dart';
import 'package:bite_food_delivery/core/utils/shared_preference_functions.dart';
import 'package:bite_food_delivery/core/services/firebase/fcm_initialize.dart';
import 'package:bite_food_delivery/core/services/firebase/firebase_db_conn.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

export 'notifications_state.dart';

class NotificationsCubit extends Cubit<NotificationsState> {
  NotificationsCubit() : super(const NotificationsInitial());

  StreamSubscription? _notificationsSubscription;

  Future<bool> _areNotificationsEnabled() async {
    return getFromSharedPreferencebool('areNotificationsEnabled') ?? true;
  }

  void loadNotifications(String userId) {
    emit(const NotificationsLoading());
    _notificationsSubscription?.cancel();

    try {
      final db = getCollection('NotificationsDB');
      _notificationsSubscription = db
          .where('userId', isEqualTo: userId)
          .orderBy('createdAt', descending: true)
          .snapshots()
          .listen(
            (snapshot) {
              final notifications = snapshot.docs
                  .map(
                    (doc) => NotificationModel.fromJson(
                      doc.data() as Map<String, dynamic>,
                    ),
                  )
                  .toList();
              emit(NotificationsLoaded(notifications));
            },
            onError: (error) {
              emit(NotificationsError(error.toString()));
            },
          );
    } catch (e) {
      emit(NotificationsError(e.toString()));
    }
  }

  Future<void> notifyOrderPlaced(OrderModel order) async {
    final notification = NotificationModel(
      userId: order.userId,
      title: 'Order Placed',
      body:
          'Your order #${order.orderId.length > 8 ? order.orderId.substring(0, 8) : order.orderId} has been placed successfully',
      type: 'order_placed',
      orderId: order.orderId,
    );
    _addNotification(notification);
    if (await _areNotificationsEnabled()) {
      NotificationService.instance.showNotification(
        title: notification.title,
        body: notification.body,
      );
    }
  }

  Future<void> notifyOrderStatusChanged(OrderModel order) async {
    final notification = NotificationModel(
      userId: order.userId,
      title: _titleForStatus(order.orderStatus),
      body: _bodyForStatus(order),
      type: 'order_${order.orderStatus.name}',
      orderId: order.orderId,
    );
    _addNotification(notification);
    if (await _areNotificationsEnabled()) {
      NotificationService.instance.showNotification(
        title: notification.title,
        body: notification.body,
      );
    }
  }

  Future<void> markAsRead(String notificationId, String userId) async {
    try {
      final db = getCollection('NotificationsDB');
      await db.doc(notificationId).update({'isRead': true});
    } catch (_) {}
  }

  Future<void> markAllAsRead(String userId) async {
    try {
      final db = getCollection('NotificationsDB');
      final snapshot = await db.where('userId', isEqualTo: userId).get();
      final batch = FirebaseFirestore.instance.batch();
      for (final doc in snapshot.docs) {
        batch.update(doc.reference, {'isRead': true});
      }
      await batch.commit();
    } catch (_) {}
  }

  Future<void> deleteNotification(String notificationId) async {
    try {
      final db = getCollection('NotificationsDB');
      await db.doc(notificationId).delete();
    } catch (_) {}
  }

  Future<void> _addNotification(NotificationModel notification) async {
    try {
      final db = getCollection('NotificationsDB');
      await db.doc(notification.id).set(notification.toJson());
    } catch (_) {}
  }

  String _titleForStatus(OrderStatus status) {
    switch (status) {
      case OrderStatus.received:
        return 'Order Received';
      case OrderStatus.preparing:
        return 'Order Preparing';
      case OrderStatus.dispatched:
        return 'Out for Delivery';
      case OrderStatus.delivered:
        return 'Order Delivered';
      case OrderStatus.cancelled:
        return 'Order Cancelled';
    }
  }

  String _bodyForStatus(OrderModel order) {
    final shortId = order.orderId.length > 8
        ? order.orderId.substring(0, 8)
        : order.orderId;
    switch (order.orderStatus) {
      case OrderStatus.received:
        return 'Your order #$shortId has been received by the restaurant.';
      case OrderStatus.preparing:
        return 'The kitchen is now preparing your delicious food (#$shortId).';
      case OrderStatus.dispatched:
        return 'The courier is on the way with your food (#$shortId)!';
      case OrderStatus.delivered:
        return 'Your order #$shortId has been delivered. Enjoy your meal!';
      case OrderStatus.cancelled:
        return 'Your order #$shortId was cancelled.';
    }
  }

  @override
  Future<void> close() {
    _notificationsSubscription?.cancel();
    return super.close();
  }
}
