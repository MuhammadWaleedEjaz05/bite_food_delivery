import 'package:bite_food_delivery/Cubits/AddressCubit/address_cubit.dart';
import 'package:bite_food_delivery/Cubits/BottomNavigationSelection/bottom_navigation_selector_cubit.dart';
import 'package:bite_food_delivery/Cubits/CartCubit/cart_cubit.dart';
import 'package:bite_food_delivery/Cubits/CategoriesCubit/categories_cubit.dart';
import 'package:bite_food_delivery/Cubits/CategorySelectionCubit/category_selection_cubit.dart';
import 'package:bite_food_delivery/Cubits/CreditCardCubit/credit_card_cubit.dart';
import 'package:bite_food_delivery/Cubits/FavouriteCubit/favourite_cubit.dart';
import 'package:bite_food_delivery/Cubits/FilterRestaurantsCubit/filter_restaurants_cubit.dart';
import 'package:bite_food_delivery/Cubits/FirstTimeLaunchCubit/first_time_launch_cubit.dart';
import 'package:bite_food_delivery/Cubits/FoodItemCubit/food_item_cubit.dart';
import 'package:bite_food_delivery/Cubits/MapLocationCubit/map_location_cubit.dart';
import 'package:bite_food_delivery/Cubits/NotificationCubit/notifications_cubit.dart';
import 'package:bite_food_delivery/Cubits/OrderCubit/order_cubit.dart';
import 'package:bite_food_delivery/Cubits/PaymentCubit/payment_method_selector_cubit.dart';
import 'package:bite_food_delivery/Cubits/RecentSearchesCubit/recent_searches_cubit.dart';
import 'package:bite_food_delivery/Cubits/RestaurantsCubit/restaurants_cubit.dart';
import 'package:bite_food_delivery/Cubits/SettingsCubit/settings_cubit.dart';
import 'package:bite_food_delivery/Cubits/UpdateCheckCubit/update_check_cubit.dart';
import 'package:bite_food_delivery/Cubits/UserAuthCubit/user_auth_cubit.dart';
import 'package:bite_food_delivery/configs/firebase_auth_conn.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

List<BlocProvider> blocProviderList = [
  BlocProvider<UserAuthCubit>(create: (context) => UserAuthCubit()),
  BlocProvider<CartCubit>(create: (context) => CartCubit()),
  BlocProvider<AddressCubit>(create: (context) => AddressCubit()),
  BlocProvider<NotificationsCubit>(
    create: (context) {
      final cubit = NotificationsCubit();
      final user = getCurrentUser();
      if (user != null) {
        cubit.loadNotifications(user.uid);
      }
      return cubit;
    },
  ),
  BlocProvider<OrderCubit>(
    create: (context) =>
        OrderCubit(notificationsCubit: context.read<NotificationsCubit>())
          ..loadActiveOrder(),
  ),
  BlocProvider<SettingsCubit>(create: (context) => SettingsCubit()),
  BlocProvider<BottomNavigationSelectorCubit>(
    create: (context) => BottomNavigationSelectorCubit(),
  ),
  BlocProvider<FirstTimeLaunchCubit>(
    create: (context) => FirstTimeLaunchCubit()..checkFirstTimeLaunch(),
  ),
  BlocProvider<UpdateCheckCubit>(create: (context) => UpdateCheckCubit()),
  BlocProvider<MapLocationCubit>(create: (context) => MapLocationCubit()),
  BlocProvider<FavouriteCubit>(create: (context) => FavouriteCubit()),
  BlocProvider<CreditCardCubit>(
    create: (context) => CreditCardCubit(getCurrentUser()?.uid),
  ),
  BlocProvider<RecentSearchesCubit>(create: (context) => RecentSearchesCubit()),
  BlocProvider<CategoriesCubit>(create: (context) => CategoriesCubit()),
  BlocProvider<RestaurantsCubit>(create: (context) => RestaurantsCubit()),
  BlocProvider<FoodItemCubit>(create: (context) => FoodItemCubit()),
  BlocProvider<CategorySelectionCubit>(
    create: (context) => CategorySelectionCubit(),
  ),
  BlocProvider<FilterRestaurantsCubit>(
    create: (context) => FilterRestaurantsCubit(),
  ),
  BlocProvider<PaymentMethodSelectorCubit>(
    create: (context) => PaymentMethodSelectorCubit(),
  ),
];
