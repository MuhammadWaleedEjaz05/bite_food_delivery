import 'package:bite_food_delivery/features/checkout/data/stripe_card_payment_gateway.dart';
import 'package:bite_food_delivery/features/checkout/domain/card_payment_gateway.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:bite_food_delivery/features/checkout/bloc/checkout_cubit.dart';
import 'package:bite_food_delivery/features/checkout/domain/checkout_repository.dart';
import 'package:bite_food_delivery/features/checkout/data/firebase_checkout_repository.dart';
import 'package:bite_food_delivery/features/cart/domain/cart_repository.dart';
import 'package:bite_food_delivery/features/cart/data/firestore_cart_repository.dart';
import 'package:bite_food_delivery/features/discovery/bloc/discovery_cubit.dart';
import 'package:bite_food_delivery/features/favourites/domain/favourites_repository.dart';
import 'package:bite_food_delivery/features/favourites/data/firestore_favourites_repository.dart';
import 'package:bite_food_delivery/features/orders/bloc/order_cubit.dart';
import 'package:bite_food_delivery/features/notifications/bloc/notifications_cubit.dart';
import 'package:bite_food_delivery/core/services/phone_call/phone_call_cubit.dart';
import 'package:bite_food_delivery/features/catalog/bloc/catalog_route_cubit.dart';
import 'package:bite_food_delivery/features/catalog/domain/catalog_lookup.dart';
import 'package:bite_food_delivery/features/catalog/data/firestore_catalog_lookup.dart';
import 'package:bite_food_delivery/app/routes/app_router.dart';
import 'package:go_router/go_router.dart';
import 'package:bite_food_delivery/features/favourites/bloc/favourite_cubit.dart';
import 'package:bite_food_delivery/features/cart/data/firestore_cart_writer.dart';
import 'package:bite_food_delivery/features/cart/domain/cart_writer.dart';
import 'package:bite_food_delivery/features/food_items/domain/food_repository.dart';
import 'package:bite_food_delivery/features/food_items/data/firestore_food_repository.dart';
import 'package:bite_food_delivery/features/food_items/bloc/food_details_cubit.dart';
import 'package:bite_food_delivery/features/food_items/models/food_detail_arguments.dart';
import 'package:bite_food_delivery/features/restaurants/bloc/restaurant_menu_cubit.dart';
import 'package:bite_food_delivery/features/restaurants/models/restaurants_model.dart';
import 'package:bite_food_delivery/core/services/firebase/firebase_auth_conn.dart';
import 'package:bite_food_delivery/features/cart/bloc/cart_cubit.dart';
import 'package:bite_food_delivery/features/addresses/bloc/address_cubit.dart';
import 'package:bite_food_delivery/features/food_items/bloc/food_item_cubit.dart';
import 'package:get_it/get_it.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:bite_food_delivery/features/categories/bloc/categories_cubit.dart';
import 'package:bite_food_delivery/features/categories/domain/categories_repository.dart';
import 'package:bite_food_delivery/features/categories/data/firestore_categories_repository.dart';
import 'package:bite_food_delivery/features/restaurants/bloc/restaurants_cubit.dart';
import 'package:bite_food_delivery/features/restaurants/domain/restaurants_repository.dart';
import 'package:bite_food_delivery/features/restaurants/data/firestore_restaurants_repository.dart';
import 'package:bite_food_delivery/features/authentication/bloc/remember_me_cubit.dart';

abstract final class Di {
  static final sl = GetIt.instance;
  static void configure({
    required FirebaseFirestore database,
    required SharedPreferences preferences,
  }) {
    sl.registerLazySingleton<GoRouter>(
      () => AppRouter.create(signedIn: () => getCurrentUser() != null),
    );
    sl.registerLazySingleton<CatalogLookup>(
      () => FirestoreCatalogLookup(database),
    );
    sl.registerFactory(() => CatalogRouteCubit(sl<CatalogLookup>()));
    sl.registerLazySingleton<CategoriesRepository>(
      () => FirestoreCategoriesRepository(database),
    );
    sl.registerLazySingleton<RestaurantsRepository>(
      () => FirestoreRestaurantsRepository(database),
    );
    sl.registerLazySingleton<FoodRepository>(
      () => FirestoreFoodRepository(database),
    );
    sl.registerLazySingleton<CartWriter>(() => FirestoreCartWriter(database));
    sl.registerFactoryParam<RestaurantMenuCubit, RestaurantModel, void>(
      (restaurant, _) => RestaurantMenuCubit(restaurant, sl<FoodRepository>()),
    );
    sl.registerFactoryParam<FoodDetailsCubit, FoodDetailArguments, void>(
      (arguments, _) => FoodDetailsCubit(
        arguments,
        sl<CartWriter>(),
        () => getCurrentUser()?.uid,
      ),
    );
    sl.registerFactoryParam<OrderCubit, NotificationsCubit, void>(
      (notifications, _) => OrderCubit(notificationsCubit: notifications),
    );
    sl.registerLazySingleton<CheckoutRepository>(
      () => FirebaseCheckoutRepository(
        FirebaseFunctions.instanceFor(region: 'us-central1'),
      ),
    );
    sl.registerLazySingleton<CardPaymentGateway>(
      () => StripeCardPaymentGateway(
        FirebaseFunctions.instanceFor(region: 'us-central1'),
      ),
    );
    sl.registerFactory(
      () => CheckoutCubit(
        sl<CheckoutRepository>(),
        cards: sl<CardPaymentGateway>(),
      ),
    );
    sl.registerFactory(() => PhoneCallCubit());
    sl.registerFactory(
      () => DiscoveryCubit(sl<RestaurantsRepository>(), sl<FoodRepository>()),
    );
    sl.registerLazySingleton<FavouritesRepository>(
      () => FirestoreFavouritesRepository(database),
    );
    sl.registerFactory(
      () =>
          FavouriteCubit(sl<FavouritesRepository>())
            ..bindUser(getCurrentUser()?.uid),
    );
    sl.registerLazySingleton<CartRepository>(
      () => FirestoreCartRepository(database),
    );
    sl.registerFactory(() => CartCubit(sl<CartRepository>()));
    sl.registerFactory(() => AddressCubit());
    sl.registerFactory(() => FoodItemCubit(sl<FoodRepository>()));
    sl.registerFactory(() => CategoriesCubit(sl<CategoriesRepository>()));
    sl.registerFactory(() => RestaurantsCubit(sl<RestaurantsRepository>()));
    sl.registerFactory(() => RememberMeCubit(preferences));
  }
}
