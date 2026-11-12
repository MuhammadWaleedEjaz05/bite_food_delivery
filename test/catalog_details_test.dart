import 'dart:async';
import 'package:bite_food_delivery/features/food_items/models/food_item_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:bite_food_delivery/core/models/coordinates.dart';
import 'package:bite_food_delivery/features/restaurants/data/restaurant_dto.dart';
import 'package:bite_food_delivery/features/restaurants/bloc/restaurant_menu_cubit.dart';
import 'package:bite_food_delivery/features/food_items/bloc/food_details_cubit.dart';
import 'package:bite_food_delivery/features/food_items/models/food_detail_arguments.dart';
import 'package:bite_food_delivery/features/cart/models/cart_item_model.dart';
import 'catalog_state_test.dart' as home;
import 'support/catalog_fixtures.dart';

void main() {
  test('structured flavours preserve labels containing commas', () {
    const one = CartItemModel(
      productID: 'dish',
      product: dish,
      quantity: 1,
      selectedFlavors: ['Smoky, Spicy'],
    );
    const two = CartItemModel(
      productID: 'dish',
      product: dish,
      quantity: 1,
      selectedFlavors: ['Smoky', 'Spicy'],
    );
    expect(one.configurationID, isNot(two.configurationID));
    expect(CartItemModel.fromJson(one.toJson()).selectedFlavors, [
      'Smoky, Spicy',
    ]);
  });
  test(
    'restaurant DTO reads both legacy coordinate formats and retains metadata',
    () {
      final data = RestaurantDto.encode(
        home.restaurant.copyWith(
          description: 'Description',
          geoLocation: const Coordinates(24.8, 67.1),
        ),
      );
      expect(data['geoLocation'], isA<GeoPoint>());
      expect(RestaurantDto.decode(data).description, 'Description');
      expect(
        RestaurantDto.decode(data).geoLocation,
        const Coordinates(24.8, 67.1),
      );
      data['geoLocation'] = {'latitude': 24.8, 'longitude': 67.1};
      expect(
        RestaurantDto.decode(data).geoLocation,
        const Coordinates(24.8, 67.1),
      );
      expect(RestaurantDto.decode(data).isOpen, isTrue);
    },
  );
  test(
    'restaurant menus filter only their own items and own category selection',
    () async {
      final repository = MemoryFoodRepository()
        ..items = [
          dish,
          dish.copyWith(id: 'side', category: 'Sides'),
          dish.copyWith(id: 'other', restaurantId: '2'),
        ];
      final first = RestaurantMenuCubit(home.restaurant, repository);
      final second = RestaurantMenuCubit(home.restaurant, repository);
      addTearDown(first.close);
      addTearDown(second.close);
      await first.load();
      await second.load();
      expect(repository.requestedRestaurant, '1');
      expect(first.state.items.length, 2);
      first.selectCategory('Sides');
      expect(first.state.visibleItems.single.id, 'side');
      expect(second.state.selectedCategory, isEmpty);
      first.selectCategory('Invalid');
      expect(first.state.selectedCategory, 'Sides');
      repository.fails = true;
      await first.load();
      expect(first.state.failed, isTrue);
      expect(first.state.items.length, 2);
    },
  );
  test('menu load can complete after its route is closed', () async {
    final repository = MemoryFoodRepository()
      ..pending = Completer<List<FoodItemModel>>();
    final cubit = RestaurantMenuCubit(home.restaurant, repository);
    final load = cubit.load();
    await cubit.close();
    repository.pending!.complete([dish]);
    await load;
  });
  test(
    'food options and quantity are validated and captured in cart command',
    () async {
      final writer = RecordingCartWriter();
      final cubit = FoodDetailsCubit(
        const FoodDetailArguments(item: dish, restaurantName: 'Bite'),
        writer,
        () => 'user',
      );
      addTearDown(cubit.close);
      cubit.selectSize('Invalid');
      expect(cubit.state.selectedSize, 'Regular');
      cubit.selectSize('Large');
      cubit.toggleFlavor('Spicy');
      cubit.toggleFlavor('Smoky');
      cubit.toggleFlavor('Invalid');
      cubit.setQuantity(3);
      cubit.setQuantity(0);
      cubit.setQuantity(100);
      expect(cubit.total, 1576.5);
      await cubit.addToCart();
      expect(writer.items.single.selectedSize, 'Large');
      expect(writer.items.single.selectedFlavor, 'Smoky, Spicy');
      expect(writer.items.single.quantity, 3);
      expect(cubit.state.result, FoodActionResult.added);
    },
  );
  test('guest and unavailable orders never reach the cart writer', () async {
    final writer = RecordingCartWriter();
    final guest = FoodDetailsCubit(
      const FoodDetailArguments(item: dish, restaurantName: 'Bite'),
      writer,
      () => null,
    );
    final closed = FoodDetailsCubit(
      const FoodDetailArguments(
        item: dish,
        restaurantName: 'Bite',
        restaurantOpen: false,
      ),
      writer,
      () => 'user',
    );
    addTearDown(guest.close);
    addTearDown(closed.close);
    await guest.addToCart();
    await closed.addToCart();
    expect(guest.state.result, FoodActionResult.signInRequired);
    expect(closed.state.result, FoodActionResult.unavailable);
    expect(writer.items, isEmpty);
  });
  test('food submission is single-flight and failure is recoverable', () async {
    final writer = RecordingCartWriter()..pending = Completer<void>();
    final cubit = FoodDetailsCubit(
      const FoodDetailArguments(item: dish, restaurantName: 'Bite'),
      writer,
      () => 'user',
    );
    addTearDown(cubit.close);
    final pending = cubit.addToCart();
    await cubit.addToCart();
    cubit.setQuantity(4);
    expect(writer.items.length, 1);
    expect(cubit.state.quantity, 1);
    writer.pending!.complete();
    await pending;
    writer.pending = null;
    writer.fails = true;
    await cubit.addToCart();
    expect(cubit.state.result, FoodActionResult.failed);
    expect(cubit.state.submitting, isFalse);
    writer.fails = false;
    await cubit.addToCart();
    expect(cubit.state.result, FoodActionResult.added);
  });
  test(
    'cart configurations are distinct and legacy document IDs survive edits',
    () {
      const regular = CartItemModel(
        productID: 'dish',
        product: dish,
        quantity: 1,
        selectedSize: 'Regular',
        selectedFlavor: 'Smoky, Spicy',
      );
      final reorderedFlavors = regular.copyWith(selectedFlavor: 'Spicy, Smoky');
      expect(regular.configurationID, reorderedFlavors.configurationID);
      expect(
        regular.configurationID,
        isNot(regular.copyWith(selectedSize: 'Large').configurationID),
      );
      final legacy = CartItemModel.fromJson({
        ...regular.toJson(),
        'lineID': 'legacy-doc',
      });
      expect(legacy.copyWith(quantity: 2).documentID, 'legacy-doc');
      expect(CartItemModel.fromJson(legacy.toJson()).documentID, 'legacy-doc');
    },
  );
}
