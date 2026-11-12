import 'dart:io';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bite_food_delivery/features/cart/bloc/cart_cubit.dart';
import 'package:bite_food_delivery/features/cart/pages/cart_screen.dart';
import 'package:bite_food_delivery/features/checkout/bloc/checkout_cubit.dart';
import 'package:bite_food_delivery/features/checkout/pages/checkout_screen.dart';
import 'package:bite_food_delivery/features/addresses/bloc/address_cubit.dart';
import 'package:bite_food_delivery/features/addresses/models/address_model.dart';
import 'package:bite_food_delivery/app/theme/app_theme.dart';
import 'package:bite_food_delivery/l10n/app_localizations.dart';
import 'commerce_state_test.dart';

class FixtureAddresses extends AddressCubit {
  void ready() => emit(
    AddressesLoaded(
      addresses: const [],
      selectedAddress: const AddressModel(
        addressID: 'home',
        userID: 'user',
        label: 'Home',
        street: '42 Garden Street',
        city: 'Lahore',
        zipCode: '54000',
        country: 'Pakistan',
      ),
    ),
  );
}

Future<void> pumpCommerce(
  WidgetTester tester, {
  bool checkout = false,
  String locale = 'en',
  double scale = 1,
  Brightness brightness = Brightness.light,
}) async {
  tester.view.physicalSize = Size(scale == 1 ? 375 : 320, 812);
  tester.view.devicePixelRatio = 1;
  addTearDown(tester.view.resetPhysicalSize);
  addTearDown(tester.view.resetDevicePixelRatio);
  final repo = ControlledCart();
  final cart = CartCubit(repo)..initialize('user');
  final review = CheckoutCubit(FakeCheckout());
  final address = FixtureAddresses()..ready();
  addTearDown(repo.close);
  addTearDown(cart.close);
  addTearDown(review.close);
  addTearDown(address.close);
  repo.streams['user']!.add(fixtureCart());
  await tester.pump();
  if (checkout) await review.review('cart', 'home');
  await tester.pumpWidget(
    MultiBlocProvider(
      providers: [
        BlocProvider.value(value: cart),
        BlocProvider.value(value: review),
        BlocProvider<AddressCubit>.value(value: address),
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
          home: checkout ? const CheckoutScreen() : const CartScreen(),
        ),
      ),
    ),
  );
  await tester.pumpAndSettle();
}

void main() {
  testWidgets('uncertain order can be retried after the cart becomes empty', (
    tester,
  ) async {
    await pumpCommerce(tester, checkout: true);
    final context = tester.element(find.byType(CheckoutScreen));
    final checkout = context.read<CheckoutCubit>();
    (checkout.repository as FakeCheckout).fails = true;
    await checkout.place();
    final cart = context.read<CartCubit>();
    (cart.repository as ControlledCart).streams['user']!.add(null);
    await tester.pumpAndSettle();
    checkout.invalidate();
    await tester.pumpAndSettle();
    expect(
      tester.widget<FilledButton>(find.byType(FilledButton)).onPressed,
      isNotNull,
    );
    expect(checkout.state.quote, isNotNull);
  });
  for (final checkout in [false, true]) {
    for (final locale in ['en', 'ar', 'ur', 'de']) {
      testWidgets(
        '${checkout ? 'checkout' : 'cart'} narrow large text $locale',
        (tester) async {
          await pumpCommerce(
            tester,
            checkout: checkout,
            locale: locale,
            scale: 2,
          );
          expect(tester.takeException(), isNull);
          await tester.drag(
            find.byType(CustomScrollView),
            const Offset(0, -600),
          );
          await tester.pumpAndSettle();
          expect(tester.takeException(), isNull);
        },
      );
    }
    for (final brightness in Brightness.values) {
      testWidgets(
        'capture ${checkout ? 'checkout' : 'cart'} ${brightness.name}',
        (tester) async {
          await (FontLoader(
            'Sen',
          )..addFont(rootBundle.load('assets/fonts/Sen.ttf'))).load();
          await (FontLoader('MaterialIcons')
                ..addFont(rootBundle.load('fonts/MaterialIcons-Regular.otf')))
              .load();
          await pumpCommerce(
            tester,
            checkout: checkout,
            brightness: brightness,
          );
          final boundary = tester.renderObject<RenderRepaintBoundary>(
            find.byType(RepaintBoundary).first,
          );
          await tester.runAsync(() async {
            final image = await boundary.toImage(pixelRatio: 2);
            final bytes = await image.toByteData(
              format: ui.ImageByteFormat.png,
            );
            File(
              'docs/previews/${checkout ? 'checkout' : 'cart'}-${brightness.name}.png',
            ).writeAsBytesSync(bytes!.buffer.asUint8List());
            image.dispose();
          });
          expect(tester.takeException(), isNull);
        },
      );
    }
  }
}
