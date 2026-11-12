import 'dart:io';
import 'dart:ui' as ui;
import 'package:bite_food_delivery/app/theme/app_theme.dart';
import 'package:bite_food_delivery/features/orders/models/order_model.dart';
import 'package:bite_food_delivery/features/payments/models/credit_card_model.dart';
import 'package:bite_food_delivery/features/restaurants/bloc/restaurants_cubit.dart';
import 'package:bite_food_delivery/features/reviews/bloc/rating_and_review_cubit.dart';
import 'package:bite_food_delivery/features/reviews/bloc/rating_and_review_state.dart';
import 'package:bite_food_delivery/features/reviews/bloc/review_editor_cubit.dart';
import 'package:bite_food_delivery/features/reviews/models/rating_and_review_model.dart';
import 'package:bite_food_delivery/features/reviews/pages/my_reviews_screen.dart';
import 'package:bite_food_delivery/features/reviews/pages/review_screen.dart';
import 'package:bite_food_delivery/features/reviews/widgets/review_card.dart';
import 'package:bite_food_delivery/features/reviews/widgets/star_rating_bar.dart';
import 'package:bite_food_delivery/widgets/app_primary_button.dart';
import 'package:bite_food_delivery/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';
import 'catalog_state_test.dart' as fixtures;

class FakeReviewsCubit extends RatingAndReviewCubit {
  final List<RatingAndReviewModel> items;

  FakeReviewsCubit({List<RatingAndReviewModel>? items})
    : items = items != null ? List.of(items) : <RatingAndReviewModel>[] {
    emit(RatingAndReviewLoaded(this.items));
  }

  @override
  Future<void> submitReviews(
    RatingAndReviewModel review,
    RestaurantsCubit restaurantCubit,
  ) async {
    items.add(review);
    emit(RatingAndReviewAdded(review));
    emit(RatingAndReviewLoaded(List.unmodifiable(items)));
  }

  @override
  Future<void> fetchReviews(String userId) async {
    emit(RatingAndReviewLoaded(List.unmodifiable(items)));
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
  orderStatus: OrderStatus.delivered,
  isPaid: true,
);

final sampleReview = RatingAndReviewModel(
  userId: 'user-1',
  orderId: 'order-12345678',
  restaurantId: '1',
  orderRating: 4.5,
  restaurantRating: 5.0,
  reviewText: 'Food arrived piping hot and was delicious!',
  createdAt: DateTime(2026, 11, 12, 15, 0),
);

Future<void> pumpReviewScreen(
  WidgetTester tester, {
  OrderModel? order,
  String locale = 'en',
  double scale = 1,
  double width = 375,
  Brightness brightness = Brightness.light,
  FakeReviewsCubit? reviewsCubit,
}) async {
  tester.view.physicalSize = Size(width, 812);
  tester.view.devicePixelRatio = 1;
  addTearDown(tester.view.resetPhysicalSize);
  addTearDown(tester.view.resetDevicePixelRatio);

  final rCubit = reviewsCubit ?? FakeReviewsCubit();
  final restaurants = RestaurantsCubit(
    fixtures.FakeRestaurants()..items = [fixtures.restaurant],
  );
  addTearDown(rCubit.close);
  addTearDown(restaurants.close);

  await tester.pumpWidget(
    MultiBlocProvider(
      providers: [
        BlocProvider<RatingAndReviewCubit>.value(value: rCubit),
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
          home: ReviewScreen(order: order ?? testOrder, reviewsCubit: rCubit),
        ),
      ),
    ),
  );
  await tester.pumpAndSettle();
}

Future<void> pumpMyReviewsScreen(
  WidgetTester tester, {
  List<RatingAndReviewModel>? reviews,
  String locale = 'en',
  double scale = 1,
  double width = 375,
  Brightness brightness = Brightness.light,
}) async {
  tester.view.physicalSize = Size(width, 812);
  tester.view.devicePixelRatio = 1;
  addTearDown(tester.view.resetPhysicalSize);
  addTearDown(tester.view.resetDevicePixelRatio);

  final rCubit = FakeReviewsCubit(items: List.of(reviews ?? [sampleReview]));
  final restaurants = RestaurantsCubit(
    fixtures.FakeRestaurants()..items = [fixtures.restaurant],
  );
  addTearDown(rCubit.close);
  addTearDown(restaurants.close);

  await tester.pumpWidget(
    MultiBlocProvider(
      providers: [
        BlocProvider<RatingAndReviewCubit>.value(value: rCubit),
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
          home: MyReviewsScreen(reviewsCubit: rCubit),
        ),
      ),
    ),
  );
  await tester.pumpAndSettle();
}

void main() {
  test('RatingAndReviewModel serialization, deserialization, copyWith', () {
    final json = sampleReview.toJson();
    expect(json['userId'], 'user-1');
    expect(json['orderId'], 'order-12345678');
    expect(json['restaurantId'], '1');
    expect(json['orderRating'], 4.5);
    expect(json['restaurantRating'], 5.0);
    expect(json['reviewText'], 'Food arrived piping hot and was delicious!');

    final parsed = RatingAndReviewModel.fromJson(json);
    expect(parsed.orderId, sampleReview.orderId);
    expect(parsed.orderRating, 4.5);
    expect(parsed.restaurantRating, 5.0);

    final copy = sampleReview.copyWith(reviewText: 'Updated text');
    expect(copy.reviewText, 'Updated text');
    expect(copy.orderRating, 4.5);
  });

  test('ReviewEditorCubit state updates', () {
    final cubit = ReviewEditorCubit();
    expect(cubit.state.orderRating, 5.0);
    expect(cubit.state.restaurantRating, 5.0);
    expect(cubit.state.isValid, isTrue);

    cubit.setOrderRating(4.0);
    expect(cubit.state.orderRating, 4.0);

    cubit.setRestaurantRating(3.5);
    expect(cubit.state.restaurantRating, 3.5);

    cubit.setComment('Great burger');
    expect(cubit.state.comment, 'Great burger');
    cubit.close();
  });

  testWidgets('StarRatingBar taps update rating', (tester) async {
    double selected = 0;
    await tester.pumpWidget(
      ScreenUtilInit(
        designSize: const Size(375, 812),
        builder: (_, _) => MaterialApp(
          home: Scaffold(
            body: Center(
              child: StarRatingBar(
                rating: selected,
                onRatingChanged: (val) => selected = val,
              ),
            ),
          ),
        ),
      ),
    );

    expect(find.byType(StarRatingBar), findsOneWidget);
    final icons = find.byType(Icon);
    expect(icons, findsNWidgets(5));

    await tester.tap(icons.at(3));
    expect(selected, 4.0);
  });

  testWidgets('ReviewScreen renders target order and interactive ratings', (
    tester,
  ) async {
    final fakeCubit = FakeReviewsCubit();
    await pumpReviewScreen(tester, reviewsCubit: fakeCubit);

    expect(find.byType(ReviewScreen), findsOneWidget);
    expect(find.text('Write a Review'), findsOneWidget);
    expect(find.text('Rate Order'), findsOneWidget);
    expect(find.text('Rate Restaurant'), findsOneWidget);

    await tester.enterText(
      find.byType(TextFormField),
      'Super fresh and tasty meal!',
    );
    await tester.drag(find.byType(CustomScrollView), const Offset(0, -200));
    await tester.pumpAndSettle();

    expect(find.byType(AppPrimaryButton), findsOneWidget);
    await tester.tap(find.byType(AppPrimaryButton));
    await tester.pumpAndSettle();

    expect(fakeCubit.items.length, 1);
    expect(fakeCubit.items.first.reviewText, 'Super fresh and tasty meal!');
  });

  testWidgets('MyReviewsScreen displays reviews and handles empty state', (
    tester,
  ) async {
    await pumpMyReviewsScreen(tester, reviews: [sampleReview]);

    expect(find.byType(MyReviewsScreen), findsOneWidget);
    expect(find.byType(ReviewCard), findsOneWidget);
    expect(
      find.text('Food arrived piping hot and was delicious!'),
      findsOneWidget,
    );

    await pumpMyReviewsScreen(tester, reviews: []);
    expect(find.byType(ReviewCard), findsNothing);
    expect(find.text('No reviews written yet'), findsOneWidget);
  });

  for (final locale in ['en', 'ar', 'ur', 'de']) {
    testWidgets('ReviewScreen supports narrow 200% text in $locale', (
      tester,
    ) async {
      await pumpReviewScreen(
        tester,
        locale: locale,
        width: 320,
        scale: 2,
        brightness: Brightness.dark,
      );
      await tester.drag(find.byType(CustomScrollView), const Offset(0, -300));
      await tester.pumpAndSettle();
      expect(tester.takeException(), isNull);
    });

    testWidgets('MyReviewsScreen supports narrow 200% text in $locale', (
      tester,
    ) async {
      await pumpMyReviewsScreen(
        tester,
        reviews: [sampleReview],
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
    testWidgets('capture ${brightness.name} review preview', (tester) async {
      final loader = FontLoader('Sen')
        ..addFont(rootBundle.load('assets/fonts/Sen.ttf'));
      await loader.load();
      final icons = FontLoader('MaterialIcons')
        ..addFont(rootBundle.load('fonts/MaterialIcons-Regular.otf'));
      await icons.load();

      await pumpReviewScreen(tester, brightness: brightness);
      final boundary = tester.renderObject<RenderRepaintBoundary>(
        find.byType(RepaintBoundary).first,
      );
      await tester.runAsync(() async {
        final image = await boundary.toImage(pixelRatio: 2);
        final bytes = await image.toByteData(format: ui.ImageByteFormat.png);
        final file = File('docs/previews/reviews-${brightness.name}.png');
        file.parent.createSync(recursive: true);
        file.writeAsBytesSync(bytes!.buffer.asUint8List());
        image.dispose();
      });

      await pumpMyReviewsScreen(tester, brightness: brightness);
      final boundary2 = tester.renderObject<RenderRepaintBoundary>(
        find.byType(RepaintBoundary).first,
      );
      await tester.runAsync(() async {
        final image = await boundary2.toImage(pixelRatio: 2);
        final bytes = await image.toByteData(format: ui.ImageByteFormat.png);
        final file = File('docs/previews/my-reviews-${brightness.name}.png');
        file.parent.createSync(recursive: true);
        file.writeAsBytesSync(bytes!.buffer.asUint8List());
        image.dispose();
      });
    });
  }
}
