import 'dart:io';
import 'dart:ui' as ui;
import 'package:material_ui/material_ui.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bite_food_delivery/features/discovery/bloc/discovery_cubit.dart';
import 'package:bite_food_delivery/features/discovery/pages/discovery_screen.dart';
import 'package:bite_food_delivery/features/favourites/pages/favourites_screen.dart';
import 'package:bite_food_delivery/features/favourites/bloc/favourite_cubit.dart';
import 'package:bite_food_delivery/l10n/app_localizations.dart';
import 'package:bite_food_delivery/app/theme/app_theme.dart';
import 'package:bite_food_delivery/app/constants/app_localizations_delegates.dart';
import 'package:bite_food_delivery/widgets/app_food_card.dart';
import 'package:bite_food_delivery/widgets/app_restaurant_card.dart';
import 'package:bite_food_delivery/widgets/app_favorite_button.dart';
import 'catalog_state_test.dart' as fixtures;
import 'support/catalog_fixtures.dart';

Future<DiscoveryCubit> pumpDiscovery(
  WidgetTester tester, {
  String locale = 'en',
  double scale = 1,
  double width = 375,
  bool saved = false,
  bool guest = false,
  bool fails = false,
  Brightness brightness = Brightness.light,
}) async {
  tester.view.physicalSize = Size(width, 812);
  tester.view.devicePixelRatio = 1;
  addTearDown(tester.view.resetPhysicalSize);
  addTearDown(tester.view.resetDevicePixelRatio);
  final c = DiscoveryCubit(
    fixtures.FakeRestaurants()
      ..items = [fixtures.restaurant]
      ..fails = fails,
    MemoryFoodRepository(),
  );
  final repo = MemoryFavouritesRepository()
    ..users['test'] = {'foodItem:dish', 'restaurant:1'};
  final f = FavouriteCubit(repo);
  if (!guest) f.bindUser('test');
  addTearDown(c.close);
  addTearDown(f.close);
  await c.load();
  await tester.pumpWidget(
    MultiBlocProvider(
      providers: [
        BlocProvider.value(value: c),
        BlocProvider.value(value: f),
      ],
      child: ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        builder: (_, _) => MaterialApp(
          theme: AppTheme.build(brightness: brightness),
          locale: Locale(locale),
          localizationsDelegates: appLocalizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          builder: (context, child) => MediaQuery(
            data: MediaQuery.of(
              context,
            ).copyWith(textScaler: TextScaler.linear(scale)),
            child: child!,
          ),
          home: saved ? const FavouriteScreen() : const DiscoveryScreen(),
        ),
      ),
    ),
  );
  await tester.pumpAndSettle();
  return c;
}

Finder get scrollable => find
    .descendant(
      of: find.byType(CustomScrollView),
      matching: find.byType(Scrollable),
    )
    .first;

void main() {
  testWidgets(
    'typed query finds dishes and clear restores restaurant results',
    (tester) async {
      final c = await pumpDiscovery(tester);
      await tester.enterText(find.byType(TextField), 'smoky');
      await tester.pumpAndSettle();
      expect(c.state.query, 'smoky');
      await tester.scrollUntilVisible(
        find.byType(AppFoodCard),
        200,
        scrollable: scrollable,
      );
      expect(find.text('Smoky chicken burger'), findsOneWidget);
      tester.state<ScrollableState>(scrollable).position.jumpTo(0);
      await tester.pumpAndSettle();
      await tester.tap(find.byTooltip('Clear all'));
      await tester.pumpAndSettle();
      expect(c.state.query, '');
      expect(
        tester.widget<TextField>(find.byType(TextField)).controller!.text,
        '',
      );
      expect(c.state.restaurantResults(), hasLength(1));
      expect(tester.takeException(), isNull);
    },
  );
  testWidgets('filters reset the input and empty results are recoverable', (
    tester,
  ) async {
    final c = await pumpDiscovery(tester);
    await tester.enterText(find.byType(TextField), 'not found');
    await tester.pumpAndSettle();
    await tester.scrollUntilVisible(
      find.text('No matches yet. Try another search or reset your filters.'),
      150,
      scrollable: scrollable,
    );
    expect(
      find.text('No matches yet. Try another search or reset your filters.'),
      findsOneWidget,
    );
    c.reset();
    await tester.pumpAndSettle();
    tester.state<ScrollableState>(scrollable).position.jumpTo(0);
    await tester.pumpAndSettle();
    expect(
      tester.widget<TextField>(find.byType(TextField)).controller!.text,
      '',
    );
    expect(tester.takeException(), isNull);
  });
  testWidgets('saved items can be removed without catalog reload', (
    tester,
  ) async {
    final c = await pumpDiscovery(tester, saved: true);
    await tester.scrollUntilVisible(
      find.byType(AppFavoriteButton).first,
      200,
      scrollable: scrollable,
    );
    await tester.drag(find.byType(CustomScrollView), const Offset(0, -120));
    await tester.pumpAndSettle();
    await tester.tap(find.byType(AppFavoriteButton).first);
    await tester.pumpAndSettle();
    final context = tester.element(find.byType(FavouriteScreen));
    expect(
      context.read<FavouriteCubit>().state.keys.contains('restaurant:1'),
      false,
    );
    expect(c.state.restaurants, hasLength(1));
    expect(tester.takeException(), isNull);
  });
  testWidgets(
    'guest favourites show sign-in and no shared catalog favourites',
    (tester) async {
      await pumpDiscovery(tester, saved: true, guest: true);
      await tester.scrollUntilVisible(
        find.text('Please Sign In to Continue'),
        150,
        scrollable: scrollable,
      );
      expect(find.text('Please Sign In to Continue'), findsOneWidget);
      expect(find.byType(AppRestaurantCard), findsNothing);
      expect(find.byType(AppFoodCard), findsNothing);
    },
  );
  testWidgets('initial repository failure offers retry', (tester) async {
    final c = await pumpDiscovery(tester, fails: true);
    await tester.scrollUntilVisible(
      find.text('Try again'),
      150,
      scrollable: scrollable,
    );
    expect(find.text('Try again'), findsOneWidget);
    (c.restaurants as fixtures.FakeRestaurants).fails = false;
    await tester.tap(find.text('Try again'));
    await tester.pumpAndSettle();
    expect(c.state.failed, false);
    expect(c.state.loaded, true);
  });
  for (final saved in [false, true]) {
    for (final locale in ['en', 'ar', 'ur', 'de']) {
      testWidgets(
        '${saved ? 'Saved' : 'Discover'} fits narrow large text $locale',
        (tester) async {
          await pumpDiscovery(
            tester,
            saved: saved,
            locale: locale,
            width: 320,
            scale: 2,
          );
          await tester.tap(find.byType(ExpansionTile));
          await tester.pumpAndSettle();
          for (var i = 0; i < 6; i++) {
            await tester.drag(
              find.byType(CustomScrollView),
              const Offset(0, -550),
            );
            await tester.pumpAndSettle();
            expect(tester.takeException(), isNull);
          }
        },
      );
    }
    for (final brightness in Brightness.values) {
      testWidgets(
        'capture ${saved ? 'favourites' : 'discovery'} ${brightness.name}',
        (tester) async {
          await (FontLoader(
            'Sen',
          )..addFont(rootBundle.load('assets/fonts/Sen.ttf'))).load();
          await (FontLoader('MaterialIcons')
                ..addFont(rootBundle.load('fonts/MaterialIcons-Regular.otf')))
              .load();
          await pumpDiscovery(tester, saved: saved, brightness: brightness);
          final boundary = tester.renderObject<RenderRepaintBoundary>(
            find.byType(RepaintBoundary).first,
          );
          await tester.runAsync(() async {
            final image = await boundary.toImage(pixelRatio: 2);
            final bytes = await image.toByteData(
              format: ui.ImageByteFormat.png,
            );
            File(
              'docs/previews/${saved ? 'favourites' : 'discovery'}-${brightness.name}.png',
            ).writeAsBytesSync(bytes!.buffer.asUint8List());
            image.dispose();
          });
          expect(tester.takeException(), isNull);
        },
      );
    }
  }
}
