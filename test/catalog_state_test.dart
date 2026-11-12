import 'package:bite_food_delivery/features/cart/domain/cart_writer.dart';
import 'package:bite_food_delivery/features/cart/models/cart_item_model.dart';
import 'dart:async';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:bite_food_delivery/features/authentication/bloc/remember_me_cubit.dart';
import 'package:bite_food_delivery/features/categories/bloc/categories_cubit.dart';
import 'package:bite_food_delivery/features/categories/domain/categories_repository.dart';
import 'package:bite_food_delivery/features/restaurants/bloc/restaurants_cubit.dart';
import 'package:bite_food_delivery/features/restaurants/domain/restaurants_repository.dart';
import 'package:bite_food_delivery/features/categories/models/category_model.dart';
import 'package:bite_food_delivery/features/restaurants/models/restaurants_model.dart';
import 'package:bite_food_delivery/src/core/utils/shared_preference_functions.dart';

class FakeCategories implements CategoriesRepository {
  List<CategoryModel> items = [];
  bool fails = false;
  Completer<List<CategoryModel>>? pending;
  int calls = 0;
  @override
  Future<List<CategoryModel>> loadCategories() async {
    calls++;
    if (pending != null) return pending!.future;
    if (fails) throw StateError('offline');
    return items;
  }
}

class FakeRestaurants implements RestaurantsRepository {
  List<RestaurantModel> items = [];
  bool fails = false;
  @override
  Future<List<RestaurantModel>> loadRestaurants() async {
    if (fails) throw StateError('offline');
    return items;
  }
}

const category = CategoryModel(
  categoryID: '1',
  categoryName: 'Burgers',
  categoryImage: '',
);
const restaurant = RestaurantModel(
  id: '1',
  name: 'Bite Kitchen',
  logoUrl: '',
  description: '',
  address: '',
  rating: 4.8,
  reviewsCount: 80,
  deliveryFee: 100,
  deliveryTime: 25,
  isOpen: true,
  category: 'Burgers',
  isFavorite: false,
);
void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  test(
    'legacy passwords are erased at startup and never saved again',
    () async {
      SharedPreferences.setMockInitialValues({
        'rememberMePassword': 'legacy-secret',
        'rememberMeBool': true,
        'rememberMeEmail': 'old@example.com',
      });
      await initSharedPreferences();
      final prefs = await SharedPreferences.getInstance();
      expect(prefs.containsKey('rememberMePassword'), isFalse);
      final cubit = RememberMeCubit(prefs);
      addTearDown(cubit.close);
      expect(cubit.state.email, 'old@example.com');
      await cubit.toggleRememberMe(true, email: ' new@example.com ');
      expect(prefs.getString('rememberMeEmail'), 'new@example.com');
      expect(prefs.containsKey('rememberMePassword'), isFalse);
      await cubit.toggleRememberMe(false);
      expect(prefs.containsKey('rememberMeEmail'), isFalse);
      expect(cubit.state.isRememberMe, isFalse);
    },
  );
  test('category refresh preserves results on failure and recovers', () async {
    final repository = FakeCategories()..items = [category];
    final cubit = CategoriesCubit(repository);
    addTearDown(cubit.close);
    await cubit.loadCategories();
    repository.fails = true;
    await cubit.loadCategories();
    expect((cubit.state as CategoriesLoaded).categories, [category]);
    expect((cubit.state as CategoriesLoaded).refreshFailed, isTrue);
    repository.fails = false;
    repository.items = [];
    await cubit.loadCategories();
    expect((cubit.state as CategoriesLoaded).categories, isEmpty);
    expect((cubit.state as CategoriesLoaded).refreshFailed, isFalse);
  });
  test(
    'duplicate category loads are coalesced and closing during load is safe',
    () async {
      final repository = FakeCategories()
        ..pending = Completer<List<CategoryModel>>();
      final cubit = CategoriesCubit(repository);
      final first = cubit.loadCategories();
      await cubit.loadCategories();
      expect(repository.calls, 1);
      await cubit.close();
      repository.pending!.complete([category]);
      await first;
    },
  );
  test('category states compare payloads, not only their runtime types', () {
    expect(
      const CategoriesLoaded(categories: []),
      isNot(const CategoriesLoaded(categories: [category])),
    );
  });
  test(
    'restaurant refresh retains content and filters closed restaurants',
    () async {
      final repository = FakeRestaurants()
        ..items = [
          restaurant,
          restaurant.copyWith(id: 'closed', isOpen: false),
        ];
      final cubit = RestaurantsCubit(repository);
      addTearDown(cubit.close);
      await cubit.loadRestaurants();
      expect((cubit.state as RestaurantsLoaded).openRestaurants, [restaurant]);
      repository.fails = true;
      await cubit.loadRestaurants();
      expect((cubit.state as RestaurantsLoaded).restaurants.length, 2);
      expect((cubit.state as RestaurantsLoaded).refreshFailed, isTrue);
    },
  );
}

class FakeCartWriter implements CartWriter {
  final List<CartItemModel> added = [];
  @override
  Future<void> add({
    required String userId,
    required CartItemModel item,
  }) async {
    added.add(item);
  }
}
