import 'dart:io';
import 'dart:ui' as ui;
import 'package:material_ui/material_ui.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bite_food_delivery/app/theme/app_theme.dart';
import 'package:bite_food_delivery/app/constants/app_localizations_delegates.dart';
import 'package:bite_food_delivery/app/routes/catalog_routes.dart';
import 'package:bite_food_delivery/core/di/di.dart';
import 'package:bite_food_delivery/l10n/app_localizations.dart';
import 'package:bite_food_delivery/features/restaurants/pages/restaurant_screen.dart';
import 'package:bite_food_delivery/features/restaurants/bloc/restaurant_menu_cubit.dart';
import 'package:bite_food_delivery/features/food_items/pages/food_item_screen.dart';
import 'package:bite_food_delivery/features/food_items/bloc/food_details_cubit.dart';
import 'package:bite_food_delivery/features/food_items/models/food_detail_arguments.dart';
import 'package:bite_food_delivery/features/favourites/bloc/favourite_cubit.dart';
import 'package:bite_food_delivery/widgets/app_primary_button.dart';
import 'package:bite_food_delivery/widgets/app_food_card.dart';
import 'support/catalog_fixtures.dart';
import 'catalog_state_test.dart' as fixtures;

Future<RecordingCartWriter> pumpCatalog(
  WidgetTester tester, {
  bool food = false,
  bool closed = false,
  String locale = 'en',
  double scale = 1,
  double width = 375,
  Brightness brightness = Brightness.light,
  MemoryFoodRepository? repository,
}) async {
  tester.view.physicalSize = Size(width, 812);
  tester.view.devicePixelRatio = 1;
  addTearDown(tester.view.resetPhysicalSize);
  addTearDown(tester.view.resetDevicePixelRatio);
  final writer = RecordingCartWriter();
  final menu = RestaurantMenuCubit(
    fixtures.restaurant.copyWith(isOpen: !closed),
    repository ?? MemoryFoodRepository(),
  );
  final detail = FoodDetailsCubit(
    FoodDetailArguments(
      item: dish,
      restaurantName: 'Bite Kitchen',
      restaurantOpen: !closed,
    ),
    writer,
    () => 'user',
  );
  final favourites = FavouriteCubit(MemoryFavouritesRepository());
  addTearDown(menu.close);
  addTearDown(detail.close);
  addTearDown(favourites.close);
  await menu.load();
  await tester.pumpWidget(
    MultiBlocProvider(
      providers: [
        BlocProvider.value(value: menu),
        BlocProvider.value(value: detail),
        BlocProvider.value(value: favourites),
      ],
      child: ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        builder: (_, _) => MaterialApp(
          theme: AppTheme.build(brightness: brightness),
          locale: Locale(locale),
          supportedLocales: AppLocalizations.supportedLocales,
          localizationsDelegates: appLocalizationsDelegates,
          builder: (context, child) => MediaQuery(
            data: MediaQuery.of(
              context,
            ).copyWith(textScaler: TextScaler.linear(scale)),
            child: child!,
          ),
          routes: const {'/food_item_screen': CatalogRoutes.food},
          home: food ? const FoodItemScreen() : const RestaurantScreen(),
        ),
      ),
    ),
  );
  await tester.pumpAndSettle();
  return writer;
}

void main() {
  testWidgets('restaurant to configured dish uses route-scoped state', (
    tester,
  ) async {
    await Di.sl.reset();
    final writer = RecordingCartWriter();
    Di.sl.registerFactoryParam<FoodDetailsCubit, FoodDetailArguments, void>(
      (args, _) => FoodDetailsCubit(args, writer, () => 'user'),
    );
    addTearDown(Di.sl.reset);
    await pumpCatalog(tester);
    await tester.scrollUntilVisible(
      find.byType(AppFoodCard),
      250,
      scrollable: find
          .descendant(
            of: find.byType(CustomScrollView),
            matching: find.byType(Scrollable),
          )
          .last,
    );
    await tester.tap(find.byType(AppFoodCard));
    await tester.pumpAndSettle();
    expect(find.byType(FoodItemScreen), findsOneWidget);
    await tester.scrollUntilVisible(
      find.text('Large'),
      200,
      scrollable: find
          .descendant(
            of: find.byType(CustomScrollView),
            matching: find.byType(Scrollable),
          )
          .last,
    );
    await tester.tap(find.text('Large'));
    await tester.pump();
    await tester.tap(find.byType(AppPrimaryButton).last);
    await tester.pumpAndSettle();
    expect(writer.items.single.selectedSize, 'Large');
    expect(find.text('Added to your cart'), findsOneWidget);
    expect(tester.takeException(), isNull);
  });
  testWidgets('unavailable dish cannot be added', (tester) async {
    final writer = await pumpCatalog(tester, food: true, closed: true);
    final button = tester.widget<FilledButton>(find.byType(FilledButton).last);
    expect(button.onPressed, isNull);
    expect(writer.items, isEmpty);
  });
  testWidgets('restaurant errors offer retry and recover', (tester) async {
    final repository = MemoryFoodRepository()..fails = true;
    await pumpCatalog(tester, repository: repository);
    await tester.scrollUntilVisible(
      find.text('Try again'),
      250,
      scrollable: find
          .descendant(
            of: find.byType(CustomScrollView),
            matching: find.byType(Scrollable),
          )
          .last,
    );
    await tester.drag(find.byType(CustomScrollView), const Offset(0, -200));
    await tester.pumpAndSettle();
    repository.fails = false;
    await tester.tap(find.text('Try again'));
    await tester.pumpAndSettle();
    expect(find.byType(AppFoodCard), findsOneWidget);
    expect(tester.takeException(), isNull);
  });
  testWidgets('missing food route arguments show recovery UI', (tester) async {
    await tester.pumpWidget(
      ScreenUtilInit(
        designSize: const Size(375, 812),
        builder: (_, _) => MaterialApp(
          localizationsDelegates: appLocalizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          routes: const {'/food': CatalogRoutes.food},
          home: Builder(
            builder: (context) => Scaffold(
              body: TextButton(
                onPressed: () => Navigator.pushNamed(
                  context,
                  '/food',
                  arguments: {'foodItem': 'invalid'},
                ),
                child: const Text('Open'),
              ),
            ),
          ),
        ),
      ),
    );
    await tester.tap(find.text('Open'));
    await tester.pumpAndSettle();
    expect(find.text('This item is no longer available.'), findsOneWidget);
    expect(tester.takeException(), isNull);
  });
  for (final food in [false, true]) {
    for (final locale in ['en', 'ar', 'ur', 'de']) {
      testWidgets(
        '${food ? 'food' : 'restaurant'} supports $locale large text',
        (tester) async {
          await pumpCatalog(
            tester,
            food: food,
            locale: locale,
            width: 320,
            scale: 2,
            brightness: Brightness.dark,
          );
          await tester.drag(
            find.byType(CustomScrollView),
            const Offset(0, -1000),
          );
          await tester.pumpAndSettle();
          expect(tester.takeException(), isNull);
        },
      );
    }
    for (final brightness in Brightness.values) {
      testWidgets('capture ${food ? 'food' : 'restaurant'} ${brightness.name}', (
        tester,
      ) async {
        await (FontLoader(
          'Sen',
        )..addFont(rootBundle.load('assets/fonts/Sen.ttf'))).load();
        await (FontLoader(
          'MaterialIcons',
        )..addFont(rootBundle.load('fonts/MaterialIcons-Regular.otf'))).load();
        await pumpCatalog(tester, food: food, brightness: brightness);
        final scroll = tester.state<ScrollableState>(
          find
              .descendant(
                of: find.byType(CustomScrollView),
                matching: find.byType(Scrollable),
              )
              .first,
        );
        scroll.position.jumpTo(0);
        await tester.pumpAndSettle();
        expect(scroll.position.pixels, 0);
        final boundary = tester.renderObject<RenderRepaintBoundary>(
          find.byType(RepaintBoundary).first,
        );
        await tester.runAsync(() async {
          final image = await boundary.toImage(pixelRatio: 2);
          final bytes = await image.toByteData(format: ui.ImageByteFormat.png);
          final file = File(
            'docs/previews/${food ? 'food' : 'restaurant'}-${brightness.name}.png',
          );
          file.parent.createSync(recursive: true);
          file.writeAsBytesSync(bytes!.buffer.asUint8List());
          image.dispose();
        });
        expect(tester.takeException(), isNull);
      });
    }
  }
}
