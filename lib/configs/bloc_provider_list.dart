import 'package:bite_food_delivery/Cubits/AddressCubit/address_cubit.dart';
import 'package:bite_food_delivery/Cubits/BottomNavigationSelection/bottom_navigation_selector_cubit.dart';
import 'package:bite_food_delivery/Cubits/CartCubit/cart_cubit.dart';
import 'package:bite_food_delivery/Cubits/CategoriesCubit/categories_cubit.dart';
import 'package:bite_food_delivery/Cubits/CreditCardCubit/credit_card_cubit.dart';
import 'package:bite_food_delivery/Cubits/CreditCardCubit/credit_card_type_selector_cubit.dart';
import 'package:bite_food_delivery/Cubits/FavouriteCubit/favourite_cubit.dart';
import 'package:bite_food_delivery/Cubits/FirstTimeLaunchCubit/first_time_launch_cubit.dart';
import 'package:bite_food_delivery/Cubits/FoodItemCubit/food_item_cubit.dart';
import 'package:bite_food_delivery/Cubits/NotificationCubit/notifications_cubit.dart';
import 'package:bite_food_delivery/Cubits/OrderCubit/order_cubit.dart';
import 'package:bite_food_delivery/Cubits/PaymentCubit/payment_cubit.dart';
import 'package:bite_food_delivery/Cubits/PaymentCubit/payment_method_selector_cubit.dart';
import 'package:bite_food_delivery/Cubits/RecentSearchesCubit/recent_searches_cubit.dart';
import 'package:bite_food_delivery/Cubits/RestaurantsCubit/restaurants_cubit.dart';
import 'package:bite_food_delivery/Cubits/SettingsCubit/settings_cubit.dart';
import 'package:bite_food_delivery/Cubits/UpdateCheckCubit/update_check_cubit.dart';
import 'package:bite_food_delivery/Cubits/UserAuthCubit/user_auth_cubit.dart';
import 'package:bite_food_delivery/configs/firebase_auth_conn.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

List<BlocProvider> blocProviderList = [
  BlocProvider<CartCubit>(create: (context) => CartCubit()),
  BlocProvider<AddressCubit>(create: (context) => AddressCubit()),
  BlocProvider<CategoriesCubit>(create: (context) => CategoriesCubit()),
  BlocProvider<RestaurantsCubit>(create: (context) => RestaurantsCubit()),
  BlocProvider<RecentSearchesCubit>(create: (context) => RecentSearchesCubit()),
  BlocProvider<BottomNavigationSelectorCubit>(
    create: (context) => BottomNavigationSelectorCubit(),
  ),
  BlocProvider<FavouriteCubit>(create: (context) => FavouriteCubit()),
  BlocProvider<UserAuthCubit>(create: (context) => UserAuthCubit()),
  BlocProvider<FoodItemCubit>(create: (context) => FoodItemCubit()),
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
  BlocProvider<CreditCardTypeSelectorCubit>(
    create: (context) => CreditCardTypeSelectorCubit(),
  ),
  BlocProvider<PaymentMethodSelectorCubit>(
    create: (context) => PaymentMethodSelectorCubit(),
  ),
  BlocProvider<PaymentCubit>(create: (context) => PaymentCubit()),
  BlocProvider<CreditCardCubit>(
    create: (context) => CreditCardCubit(getCurrentUser()?.uid),
  ),
  BlocProvider<FirstTimeLaunchCubit>(
    create: (context) => FirstTimeLaunchCubit()..checkFirstTimeLaunch(),
  ),
  BlocProvider<SettingsCubit>(create: (context) => SettingsCubit()),
  BlocProvider<UpdateCheckCubit>(create: (context) => UpdateCheckCubit()),
];
