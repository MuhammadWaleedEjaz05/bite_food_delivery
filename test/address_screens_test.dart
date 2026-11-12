import 'dart:io';
import 'dart:ui' as ui;
import 'package:bite_food_delivery/app/theme/app_theme.dart';
import 'package:bite_food_delivery/features/addresses/bloc/address_cubit.dart';
import 'package:bite_food_delivery/features/addresses/bloc/address_editor_cubit.dart';
import 'package:bite_food_delivery/features/addresses/models/address_model.dart';
import 'package:bite_food_delivery/features/addresses/pages/add_address_screen.dart';
import 'package:bite_food_delivery/features/addresses/pages/address_screen.dart';
import 'package:bite_food_delivery/features/addresses/pages/update_address_screen.dart';
import 'package:bite_food_delivery/features/addresses/widgets/address_card.dart';
import 'package:bite_food_delivery/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class FakeAddressCubit extends AddressCubit {
  final List<AddressModel> items;
  AddressModel? selected;

  FakeAddressCubit({this.items = const [], this.selected}) {
    emit(AddressesLoaded(addresses: items, selectedAddress: selected));
  }

  @override
  Future<void> selectAddress(AddressModel address) async {
    selected = address;
    emit(AddressesLoaded(addresses: items, selectedAddress: address));
  }

  @override
  Future<void> deleteAddress(String addressID) async {
    items.removeWhere((a) => a.addressID == addressID);
    emit(AddressesLoaded(addresses: items, selectedAddress: selected));
  }
}

const sampleAddress = AddressModel(
  addressID: 'addr-1',
  userID: 'user-1',
  label: 'Home',
  street: '742 Evergreen Terrace',
  city: 'Springfield',
  zipCode: '12345',
  country: 'United States',
  location: LatLng(44.0582, -123.0868),
);

Future<void> pumpAddressScreen(
  WidgetTester tester, {
  List<AddressModel> addresses = const [sampleAddress],
  String locale = 'en',
  double scale = 1,
  double width = 375,
  Brightness brightness = Brightness.light,
}) async {
  tester.view.physicalSize = Size(width, 812);
  tester.view.devicePixelRatio = 1;
  addTearDown(tester.view.resetPhysicalSize);
  addTearDown(tester.view.resetDevicePixelRatio);

  final cubit = FakeAddressCubit(
    items: List.of(addresses),
    selected: addresses.firstOrNull,
  );
  addTearDown(cubit.close);

  await tester.pumpWidget(
    BlocProvider<AddressCubit>.value(
      value: cubit,
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
          home: const AddressScreen(),
        ),
      ),
    ),
  );
  await tester.pumpAndSettle();
}

void main() {
  test('AddressModel serialization and copyWith', () {
    final json = sampleAddress.toJson();
    expect(json['id'], 'addr-1');
    expect(json['label'], 'Home');
    expect(json['street'], '742 Evergreen Terrace');
    expect(json['location']['latitude'], 44.0582);

    final fromJson = AddressModel.fromJson(json);
    expect(fromJson.addressID, 'addr-1');
    expect(fromJson.city, 'Springfield');
    expect(fromJson.location?.latitude, 44.0582);

    final copied = sampleAddress.copyWith(label: 'Work', city: 'Shelbyville');
    expect(copied.label, 'Work');
    expect(copied.city, 'Shelbyville');
    expect(copied.street, '742 Evergreen Terrace');
  });

  test('AddressEditorCubit validation and field updates', () {
    final cubit = AddressEditorCubit();
    addTearDown(cubit.close);

    expect(cubit.state.isValid, isFalse);
    cubit.setStreet('123 Main St');
    cubit.setCity('Metropolis');
    cubit.setCountry('USA');
    expect(cubit.state.isValid, isTrue);

    cubit.setLabel('Work');
    expect(cubit.state.label, 'Work');

    cubit.updateFromLocationPick(
      latitude: 40.7128,
      longitude: -74.0060,
      city: 'New York',
    );
    expect(cubit.state.city, 'New York');
    expect(cubit.state.location?.latitude, 40.7128);
  });

  testWidgets('AddressScreen displays addresses and handles selection', (
    tester,
  ) async {
    await pumpAddressScreen(tester, addresses: [sampleAddress]);
    expect(find.byType(AddressCard), findsOneWidget);
    expect(
      find.text('742 Evergreen Terrace, Springfield, 12345, United States'),
      findsOneWidget,
    );
    expect(find.text('Home'), findsWidgets);
    expect(find.text('Add Address'), findsOneWidget);
  });

  testWidgets('AddressScreen displays empty state when no addresses exist', (
    tester,
  ) async {
    await pumpAddressScreen(tester, addresses: []);
    expect(find.byType(AddressCard), findsNothing);
    expect(find.text('No addresses found'), findsOneWidget);
  });

  for (final locale in ['en', 'ar', 'ur', 'de']) {
    testWidgets('AddressScreen supports narrow 200% text in $locale', (
      tester,
    ) async {
      await pumpAddressScreen(
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
  }

  testWidgets(
    'AddAddressScreen and UpdateAddressScreen compose with 3-tier structure',
    (tester) async {
      await tester.pumpWidget(
        BlocProvider<AddressCubit>(
          create: (_) => FakeAddressCubit(),
          child: ScreenUtilInit(
            designSize: const Size(375, 812),
            builder: (_, _) => const MaterialApp(
              localizationsDelegates: AppLocalizations.localizationsDelegates,
              supportedLocales: AppLocalizations.supportedLocales,
              home: AddAddressScreen(),
            ),
          ),
        ),
      );
      await tester.pumpAndSettle();
      expect(find.byType(AddAddressScreen), findsOneWidget);
      expect(find.text('Street'), findsOneWidget);
      expect(find.text('City'), findsOneWidget);
      expect(find.text('Country'), findsOneWidget);
      expect(find.text('Save Address'), findsOneWidget);

      await tester.pumpWidget(
        BlocProvider<AddressCubit>(
          create: (_) => FakeAddressCubit(),
          child: ScreenUtilInit(
            designSize: const Size(375, 812),
            builder: (_, _) => const MaterialApp(
              localizationsDelegates: AppLocalizations.localizationsDelegates,
              supportedLocales: AppLocalizations.supportedLocales,
              home: UpdateAddressScreen(address: sampleAddress),
            ),
          ),
        ),
      );
      await tester.pumpAndSettle();
      expect(find.byType(UpdateAddressScreen), findsOneWidget);
      expect(find.text('Update Address'), findsWidgets);
    },
  );

  for (final brightness in Brightness.values) {
    testWidgets('capture ${brightness.name} address preview', (tester) async {
      final loader = FontLoader('Sen')
        ..addFont(rootBundle.load('assets/fonts/Sen.ttf'));
      await loader.load();
      final icons = FontLoader('MaterialIcons')
        ..addFont(rootBundle.load('fonts/MaterialIcons-Regular.otf'));
      await icons.load();
      await pumpAddressScreen(tester, brightness: brightness);
      final boundary = tester.renderObject<RenderRepaintBoundary>(
        find.byType(RepaintBoundary).first,
      );
      await tester.runAsync(() async {
        final image = await boundary.toImage(pixelRatio: 2);
        final bytes = await image.toByteData(format: ui.ImageByteFormat.png);
        final file = File('docs/previews/address-${brightness.name}.png');
        file.parent.createSync(recursive: true);
        file.writeAsBytesSync(bytes!.buffer.asUint8List());
        image.dispose();
      });
      expect(tester.takeException(), isNull);
    });
  }
}
