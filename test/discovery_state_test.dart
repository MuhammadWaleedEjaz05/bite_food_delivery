import 'dart:async';
import 'package:flutter_test/flutter_test.dart';
import 'package:bite_food_delivery/features/discovery/bloc/discovery_cubit.dart';
import 'package:bite_food_delivery/features/favourites/bloc/favourite_cubit.dart';
import 'package:bite_food_delivery/features/favourites/domain/favourites_repository.dart';
import 'catalog_state_test.dart' as fixtures;
import 'support/catalog_fixtures.dart';

class ControlledFavourites implements FavouritesRepository {
  final streams = <String, StreamController<Set<String>>>{};
  final writes = <String>[];
  Completer<void>? pending;
  bool fails = false;
  @override
  Stream<Set<String>> watch(String userId) => streams
      .putIfAbsent(userId, () => StreamController<Set<String>>.broadcast())
      .stream;
  @override
  Future<void> set(String userId, String key, bool selected) async {
    writes.add('$userId:$key:$selected');
    if (fails) throw StateError('denied');
    await pending?.future;
  }

  Future<void> close() async {
    for (final stream in streams.values) {
      await stream.close();
    }
  }
}

void main() {
  test(
    'search matches dishes, restaurants and all query words without case sensitivity',
    () async {
      final cubit = DiscoveryCubit(
        fixtures.FakeRestaurants()..items = [fixtures.restaurant],
        MemoryFoodRepository(),
      );
      addTearDown(cubit.close);
      await cubit.load();
      cubit.query(' SMOKY  chicken ');
      expect(cubit.state.foodResults().single, dish);
      expect(cubit.state.restaurantResults(), isEmpty);
      cubit.query('BITE KITCHEN');
      expect(cubit.state.foodResults().single, dish);
      expect(cubit.state.restaurantResults().single, fixtures.restaurant);
      cubit.query('impossible');
      expect(cubit.state.foodResults(), isEmpty);
      cubit.query('');
      expect(cubit.state.foodResults(), hasLength(1));
    },
  );
  test(
    'category, kind, availability and saved selections compose; reset clears all filters',
    () async {
      final cubit = DiscoveryCubit(
        fixtures.FakeRestaurants()
          ..items = [fixtures.restaurant.copyWith(isOpen: false)],
        MemoryFoodRepository(),
      );
      addTearDown(cubit.close);
      await cubit.load();
      cubit.toggleOpen();
      expect(cubit.state.restaurantResults(), isEmpty);
      expect(cubit.state.foodResults(), isEmpty);
      cubit.toggleOpen();
      cubit.category('Burgers');
      cubit.kind(DiscoveryKind.foods);
      expect(cubit.state.foodResults(saved: {'foodItem:dish'}), hasLength(1));
      expect(cubit.state.foodResults(saved: {'restaurant:1'}), isEmpty);
      expect(cubit.state.restaurantResults(), isEmpty);
      cubit.category('missing');
      expect(cubit.state.foodResults(), isEmpty);
      cubit.reset();
      expect(cubit.state.foodResults(), hasLength(1));
      expect(cubit.state.restaurantResults(), hasLength(1));
    },
  );
  test('unavailable and orphaned dishes are excluded correctly', () async {
    final food = MemoryFoodRepository()
      ..items = [
        dish.copyWith(isAvailable: false),
        dish.copyWith(id: 'orphan', restaurantId: 'missing'),
      ];
    final cubit = DiscoveryCubit(
      fixtures.FakeRestaurants()..items = [fixtures.restaurant],
      food,
    );
    addTearDown(cubit.close);
    await cubit.load();
    expect(cubit.state.foodResults(), hasLength(1));
    cubit.toggleOpen();
    expect(cubit.state.foodResults(), isEmpty);
  });
  test(
    'sort order is deterministic and expanding results preserves filters',
    () async {
      final cubit = DiscoveryCubit(
        fixtures.FakeRestaurants()
          ..items = [
            fixtures.restaurant.copyWith(
              id: 'b',
              name: 'Alpha',
              rating: 4,
              deliveryTime: 10,
            ),
            fixtures.restaurant.copyWith(
              id: 'a',
              name: 'Zulu',
              rating: 5,
              deliveryTime: 30,
            ),
          ],
        MemoryFoodRepository()..items = [],
      );
      addTearDown(cubit.close);
      await cubit.load();
      expect(cubit.state.restaurantResults().first.id, 'a');
      cubit.sort(DiscoverySort.delivery);
      expect(cubit.state.restaurantResults().first.id, 'b');
      cubit.sort(DiscoverySort.name);
      expect(cubit.state.restaurantResults().first.id, 'b');
      cubit.more();
      expect(cubit.state.limit, 40);
      expect(cubit.state.sort, DiscoverySort.name);
      cubit.query('Zulu');
      expect(cubit.state.limit, 20);
    },
  );
  test(
    'refresh failures keep the complete prior snapshot and filters',
    () async {
      final restaurants = fixtures.FakeRestaurants()
        ..items = [fixtures.restaurant];
      final foods = MemoryFoodRepository();
      final cubit = DiscoveryCubit(restaurants, foods);
      addTearDown(cubit.close);
      await cubit.load();
      cubit.query('smoky');
      restaurants.items = [];
      foods.fails = true;
      await cubit.load();
      expect(cubit.state.failed, true);
      expect(cubit.state.foodResults().single, dish);
      expect(cubit.state.restaurants, hasLength(1));
      foods.fails = false;
      await cubit.load();
      expect(cubit.state.failed, false);
      expect(cubit.state.foodResults(), isEmpty);
    },
  );
  test('pending loads coalesce and completion after close is safe', () async {
    final foods = MemoryFoodRepository()..pending = Completer();
    final cubit = DiscoveryCubit(fixtures.FakeRestaurants(), foods);
    final pending = cubit.load();
    await cubit.load();
    await cubit.close();
    foods.pending!.complete([]);
    await pending;
  });
  test('recent searches normalize, deduplicate, cap and replay query', () {
    final cubit = DiscoveryCubit(
      fixtures.FakeRestaurants(),
      MemoryFoodRepository(),
    );
    addTearDown(cubit.close);
    cubit.submit('   ');
    expect(cubit.state.recent, isEmpty);
    cubit.submit('  chicken   burger ');
    cubit.submit('Chicken burger');
    expect(cubit.state.recent, ['Chicken burger']);
    for (var i = 0; i < 12; i++) {
      cubit.submit('query $i');
    }
    expect(cubit.state.recent, hasLength(8));
    cubit.submit(cubit.state.recent.last);
    expect(cubit.state.query, cubit.state.recent.first);
    cubit.clearRecent();
    expect(cubit.state.recent, isEmpty);
  });
  test('favourites reject guests and ignore shared legacy flags', () async {
    final repo = ControlledFavourites();
    final cubit = FavouriteCubit(repo);
    addTearDown(repo.close);
    addTearDown(cubit.close);
    expect(cubit.selection('1', FavouriteType.restaurant, true), false);
    await expectLater(
      cubit.setSelection('1', FavouriteType.restaurant, true),
      throwsStateError,
    );
    expect(repo.writes, isEmpty);
  });
  test(
    'account changes clear keys and ignore previous in-flight writes and events',
    () async {
      final repo = ControlledFavourites();
      final cubit = FavouriteCubit(repo);
      addTearDown(repo.close);
      addTearDown(cubit.close);
      cubit.bindUser('alice');
      repo.streams['alice']!.add({'restaurant:1'});
      await Future<void>.delayed(Duration.zero);
      expect(cubit.state.keys, {'restaurant:1'});
      repo.pending = Completer<void>();
      final write = cubit.setSelection('dish', FavouriteType.foodItem, true);
      await cubit.setSelection('dish', FavouriteType.foodItem, true);
      expect(repo.writes, hasLength(1));
      cubit.bindUser('bob');
      expect(cubit.state.keys, isEmpty);
      repo.streams['alice']!.add({'foodItem:dish'});
      repo.streams['bob']!.add({'restaurant:2'});
      repo.pending!.complete();
      await write;
      await Future<void>.delayed(Duration.zero);
      expect(cubit.state.keys, {'restaurant:2'});
      cubit.bindUser(null);
      expect(cubit.state.keys, isEmpty);
    },
  );
  test(
    'favourite failures preserve selections, clear pending and can retry',
    () async {
      final repo = ControlledFavourites();
      final cubit = FavouriteCubit(repo);
      addTearDown(repo.close);
      addTearDown(cubit.close);
      cubit.bindUser('alice');
      repo.streams['alice']!.add({'restaurant:1'});
      await Future<void>.delayed(Duration.zero);
      repo.fails = true;
      await expectLater(
        cubit.setSelection('1', FavouriteType.restaurant, false),
        throwsStateError,
      );
      expect(cubit.state.keys, {'restaurant:1'});
      expect(cubit.state.pending, isEmpty);
      repo.fails = false;
      await cubit.setSelection('1', FavouriteType.restaurant, false);
      expect(cubit.state.keys, isEmpty);
      repo.streams['alice']!.addError(StateError('denied'));
      await Future<void>.delayed(Duration.zero);
      expect(cubit.state.failed, true);
      cubit.bindUser('alice', retry: true);
      repo.streams['alice']!.add({'foodItem:dish'});
      await Future<void>.delayed(Duration.zero);
      expect(cubit.state.failed, false);
      expect(cubit.state.keys, {'foodItem:dish'});
    },
  );
}
