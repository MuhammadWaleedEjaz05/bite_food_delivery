import 'dart:io';
import 'dart:ui' as ui;
import 'package:bite_food_delivery/app/theme/app_theme.dart';
import 'package:bite_food_delivery/features/orders/bloc/order_cubit.dart';
import 'package:bite_food_delivery/features/orders/models/order_model.dart';
import 'package:bite_food_delivery/features/orders/pages/order_history_screen.dart';
import 'package:bite_food_delivery/features/orders/pages/track_order_screen.dart';
import 'package:bite_food_delivery/features/orders/widgets/courier_contact_card.dart';
import 'package:bite_food_delivery/features/orders/widgets/order_history_card.dart';
import 'package:bite_food_delivery/features/payments/models/credit_card_model.dart';
import 'package:bite_food_delivery/features/restaurants/bloc/restaurants_cubit.dart';
import 'package:bite_food_delivery/l10n/app_localizations.dart';
import 'package:bite_food_delivery/features/notifications/bloc/notifications_cubit.dart';
import 'package:bite_food_delivery/core/services/phone_call/phone_call_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';
import 'catalog_state_test.dart' as fixtures;

class FakeNotificationsCubit extends NotificationsCubit {
  final List<OrderModel> notifications = [];
  @override
  Future<void> notifyOrderStatusChanged(OrderModel order) async {
    notifications.add(order);
  }
}

class FakePhoneCallCubit extends PhoneCallCubit {
  String? calledNumber;
  @override
  Future<void> makePhoneCall(String phoneNumber) async {
    calledNumber = phoneNumber;
  }
}

final testOrder = OrderModel(
  orderId: 'order-12345678',
  userId: 'user-1',
  restaurantId: '1',
  cartID: 'cart-1',
  totalPrice: 1450.0,
  deliveryAddressId: 'addr-1',
  paymentMethod: CreditCardType.onCash,
  orderPlacedAt: DateTime(2026, 11, 12, 14, 30),
  orderStatus: OrderStatus.preparing,
  isPaid: false,
);

class TestOrderCubit extends OrderCubit {
  OrderModel? _testActive;

  TestOrderCubit({
    required super.notificationsCubit,
    OrderModel? active,
    List<OrderModel>? history,
  }) : _testActive = active {
    if (active != null) {
      emit(ActiveOrderUpdated(active));
    }
    if (history != null) {
      emit(OrderHistoryLoaded(history));
    }
  }

  @override
  OrderModel? get activeOrder => _testActive ?? super.activeOrder;

  @override
  bool get hasActiveOrder =>
      activeOrder != null &&
      activeOrder!.orderStatus != OrderStatus.delivered &&
      activeOrder!.orderStatus != OrderStatus.cancelled;

  void setActive(OrderModel? order) {
    _testActive = order;
    if (order != null) {
      emit(ActiveOrderUpdated(order));
    } else {
      emit(OrderInitial());
    }
  }
}

Future<void> pumpOrderHistory(
  WidgetTester tester, {
  List<OrderModel> orders = const [],
  String locale = 'en',
  double scale = 1,
  double width = 375,
  Brightness brightness = Brightness.light,
}) async {
  tester.view.physicalSize = Size(width, 812);
  tester.view.devicePixelRatio = 1;
  addTearDown(tester.view.resetPhysicalSize);
  addTearDown(tester.view.resetDevicePixelRatio);

  final notifications = FakeNotificationsCubit();
  final orderCubit = TestOrderCubit(
    notificationsCubit: notifications,
    history: orders,
  );
  final restaurants = RestaurantsCubit(
    fixtures.FakeRestaurants()..items = [fixtures.restaurant],
  );
  addTearDown(orderCubit.close);
  addTearDown(restaurants.close);
  addTearDown(notifications.close);

  await tester.pumpWidget(
    MultiBlocProvider(
      providers: [
        BlocProvider<OrderCubit>.value(value: orderCubit),
        BlocProvider<RestaurantsCubit>.value(value: restaurants),
      ],
      child: ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        builder: (_, _) => MaterialApp(
          theme: AppTheme.build(brightness: brightness),
          locale: Locale(locale),
          supportedLocales: AppLocalizations.supportedLocales,
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          builder: (context, child) => MediaQuery(
            data: MediaQuery.of(
              context,
            ).copyWith(textScaler: TextScaler.linear(scale)),
            child: child!,
          ),
          home: const OrderHistoryScreen(),
        ),
      ),
    ),
  );
  await tester.pumpAndSettle();
}

Future<FakePhoneCallCubit> pumpTrackOrder(
  WidgetTester tester, {
  OrderModel? activeOrder,
  String locale = 'en',
  double scale = 1,
  double width = 375,
  Brightness brightness = Brightness.light,
}) async {
  tester.view.physicalSize = Size(width, 812);
  tester.view.devicePixelRatio = 1;
  addTearDown(tester.view.resetPhysicalSize);
  addTearDown(tester.view.resetDevicePixelRatio);

  final notifications = FakeNotificationsCubit();
  final phoneCubit = FakePhoneCallCubit();
  final orderCubit = TestOrderCubit(
    notificationsCubit: notifications,
    active: activeOrder ?? testOrder,
  );
  final restaurants = RestaurantsCubit(
    fixtures.FakeRestaurants()..items = [fixtures.restaurant],
  );
  addTearDown(orderCubit.close);
  addTearDown(restaurants.close);
  addTearDown(notifications.close);
  addTearDown(phoneCubit.close);

  await tester.pumpWidget(
    MultiBlocProvider(
      providers: [
        BlocProvider<OrderCubit>.value(value: orderCubit),
        BlocProvider<RestaurantsCubit>.value(value: restaurants),
        BlocProvider<PhoneCallCubit>.value(value: phoneCubit),
      ],
      child: ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        builder: (_, _) => MaterialApp(
          theme: AppTheme.build(brightness: brightness),
          locale: Locale(locale),
          supportedLocales: AppLocalizations.supportedLocales,
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          builder: (context, child) => MediaQuery(
            data: MediaQuery.of(
              context,
            ).copyWith(textScaler: TextScaler.linear(scale)),
            child: child!,
          ),
          home: const TrackOrderScreen(),
        ),
      ),
    ),
  );
  await tester.pumpAndSettle();
  return phoneCubit;
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUpAll(() {
    final messenger =
        TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger;
    messenger.setMockMethodCallHandler(SystemChannels.platform_views, (
      MethodCall methodCall,
    ) async {
      switch (methodCall.method) {
        case 'create':
          return 0;
        case 'dispose':
          return null;
        case 'resize':
          return const <String, dynamic>{'width': 0.0, 'height': 0.0};
        case 'touch':
          return null;
        case 'setDirection':
          return null;
        case 'clearFocus':
          return null;
        default:
          return null;
      }
    });
    for (var i = 0; i < 50; i++) {
      messenger.setMockMethodCallHandler(
        MethodChannel('plugins.flutter.io/google_maps_$i'),
        (MethodCall methodCall) async {
          return null;
        },
      );
    }
  });

  test('OrderModel serialization, deserialization, copyWith', () {
    final json = testOrder.toJson();
    expect(json['orderId'], 'order-12345678');
    expect(json['totalPrice'], 1450.0);
    expect(json['orderStatus'], 'preparing');
    expect(json['paymentMethod'], 'onCash');

    final parsed = OrderModel.fromJson(json);
    expect(parsed.orderId, testOrder.orderId);
    expect(parsed.totalPrice, 1450.0);
    expect(parsed.orderStatus, OrderStatus.preparing);

    final updated = testOrder.copyWith(orderStatus: OrderStatus.cancelled);
    expect(updated.orderStatus, OrderStatus.cancelled);
    expect(updated.totalPrice, 1450.0);
  });

  testWidgets('OrderHistoryScreen renders tabs and cards', (tester) async {
    final completed = testOrder.copyWith(
      orderId: 'past-order-1',
      orderStatus: OrderStatus.delivered,
    );
    await pumpOrderHistory(tester, orders: [testOrder, completed]);

    expect(find.byType(OrderHistoryCard), findsOneWidget); // In Ongoing tab
    expect(find.text('Ongoing'), findsOneWidget);
    expect(find.text('History'), findsOneWidget);

    // Switch to History tab
    await tester.tap(find.text('History'));
    await tester.pumpAndSettle();

    expect(find.byType(OrderHistoryCard), findsOneWidget); // In History tab
    expect(find.text('Reorder'), findsOneWidget);
  });

  for (final locale in ['en', 'ar', 'ur', 'de']) {
    testWidgets('OrderHistoryScreen supports narrow 200% text in $locale', (
      tester,
    ) async {
      await pumpOrderHistory(
        tester,
        orders: [testOrder],
        locale: locale,
        width: 320,
        scale: 2,
        brightness: Brightness.dark,
      );
      await tester.drag(find.byType(CustomScrollView), const Offset(0, -300));
      await tester.pumpAndSettle();
      expect(tester.takeException(), isNull);
    });
  }

  for (final status in OrderStatus.values) {
    testWidgets(
      'TrackOrderScreen handles ${status.name} state without crashing',
      (tester) async {
        final o = testOrder.copyWith(orderStatus: status);
        await pumpTrackOrder(tester, activeOrder: o);
        expect(find.byType(TrackOrderScreen), findsOneWidget);
        expect(tester.takeException(), isNull);
      },
    );
  }

  testWidgets('TrackOrderScreen allows calling courier on ongoing orders', (
    tester,
  ) async {
    final phone = await pumpTrackOrder(tester, activeOrder: testOrder);
    await tester.drag(find.byType(CustomScrollView), const Offset(0, -350));
    await tester.pumpAndSettle();
    expect(find.byType(CourierContactCard), findsOneWidget);

    await tester.tap(find.byIcon(Icons.phone_rounded));
    await tester.pumpAndSettle();
    expect(phone.calledNumber, isNotNull);
  });

  for (final locale in ['en', 'ar', 'ur', 'de']) {
    testWidgets('TrackOrderScreen supports narrow 200% text in $locale', (
      tester,
    ) async {
      await pumpTrackOrder(
        tester,
        activeOrder: testOrder,
        locale: locale,
        width: 320,
        scale: 2,
        brightness: Brightness.dark,
      );
      await tester.drag(find.byType(CustomScrollView), const Offset(0, -300));
      await tester.pumpAndSettle();
      expect(tester.takeException(), isNull);
    });
  }

  for (final brightness in Brightness.values) {
    testWidgets('capture ${brightness.name} orders and tracking previews', (
      tester,
    ) async {
      final loader = FontLoader('Sen')
        ..addFont(rootBundle.load('assets/fonts/Sen.ttf'));
      await loader.load();
      final icons = FontLoader('MaterialIcons')
        ..addFont(rootBundle.load('fonts/MaterialIcons-Regular.otf'));
      await icons.load();

      await pumpOrderHistory(
        tester,
        orders: [testOrder],
        brightness: brightness,
      );
      final boundary1 = tester.renderObject<RenderRepaintBoundary>(
        find.byType(RepaintBoundary).first,
      );
      await tester.runAsync(() async {
        final image = await boundary1.toImage(pixelRatio: 2);
        final bytes = await image.toByteData(format: ui.ImageByteFormat.png);
        final file = File('docs/previews/order-history-${brightness.name}.png');
        file.parent.createSync(recursive: true);
        file.writeAsBytesSync(bytes!.buffer.asUint8List());
        image.dispose();
      });

      await pumpTrackOrder(
        tester,
        activeOrder: testOrder,
        brightness: brightness,
      );
      final boundary2 = tester.renderObject<RenderRepaintBoundary>(
        find.byType(RepaintBoundary).first,
      );
      await tester.runAsync(() async {
        final image = await boundary2.toImage(pixelRatio: 2);
        final bytes = await image.toByteData(format: ui.ImageByteFormat.png);
        final file = File('docs/previews/track-order-${brightness.name}.png');
        file.parent.createSync(recursive: true);
        file.writeAsBytesSync(bytes!.buffer.asUint8List());
        image.dispose();
      });

      expect(tester.takeException(), isNull);
    });
  }
}
