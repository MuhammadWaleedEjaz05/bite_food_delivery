import 'package:bite_food_delivery/configs/firebase_auth_conn.dart';
import 'package:bite_food_delivery/configs/firebase_db_conn.dart';
import 'package:bite_food_delivery/configs/shared_preference_functions.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/data/latest_all.dart' as tz;

FirebaseMessaging messaging = FirebaseMessaging.instance;

Future<void> firebaseBackgroundMessageHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
}

Future<void> _saveTokenToFirestore(String? token) async {
  if (token == null) return;
  final user = getCurrentUser();
  if (user == null) return;
  await getCollection(
    'UsersDB',
  ).doc(user.uid).set({"token": token}, SetOptions(merge: true));
}

Future<void> initializeFCM() async {
  try {
    await messaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );
    final tokenFCM = await messaging.getToken();
    await _saveTokenToFirestore(tokenFCM);
    messaging.onTokenRefresh.listen((newToken) async {
      await _saveTokenToFirestore(newToken);
    });
  } catch (_) {}
}

class NotificationService {
  NotificationService._();
  static final NotificationService instance = NotificationService._();

  final FlutterLocalNotificationsPlugin _plugin =
      FlutterLocalNotificationsPlugin();

  Future<void> initialize() async {
    tz.initializeTimeZones();
    const darwin = DarwinInitializationSettings(
      requestAlertPermission: true,
      requestBadgePermission: true,
      requestSoundPermission: true,
    );
    await _plugin.initialize(
      settings: const InitializationSettings(
        android: AndroidInitializationSettings('@mipmap/ic_launcher'),
        iOS: darwin,
        macOS: darwin,
      ),
    );
    await FirebaseMessaging.instance.getInitialMessage();
    FirebaseMessaging.onMessage.listen(_handleForegroundMessage);
    FirebaseMessaging.onMessageOpenedApp.listen((_) {});
  }

  void _handleForegroundMessage(RemoteMessage message) async {
    final areNotificationsEnabled =
        getFromSharedPreferencebool('areNotificationsEnabled') ?? true;
    if (!areNotificationsEnabled) return;

    final notification = message.notification;
    if (notification != null && notification.android != null) {
      showNotification(
        title: notification.title ?? '',
        body: notification.body ?? '',
      );
    }
  }

  Future<void> showNotification({
    required String title,
    required String body,
  }) async {
    await _plugin.show(
      id: title.hashCode,
      title: title,
      body: body,
      notificationDetails: const NotificationDetails(
        android: AndroidNotificationDetails(
          'bite_food_delivery_channel',
          'Bite Food Delivery Notifications',
          channelDescription:
              'Channel for Bite Food Delivery app notifications',
          importance: Importance.max,
          priority: Priority.high,
        ),
      ),
    );
  }
}
