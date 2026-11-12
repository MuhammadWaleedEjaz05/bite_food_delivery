import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:bite_food_delivery/features/authentication/bloc/remember_me_cubit.dart';
import 'package:bite_food_delivery/features/authentication/bloc/user_auth_cubit.dart';
import 'package:bite_food_delivery/features/authentication/models/user_model.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:bite_food_delivery/app/routes/app_router.dart';
import 'package:bite_food_delivery/app/routes/app_navigation.dart';
import 'package:bite_food_delivery/app/theme/app_theme.dart';
import 'package:bite_food_delivery/core/di/di.dart';
import 'package:bite_food_delivery/features/catalog/bloc/catalog_route_cubit.dart';
import 'package:bite_food_delivery/features/catalog/domain/catalog_lookup.dart';
import 'package:bite_food_delivery/features/dashboard/sections/dashboard_navigation_section.dart';
import 'package:bite_food_delivery/features/dashboard/widgets/dashboard_navigation_bar.dart';
import 'package:bite_food_delivery/features/food_items/models/food_item_model.dart';
import 'package:bite_food_delivery/features/food_items/models/food_detail_arguments.dart';
import 'package:bite_food_delivery/features/restaurants/models/restaurants_model.dart';
import 'package:bite_food_delivery/l10n/app_localizations.dart';
import 'package:bite_food_delivery/widgets/custom_app_bar.dart';
import 'catalog_state_test.dart' as fixtures;
import 'support/catalog_fixtures.dart';

class Lookup implements CatalogLookup {
  bool fails = false;
  RestaurantModel? result = fixtures.restaurant;
  Completer<RestaurantModel?>? pending;
  int calls = 0;
  @override
  Future<RestaurantModel?> restaurant(String id) async {
    calls++;
    if (fails) throw StateError('offline');
    return pending == null ? result : pending!.future;
  }

  @override
  Future<FoodItemModel?> food(String id) async => id == dish.id ? dish : null;
}

class TestSession extends UserAuthCubit {
  @override
  Future<void> checkAuthStatus() async {}
  void signIn() => emit(
    const UserLoggedIn(
      UserModel(id: 'test', fullName: 'Test', email: 'test@example.com'),
    ),
  );
}

void main() {
  testWidgets('sign-in completes once and resumes its requested destination', (
    tester,
  ) async {
    SharedPreferences.setMockInitialValues({});
    final prefs = await SharedPreferences.getInstance();
    Di.sl.registerFactory(() => RememberMeCubit(prefs));
    addTearDown(Di.sl.reset);
    final session = TestSession();
    addTearDown(session.close);
    final router = AppRouter.create(
      signedIn: () => session.state is UserLoggedIn,
      initialLocation: '/login_screen?from=%2Forders',
      tabs: const [
        Text('Home fixture'),
        Text('Discover fixture'),
        Text('Orders fixture'),
        Text('Account fixture'),
      ],
      shellBuilder: (shell) => Scaffold(body: shell),
    );
    addTearDown(router.dispose);
    await tester.pumpWidget(
      BlocProvider<UserAuthCubit>.value(
        value: session,
        child: ScreenUtilInit(
          designSize: const Size(375, 812),
          builder: (_, _) => MaterialApp.router(
            routerConfig: router,
            theme: AppTheme.build(brightness: Brightness.light),
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
          ),
        ),
      ),
    );
    await tester.pumpAndSettle();
    session.signIn();
    await tester.pumpAndSettle();
    expect(find.text('Orders fixture'), findsOneWidget);
    expect(router.routeInformationProvider.value.uri.path, '/orders');
    expect(tester.takeException(), isNull);
  });

  test('catalog URLs encode IDs and discard model snapshots', () {
    expect(
      AppNavigation.location(
        '/restaurant_screen',
        fixtures.restaurant.copyWith(id: 'a b'),
      ),
      '/restaurants/a%20b',
    );
    expect(
      AppNavigation.location(
        '/food_item_screen',
        const FoodDetailArguments(item: dish, restaurantName: 'old'),
      ),
      '/foods/dish',
    );
    expect(
      AppNavigation.location('/food_item_screen', {'foodItem': dish}),
      '/foods/dish',
    );
  });
  test('guest guard preserves public browsing and safe return destination', () {
    for (final path in [
      '/home',
      '/discover',
      '/orders',
      '/account',
      '/restaurants/1',
      '/foods/dish',
    ]) {
      expect(AppRouter.guard(path, signedIn: false), isNull);
    }
    for (final path in AppRouter.protectedPaths) {
      expect(
        Uri.parse(AppRouter.guard(path, signedIn: false)!).path,
        '/login_screen',
      );
      expect(AppRouter.guard(path, signedIn: true), isNull);
    }
    expect(
      Uri.parse(
        AppRouter.guard('/checkout_screen', signedIn: false)!,
      ).queryParameters['from'],
      '/cart_screen',
    );
  });
  test('food deep links reload restaurant availability', () async {
    final lookup = Lookup()
      ..result = fixtures.restaurant.copyWith(isOpen: false);
    final cubit = CatalogRouteCubit(lookup);
    await cubit.load('dish', food: true);
    expect(cubit.state.status, CatalogRouteStatus.ready);
    expect(cubit.state.food!.restaurantOpen, false);
    expect(cubit.state.food!.restaurantName, fixtures.restaurant.name);
    await cubit.close();
  });
  test('missing records and network errors recover on retry', () async {
    final lookup = Lookup()..fails = true;
    final cubit = CatalogRouteCubit(lookup);
    await cubit.load('1', food: false);
    expect(cubit.state.status, CatalogRouteStatus.failed);
    lookup.fails = false;
    lookup.result = null;
    await cubit.load('1', food: false);
    expect(cubit.state.status, CatalogRouteStatus.missing);
    lookup.result = fixtures.restaurant;
    await cubit.load('1', food: false);
    expect(cubit.state.status, CatalogRouteStatus.ready);
    await cubit.load('unknown', food: true);
    expect(cubit.state.status, CatalogRouteStatus.missing);
    await cubit.close();
  });
  test(
    'invalid IDs avoid IO and pending loads are single flight and close safe',
    () async {
      final lookup = Lookup();
      final cubit = CatalogRouteCubit(lookup);
      await cubit.load('a/b', food: false);
      expect(lookup.calls, 0);
      lookup.pending = Completer<RestaurantModel?>();
      final pending = cubit.load('1', food: false);
      await cubit.load('1', food: false);
      expect(lookup.calls, 1);
      await cubit.close();
      lookup.pending!.complete(fixtures.restaurant);
      await pending;
    },
  );

  testWidgets('router retains scroll state across all four tabs', (
    tester,
  ) async {
    final router = AppRouter.create(
      signedIn: () => false,
      initialLocation: '/home',
      tabs: [
        for (var i = 0; i < 4; i++)
          ListView(
            key: ValueKey('tab-$i'),
            children: [
              for (var n = 0; n < 60; n++)
                SizedBox(height: 60, child: Text('Tab $i row $n')),
            ],
          ),
      ],
      shellBuilder: (shell) => Scaffold(
        body: shell,
        bottomNavigationBar: DashboardNavigationSection(shell: shell),
      ),
    );
    addTearDown(router.dispose);
    await tester.pumpWidget(
      ScreenUtilInit(
        designSize: const Size(375, 812),
        builder: (_, _) => MaterialApp.router(
          routerConfig: router,
          theme: AppTheme.build(brightness: Brightness.light),
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
        ),
      ),
    );
    await tester.pumpAndSettle();
    await tester.drag(
      find.byKey(const ValueKey('tab-0')),
      const Offset(0, -500),
    );
    await tester.pumpAndSettle();
    final position = tester
        .state<ScrollableState>(find.byType(Scrollable).first)
        .position
        .pixels;
    expect(position, greaterThan(0));
    for (final label in ['Discover', 'Orders', 'Account', 'Home']) {
      await tester.tap(find.text(label));
      await tester.pumpAndSettle();
    }
    expect(router.routeInformationProvider.value.uri.path, '/home');
    expect(
      tester
          .state<ScrollableState>(find.byType(Scrollable).first)
          .position
          .pixels,
      position,
    );
    expect(tester.takeException(), isNull);
  });

  testWidgets('missing direct link has a working Home back fallback', (
    tester,
  ) async {
    final lookup = Lookup()..result = null;
    Di.sl.registerFactory(() => CatalogRouteCubit(lookup));
    addTearDown(Di.sl.reset);
    final router = AppRouter.create(
      signedIn: () => false,
      initialLocation: '/restaurants/missing',
      tabs: const [
        Text('Home fixture'),
        Text('Discover fixture'),
        Text('Orders fixture'),
        Text('Account fixture'),
      ],
      shellBuilder: (shell) => Scaffold(body: shell),
    );
    addTearDown(router.dispose);
    await tester.pumpWidget(
      ScreenUtilInit(
        designSize: const Size(375, 812),
        builder: (_, _) => MaterialApp.router(
          routerConfig: router,
          theme: AppTheme.build(brightness: Brightness.light),
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
        ),
      ),
    );
    await tester.pumpAndSettle();
    expect(find.text('Try again'), findsOneWidget);
    await tester.tap(find.byType(CustomBackButton));
    await tester.pumpAndSettle();
    expect(find.text('Home fixture'), findsOneWidget);
    expect(tester.takeException(), isNull);
  });
  for (final locale in ['en', 'ar', 'ur', 'de']) {
    testWidgets('navigation fits narrow 200% text in $locale', (tester) async {
      tester.view.physicalSize = const Size(320, 812);
      tester.view.devicePixelRatio = 1;
      addTearDown(tester.view.resetPhysicalSize);
      addTearDown(tester.view.resetDevicePixelRatio);
      await tester.pumpWidget(
        ScreenUtilInit(
          designSize: const Size(375, 812),
          builder: (_, _) => MaterialApp(
            theme: AppTheme.build(brightness: Brightness.dark),
            locale: Locale(locale),
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
            builder: (context, child) => MediaQuery(
              data: MediaQuery.of(
                context,
              ).copyWith(textScaler: const TextScaler.linear(2)),
              child: child!,
            ),
            home: Scaffold(
              bottomNavigationBar: Builder(
                builder: (context) {
                  final l = AppLocalizations.of(context)!;
                  return DashboardNavigationBar(
                    index: 2,
                    labels: [l.home, l.discoverTab, l.ordersTab, l.accountTab],
                    onSelected: (_) {},
                  );
                },
              ),
            ),
          ),
        ),
      );
      await tester.pumpAndSettle();
      expect(tester.takeException(), isNull);
    });
  }
}
