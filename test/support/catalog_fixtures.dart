import 'package:bite_food_delivery/features/cart/domain/cart_repository.dart';
import 'package:bite_food_delivery/features/cart/models/cart_model.dart';
import 'package:bite_food_delivery/features/favourites/domain/favourites_repository.dart';
import 'dart:async';
import 'package:bite_food_delivery/features/food_items/domain/food_repository.dart';
import 'package:bite_food_delivery/features/food_items/models/food_item_model.dart';
import 'package:bite_food_delivery/features/cart/domain/cart_writer.dart';
import 'package:bite_food_delivery/features/cart/models/cart_item_model.dart';

const dish = FoodItemModel(
  id: 'dish',
  name: 'Smoky chicken burger',
  category: 'Burgers',
  description: 'Grilled chicken, crisp lettuce and a smoky house sauce.',
  restaurantId: '1',
  price: 525.50,
  images: [],
  sizes: ['Regular', 'Large'],
  flavors: {'Smoky': '', 'Spicy': ''},
);

class MemoryFoodRepository implements FoodRepository {
  List<FoodItemModel> items = [dish];
  bool fails = false;
  String? requestedRestaurant;
  Completer<List<FoodItemModel>>? pending;
  @override
  Future<List<FoodItemModel>> loadItems({String? restaurantId}) async {
    requestedRestaurant = restaurantId;
    if (pending != null) return pending!.future;
    if (fails) throw StateError('offline');
    return items;
  }
}

class RecordingCartWriter implements CartWriter {
  final List<CartItemModel> items = [];
  bool fails = false;
  Completer<void>? pending;
  @override
  Future<void> add({
    required String userId,
    required CartItemModel item,
  }) async {
    items.add(item);
    if (fails) throw StateError('offline');
    if (pending != null) await pending!.future;
  }
}

class MemoryFavouritesRepository implements FavouritesRepository {
  final Map<String, Set<String>> users = {};
  @override
  Stream<Set<String>> watch(String userId) => Stream.value(users[userId] ?? {});
  @override
  Future<void> set(String userId, String key, bool selected) async {
    final keys = users.putIfAbsent(userId, () => {});
    selected ? keys.add(key) : keys.remove(key);
  }
}

class MemoryCartRepository implements CartRepository {
  @override
  Stream<CartModel?> watch(String userId) => Stream.value(null);
  @override
  Future<void> setQuantity({
    required String userId,
    required String cartId,
    required String lineId,
    required int expectedQuantity,
    required int quantity,
  }) async {}
}
