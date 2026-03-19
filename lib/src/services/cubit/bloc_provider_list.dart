import 'package:bite_food_delivery/src/features/address_management/cubits/address_cubit/address_cubit.dart';
import 'package:bite_food_delivery/src/shared/cubits/bottom_navigation_selection/bottom_navigation_selector_cubit.dart';
import 'package:bite_food_delivery/src/features/cart/cubits/cart_cubit/cart_cubit.dart';
import 'package:bite_food_delivery/src/features/categories/cubits/categories_cubit/categories_cubit.dart';
import 'package:bite_food_delivery/src/features/categories/cubits/category_selection_cubit/category_selection_cubit.dart';
import 'package:bite_food_delivery/src/features/payment/cubits/credit_card_cubit/credit_card_cubit.dart';
import 'package:bite_food_delivery/src/features/favourites/cubits/favourite_cubit/favourite_cubit.dart';
import 'package:bite_food_delivery/src/features/restaurants/cubits/filter_restaurants_cubit/filter_restaurants_cubit.dart';
import 'package:bite_food_delivery/src/features/splash_and_onboarding/cubits/first_time_launch_cubit/first_time_launch_cubit.dart';
import 'package:bite_food_delivery/src/features/food_items/cubits/food_item_cubit/food_item_cubit.dart';
import 'package:bite_food_delivery/src/features/address_management/cubits/map_location_cubit/map_location_cubit.dart';
import 'package:bite_food_delivery/src/features/notifications/cubits/notification_cubit/notifications_cubit.dart';
import 'package:bite_food_delivery/src/features/order_management_and_history/cubits/order_cubit/order_cubit.dart';
import 'package:bite_food_delivery/src/features/payment/cubits/payment_cubit/payment_method_selector_cubit.dart';
import 'package:bite_food_delivery/src/features/search/cubits/recent_searches_cubit/recent_searches_cubit.dart';
import 'package:bite_food_delivery/src/features/restaurants/cubits/restaurants_cubit/restaurants_cubit.dart';
import 'package:bite_food_delivery/src/features/settings/cubits/settings_cubit/settings_cubit.dart';
import 'package:bite_food_delivery/src/features/app_update/cubits/update_check_cubit/update_check_cubit.dart';
import 'package:bite_food_delivery/src/features/authentication/cubits/user_auth_cubit/user_auth_cubit.dart';
import 'package:bite_food_delivery/src/services/firebase/firebase_auth_conn.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

List<BlocProvider> blocProviderList = [
  BlocProvider<UserAuthCubit>(create: (context) => UserAuthCubit()),
  BlocProvider<CartCubit>(create: (context) => CartCubit()),
  BlocProvider<AddressCubit>(create: (context) => AddressCubit()),
  BlocProvider<NotificationsCubit>(create: (context) => NotificationsCubit()),
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
