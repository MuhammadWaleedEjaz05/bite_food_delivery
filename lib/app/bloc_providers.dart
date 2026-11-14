import 'package:bite_food_delivery/core/di/di.dart';
import 'package:bite_food_delivery/core/services/firebase/firebase_auth_conn.dart';
import 'package:bite_food_delivery/features/addresses/bloc/address_cubit.dart';
import 'package:bite_food_delivery/features/cart/bloc/cart_cubit.dart';
import 'package:bite_food_delivery/features/categories/bloc/categories_cubit.dart';
import 'package:bite_food_delivery/features/favourites/bloc/favourite_cubit.dart';
import 'package:bite_food_delivery/features/onboarding/bloc/first_time_launch_cubit.dart';
import 'package:bite_food_delivery/features/food_items/bloc/food_item_cubit.dart';
import 'package:bite_food_delivery/features/addresses/bloc/map_location_cubit.dart';
import 'package:bite_food_delivery/features/notifications/bloc/notifications_cubit.dart';
import 'package:bite_food_delivery/features/orders/bloc/order_cubit.dart';
import 'package:bite_food_delivery/features/restaurants/bloc/restaurants_cubit.dart';
import 'package:bite_food_delivery/features/settings/bloc/settings_cubit.dart';
import 'package:bite_food_delivery/features/app_update/bloc/update_check_cubit.dart';
import 'package:bite_food_delivery/features/authentication/bloc/user_auth_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

List<BlocProvider> blocProviderList = [
  BlocProvider<UserAuthCubit>(create: (context) => UserAuthCubit()),
  BlocProvider<CartCubit>(
    create: (context) {
      final cubit = Di.sl<CartCubit>();
      final user = getCurrentUser();
      if (user != null) cubit.initialize(user.uid);
      return cubit;
    },
  ),
  BlocProvider<AddressCubit>(
    create: (context) => Di.sl<AddressCubit>()..loadAddresses(),
  ),
  BlocProvider<NotificationsCubit>(create: (context) => NotificationsCubit()),
  BlocProvider<OrderCubit>(
    create: (context) =>
        OrderCubit(notificationsCubit: context.read<NotificationsCubit>())
          ..loadActiveOrder(),
  ),
  BlocProvider<SettingsCubit>(create: (context) => SettingsCubit()),
  BlocProvider<FirstTimeLaunchCubit>(
    create: (context) => FirstTimeLaunchCubit()..checkFirstTimeLaunch(),
  ),
  BlocProvider<UpdateCheckCubit>(create: (context) => UpdateCheckCubit()),
  BlocProvider<MapLocationCubit>(create: (context) => MapLocationCubit()),
  BlocProvider<FavouriteCubit>(create: (context) => Di.sl<FavouriteCubit>()),
  BlocProvider<CategoriesCubit>(
    create: (context) => Di.sl<CategoriesCubit>()..loadCategories(),
  ),
  BlocProvider<RestaurantsCubit>(
    create: (context) => Di.sl<RestaurantsCubit>()..loadRestaurants(),
  ),
  BlocProvider<FoodItemCubit>(
    create: (context) => Di.sl<FoodItemCubit>()..loadFoodItem(),
  ),
];

