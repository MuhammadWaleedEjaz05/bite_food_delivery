import 'support/catalog_fixtures.dart';
import 'package:bite_food_delivery/features/dashboard/widgets/dashboard_navigation_bar.dart';
import 'package:material_ui/material_ui.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:bite_food_delivery/app/theme/app_theme.dart';
import 'package:bite_food_delivery/l10n/app_localizations.dart';
import 'package:bite_food_delivery/features/home/pages/home_screen.dart';
import 'package:bite_food_delivery/features/categories/bloc/categories_cubit.dart';
import 'package:bite_food_delivery/features/restaurants/bloc/restaurants_cubit.dart';
import 'package:bite_food_delivery/features/addresses/bloc/address_cubit.dart';
import 'package:bite_food_delivery/features/cart/bloc/cart_cubit.dart';
import 'package:bite_food_delivery/widgets/app_category_card.dart';
import 'package:bite_food_delivery/features/home/widgets/home_search_button.dart';
import 'catalog_state_test.dart' as fixtures;

Future<void> pumpHome(
  WidgetTester tester, {
  bool dashboard = false,
  int count = 3,
  bool fails = false,
  double width = 375,
  double height = 1000,
  double scale = 1,
  String locale = 'en',
  Brightness brightness = Brightness.light,
}) async {
  tester.view.physicalSize = Size(width, height);
  tester.view.devicePixelRatio = 1;
  addTearDown(tester.view.resetPhysicalSize);
  addTearDown(tester.view.resetDevicePixelRatio);
  final categories = CategoriesCubit(
    fixtures.FakeCategories()
      ..items = List.filled(count, fixtures.category)
      ..fails = fails,
  );
  final restaurants = RestaurantsCubit(
    fixtures.FakeRestaurants()
      ..items = [fixtures.restaurant]
      ..fails = fails,
  );
  final address = AddressCubit();
  final cart = CartCubit(MemoryCartRepository());
  addTearDown(categories.close);
  addTearDown(restaurants.close);
  addTearDown(address.close);
  addTearDown(cart.close);
  await categories.loadCategories();
  await restaurants.loadRestaurants();
  await tester.pumpWidget(
    MultiBlocProvider(
      providers: [
        BlocProvider.value(value: categories),
        BlocProvider.value(value: restaurants),
        BlocProvider.value(value: address),
        BlocProvider.value(value: cart),
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
          home: dashboard
              ? Scaffold(
                  body: const HomeScreen(),
                  bottomNavigationBar: Builder(
                    builder: (context) {
                      final l = AppLocalizations.of(context)!;
                      return DashboardNavigationBar(
                        index: 0,
                        labels: [
                          l.home,
                          l.discoverTab,
                          l.ordersTab,
                          l.accountTab,
                        ],
                        onSelected: (_) {},
                      );
                    },
                  ),
                )
              : const HomeScreen(),
        ),
      ),
    ),
  );
  await tester.pumpAndSettle();
}

void main() {
  for (final count in [0, 1, 2, 3]) {
    testWidgets('Home handles $count categories without range errors', (
      tester,
    ) async {
      await pumpHome(tester, count: count);
      expect(find.byType(AppCategoryCard), findsNWidgets(count));
      expect(tester.takeException(), isNull);
      if (count == 0) {
        expect(find.text('No categories available yet.'), findsOneWidget);
      }
    });
  }
  testWidgets('Home displays recoverable catalog errors', (tester) async {
    await pumpHome(tester, fails: true);
    expect(find.text('Try again'), findsWidgets);
    expect(tester.takeException(), isNull);
  });
  for (final locale in ['en', 'ar', 'ur', 'de']) {
    testWidgets('Home supports large text on narrow screens in $locale', (
      tester,
    ) async {
      await pumpHome(
        tester,
        width: 320,
        scale: 2,
        locale: locale,
        brightness: Brightness.dark,
      );
      await tester.drag(find.byType(CustomScrollView), const Offset(0, -700));
      await tester.pumpAndSettle();
      expect(tester.takeException(), isNull);
    });
  }
  testWidgets('Home adapts to tablet width', (tester) async {
    await pumpHome(tester, width: 900);
    expect(tester.takeException(), isNull);
  });
  testWidgets('Home exposes search as an interactive action', (tester) async {
    await pumpHome(tester);
    expect(find.byType(HomeSearchButton), findsOneWidget);
    expect(find.text('Search for restaurants or dishes'), findsOneWidget);
  });
}
