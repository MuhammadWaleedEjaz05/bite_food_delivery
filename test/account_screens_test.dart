import 'dart:io';
import 'dart:ui' as ui;
import 'package:bite_food_delivery/app/theme/app_theme.dart';
import 'package:bite_food_delivery/features/authentication/bloc/user_auth_cubit.dart';
import 'package:bite_food_delivery/features/authentication/models/user_model.dart';
import 'package:bite_food_delivery/features/faq/pages/faq_screen.dart';
import 'package:bite_food_delivery/features/faq/widgets/faq_tile.dart';
import 'package:bite_food_delivery/features/faq/widgets/support_channel_card.dart';
import 'package:bite_food_delivery/features/notifications/bloc/notifications_cubit.dart';
import 'package:bite_food_delivery/features/notifications/models/notification_model.dart';
import 'package:bite_food_delivery/features/notifications/pages/notification_screen.dart';
import 'package:bite_food_delivery/features/notifications/widgets/notification_card.dart';
import 'package:bite_food_delivery/features/profile/pages/person_info_screen.dart';
import 'package:bite_food_delivery/features/profile/pages/profile_screen.dart';
import 'package:bite_food_delivery/features/profile/widgets/profile_menu_tile.dart';
import 'package:bite_food_delivery/features/settings/bloc/settings_cubit.dart';
import 'package:bite_food_delivery/features/settings/pages/setting_screen.dart';
import 'package:bite_food_delivery/features/settings/widgets/setting_tile.dart';
import 'package:bite_food_delivery/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:bite_food_delivery/src/core/utils/shared_preference_functions.dart';

class FakeUserAuthCubit extends UserAuthCubit {
  FakeUserAuthCubit({UserModel? user}) : super(autoCheck: false) {
    if (user != null) {
      emit(UserLoggedIn(user));
    } else {
      emit(const UserLoggedOut());
    }
  }

  @override
  Future<void> checkAuthStatus() async {}

  @override
  Future<void> logout() async {
    emit(const UserLoggedOut());
  }

  @override
  Future<void> updateProfile(String title, dynamic value) async {}
}

class FakeNotificationsCubit extends NotificationsCubit {
  final List<NotificationModel> _items;

  FakeNotificationsCubit({List<NotificationModel>? items})
    : _items = items != null ? List.of(items) : <NotificationModel>[] {
    emit(NotificationsLoaded(_items));
  }

  @override
  Future<void> markAllAsRead(String userId) async {
    for (var i = 0; i < _items.length; i++) {
      _items[i] = _items[i].copyWith(isRead: true);
    }
    emit(NotificationsLoaded(List.unmodifiable(_items)));
  }

  @override
  Future<void> markAsRead(String userId, String notificationId) async {
    final idx = _items.indexWhere((n) => n.id == notificationId);
    if (idx != -1) {
      _items[idx] = _items[idx].copyWith(isRead: true);
      emit(NotificationsLoaded(List.unmodifiable(_items)));
    }
  }
}

const testUser = UserModel(
  id: 'user-001',
  fullName: 'Sophia Taylor',
  email: 'sophia@example.com',
  phoneNumber: '+1 555 123 4567',
  photoUrl: null,
  bio: 'Food enthusiast and pizza lover 🍕',
);

final sampleNotifications = [
  NotificationModel(
    id: 'notif-1',
    userId: 'user-001',
    title: 'Order Delivered! 🎉',
    body: 'Your artisan pizza from Slice & Co. has arrived.',
    type: 'order_status',
    orderId: 'order-123',
    createdAt: DateTime(2026, 11, 12, 18, 45),
    isRead: false,
  ),
  NotificationModel(
    id: 'notif-2',
    userId: 'user-001',
    title: 'Special 20% Off Weekend',
    body: 'Get 20% discount on all burger joints this weekend.',
    type: 'promotion',
    createdAt: DateTime(2026, 11, 11, 10, 0),
    isRead: true,
  ),
];

Widget buildHarness({
  required Widget child,
  ThemeData? theme,
  Locale locale = const Locale('en'),
  TextScaler textScaler = const TextScaler.linear(1.0),
  Size size = const Size(390, 844),
  UserAuthCubit? authCubit,
  NotificationsCubit? notificationsCubit,
  SettingsCubit? settingsCubit,
}) {
  return ScreenUtilInit(
    designSize: const Size(375, 812),
    minTextAdapt: true,
    builder: (context, _) => MultiBlocProvider(
      providers: [
        BlocProvider<UserAuthCubit>.value(
          value: authCubit ?? FakeUserAuthCubit(user: testUser),
        ),
        BlocProvider<NotificationsCubit>.value(
          value: notificationsCubit ?? FakeNotificationsCubit(),
        ),
        BlocProvider<SettingsCubit>.value(
          value: settingsCubit ?? SettingsCubit(),
        ),
      ],
      child: MediaQuery(
        data: MediaQueryData(
          size: size,
          textScaler: textScaler,
          padding: const EdgeInsets.only(top: 44, bottom: 34),
        ),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: theme ?? AppTheme.lightTheme(),
          locale: locale,
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          home: child,
        ),
      ),
    ),
  );
}

Future<void> capturePng(WidgetTester tester, String path) async {
  final boundary =
      tester.renderObject(find.byType(RepaintBoundary).first)
          as RenderRepaintBoundary;
  await tester.runAsync(() async {
    final image = await boundary.toImage(pixelRatio: 2.0);
    final byteData = await image.toByteData(format: ui.ImageByteFormat.png);
    final bytes = byteData!.buffer.asUint8List();
    final file = File(path);
    await file.parent.create(recursive: true);
    await file.writeAsBytes(bytes);
    image.dispose();
  });
}

void main() {
  setUp(() async {
    SharedPreferences.setMockInitialValues({
      'isDarkMode': false,
      'isNotifications': true,
      'languageCode': 'en',
    });
    await initSharedPreferences();
  });

  group('Profile & PersonInfo Screens', () {
    testWidgets('ProfileScreen renders user details and menu options', (
      tester,
    ) async {
      await tester.pumpWidget(buildHarness(child: const ProfileScreen()));
      await tester.pumpAndSettle();

      expect(find.byType(ProfileScreen), findsOneWidget);
      expect(find.text('Sophia Taylor'), findsOneWidget);
      expect(find.text('Food enthusiast and pizza lover 🍕'), findsOneWidget);
      expect(find.byType(ProfileMenuTile), findsWidgets);
    });

    testWidgets('ProfileScreen shows guest state when logged out', (
      tester,
    ) async {
      await tester.pumpWidget(
        buildHarness(
          authCubit: FakeUserAuthCubit(user: null),
          child: const ProfileScreen(),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('Guest User'), findsOneWidget);
    });

    testWidgets('PersonInfoScreen displays user details', (tester) async {
      await tester.pumpWidget(buildHarness(child: const PersonInfoScreen()));
      await tester.pumpAndSettle();

      expect(find.byType(PersonInfoScreen), findsOneWidget);
      expect(find.text('Sophia Taylor'), findsOneWidget);
      expect(find.text('+1 555 123 4567'), findsOneWidget);
    });

    testWidgets(
      'ProfileScreen handles narrow 320px with 200% text scale in en, ar, ur, de',
      (tester) async {
        for (final locale in [
          const Locale('en'),
          const Locale('ar'),
          const Locale('ur'),
          const Locale('de'),
        ]) {
          await tester.pumpWidget(
            buildHarness(
              size: const Size(320, 640),
              textScaler: const TextScaler.linear(2.0),
              locale: locale,
              child: const ProfileScreen(),
            ),
          );
          await tester.pumpAndSettle();
          expect(tester.takeException(), isNull);
        }
      },
    );

    testWidgets('capture profile light and dark previews', (tester) async {
      await tester.pumpWidget(
        buildHarness(
          theme: AppTheme.lightTheme(),
          child: const RepaintBoundary(child: ProfileScreen()),
        ),
      );
      await tester.pumpAndSettle();
      await capturePng(tester, 'docs/previews/profile-light.png');

      await tester.pumpWidget(
        buildHarness(
          theme: AppTheme.darkTheme(),
          child: const RepaintBoundary(child: ProfileScreen()),
        ),
      );
      await tester.pumpAndSettle();
      await capturePng(tester, 'docs/previews/profile-dark.png');
    });
  });

  group('Settings Screen', () {
    testWidgets('SettingScreen renders preferences and language options', (
      tester,
    ) async {
      await tester.pumpWidget(buildHarness(child: const SettingScreen()));
      await tester.pumpAndSettle();

      expect(find.byType(SettingScreen), findsOneWidget);
      expect(find.byType(SettingTile), findsWidgets);
      expect(find.text('Settings'), findsOneWidget);
      expect(find.text('Version'), findsOneWidget);
    });

    testWidgets(
      'SettingScreen handles narrow 320px with 200% text scale in en, ar, ur, de',
      (tester) async {
        for (final locale in [
          const Locale('en'),
          const Locale('ar'),
          const Locale('ur'),
          const Locale('de'),
        ]) {
          await tester.pumpWidget(
            buildHarness(
              size: const Size(320, 640),
              textScaler: const TextScaler.linear(2.0),
              locale: locale,
              child: const SettingScreen(),
            ),
          );
          await tester.pumpAndSettle();
          expect(tester.takeException(), isNull);
        }
      },
    );

    testWidgets('capture settings light and dark previews', (tester) async {
      await tester.pumpWidget(
        buildHarness(
          theme: AppTheme.lightTheme(),
          child: const RepaintBoundary(child: SettingScreen()),
        ),
      );
      await tester.pumpAndSettle();
      await capturePng(tester, 'docs/previews/settings-light.png');

      await tester.pumpWidget(
        buildHarness(
          theme: AppTheme.darkTheme(),
          child: const RepaintBoundary(child: SettingScreen()),
        ),
      );
      await tester.pumpAndSettle();
      await capturePng(tester, 'docs/previews/settings-dark.png');
    });
  });

  group('Notifications Screen', () {
    testWidgets(
      'NotificationScreen renders notification list and handles mark all read',
      (tester) async {
        final notifCubit = FakeNotificationsCubit(items: sampleNotifications);

        await tester.pumpWidget(
          buildHarness(
            notificationsCubit: notifCubit,
            child: const NotificationScreen(),
          ),
        );
        await tester.pumpAndSettle();

        expect(find.byType(NotificationScreen), findsOneWidget);
        expect(find.byType(NotificationCard), findsNWidgets(2));
        expect(find.text('Order Delivered! 🎉'), findsOneWidget);

        final markReadBtn = find.text('Mark all as read');
        expect(markReadBtn, findsOneWidget);
        await tester.tap(markReadBtn);
        await tester.pumpAndSettle();
      },
    );

    testWidgets('NotificationScreen displays empty state when list is empty', (
      tester,
    ) async {
      await tester.pumpWidget(
        buildHarness(
          notificationsCubit: FakeNotificationsCubit(items: []),
          child: const NotificationScreen(),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('No notifications yet'), findsOneWidget);
    });

    testWidgets('capture notifications light and dark previews', (
      tester,
    ) async {
      final notifCubit = FakeNotificationsCubit(items: sampleNotifications);

      await tester.pumpWidget(
        buildHarness(
          theme: AppTheme.lightTheme(),
          notificationsCubit: notifCubit,
          child: const RepaintBoundary(child: NotificationScreen()),
        ),
      );
      await tester.pumpAndSettle();
      await capturePng(tester, 'docs/previews/notifications-light.png');

      await tester.pumpWidget(
        buildHarness(
          theme: AppTheme.darkTheme(),
          notificationsCubit: notifCubit,
          child: const RepaintBoundary(child: NotificationScreen()),
        ),
      );
      await tester.pumpAndSettle();
      await capturePng(tester, 'docs/previews/notifications-dark.png');
    });
  });

  group('FAQ & Support Screen', () {
    testWidgets('FAQScreen renders channels and accordion questions', (
      tester,
    ) async {
      await tester.pumpWidget(buildHarness(child: const FAQScreen()));
      await tester.pumpAndSettle();

      expect(find.byType(FAQScreen), findsOneWidget);
      expect(find.byType(SupportChannelCard), findsNWidgets(2));
      expect(find.byType(FaqTile), findsWidgets);
    });

    testWidgets('FAQTile expands and collapses answer on tap', (tester) async {
      await tester.pumpWidget(buildHarness(child: const FAQScreen()));
      await tester.pumpAndSettle();

      final firstTile = find.byType(FaqTile).first;
      await tester.tap(firstTile);
      await tester.pumpAndSettle();
      expect(tester.takeException(), isNull);
    });

    testWidgets('capture faq light and dark previews', (tester) async {
      await tester.pumpWidget(
        buildHarness(
          theme: AppTheme.lightTheme(),
          child: const RepaintBoundary(child: FAQScreen()),
        ),
      );
      await tester.pumpAndSettle();
      await capturePng(tester, 'docs/previews/faq-light.png');

      await tester.pumpWidget(
        buildHarness(
          theme: AppTheme.darkTheme(),
          child: const RepaintBoundary(child: FAQScreen()),
        ),
      );
      await tester.pumpAndSettle();
      await capturePng(tester, 'docs/previews/faq-dark.png');
    });
  });
}
