import 'dart:async';

import 'package:bite_food_delivery/Models/notification_model.dart';
import 'package:bite_food_delivery/Models/order_model.dart';
import 'package:bite_food_delivery/configs/fcm_initialize.dart';
import 'package:bite_food_delivery/configs/firebase_db_conn.dart';
import 'package:bite_food_delivery/configs/shared_preference_functions.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'notifications_state.dart';

class NotificationsCubit extends Cubit<NotificationsState> {
  NotificationsCubit() : super(NotificationsInitial());

  StreamSubscription? _notificationsSubscription;

  Future<bool> _areNotificationsEnabled() async {
    return getFromSharedPreferencebool('areNotificationsEnabled') ?? true;
  }

  void loadNotifications(String userId) {
    emit(NotificationsLoading());
    _notificationsSubscription?.cancel();

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
            Future.delayed(const Duration(seconds: 1));
            emit(NotificationsLoaded(notifications));
          },
          onError: (error) {
            emit(NotificationsError(error.toString()));
          },
        );
  }

  Future<void> notifyOrderPlaced(OrderModel order) async {
    final notification = NotificationModel(
      userId: order.userId,
      title: 'Order Placed',
      body:
          'Your order #${order.orderId.substring(0, 8)} has been placed successfully',
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

  Future<void> markAsRead(String notificationId) async {
    try {
      await getCollection(
        'NotificationsDB',
      ).doc(notificationId).update({'isRead': true});
    } catch (_) {}
  }

  Future<void> markAllAsRead(String userId) async {
    try {
      final snapshot = await getCollection('NotificationsDB')
          .where('userId', isEqualTo: userId)
          .where('isRead', isEqualTo: false)
          .get();
      final batch = database.batch();
      for (final doc in snapshot.docs) {
        batch.update(doc.reference, {'isRead': true});
      }
      await batch.commit();
    } catch (_) {}
  }

  Future<void> clearAllNotifications(String userId) async {
    try {
      final snapshot = await getCollection(
        'NotificationsDB',
      ).where('userId', isEqualTo: userId).get();
      final batch = database.batch();
      for (final doc in snapshot.docs) {
        batch.delete(doc.reference);
      }
      await batch.commit();
    } catch (_) {}
  }

  Future<void> _addNotification(NotificationModel notification) async {
    try {
      await getCollection(
        'NotificationsDB',
      ).doc(notification.id).set(notification.toJson());
    } catch (_) {}
  }

  String _titleForStatus(OrderStatus status) {
    switch (status) {
      case OrderStatus.received:
        return 'Order Confirmed';
      case OrderStatus.preparing:
        return 'Order Update';
      case OrderStatus.dispatched:
        return 'Order Update';
      case OrderStatus.delivered:
        return 'Order Delivered';
      case OrderStatus.cancelled:
        return 'Order Cancelled';
    }
  }

  String _bodyForStatus(OrderModel order) {
    final id = order.orderId.substring(0, 8);
    switch (order.orderStatus) {
      case OrderStatus.received:
        return 'Your order #$id has been confirmed';
      case OrderStatus.preparing:
        return 'Your order #$id is being prepared';
      case OrderStatus.dispatched:
        return 'Your order #$id is out for delivery';
      case OrderStatus.delivered:
        return 'Your order #$id has been delivered';
      case OrderStatus.cancelled:
        return 'Your order #$id has been cancelled';
    }
  }

  @override
  Future<void> close() {
    _notificationsSubscription?.cancel();
    return super.close();
  }
}
