import 'package:bite_food_delivery/Cubits/AddressCubit/address_cubit.dart';
import 'package:bite_food_delivery/Cubits/CartCubit/cart_cubit.dart';
import 'package:bite_food_delivery/Cubits/CategoriesCubit/categories_cubit.dart';
import 'package:bite_food_delivery/Cubits/CategorySelectionCubit/category_selection_cubit.dart';
import 'package:bite_food_delivery/Cubits/FilterRestaurantsCubit/filter_restaurants_cubit.dart';
import 'package:bite_food_delivery/Cubits/FoodItemCubit/food_item_cubit.dart';
import 'package:bite_food_delivery/Cubits/NotificationCubit/notifications_cubit.dart';
import 'package:bite_food_delivery/Cubits/OrderCubit/order_cubit.dart';
import 'package:bite_food_delivery/Cubits/RestaurantsCubit/restaurants_cubit.dart';
import 'package:bite_food_delivery/Cubits/UserAuthCubit/user_auth_cubit.dart';
import 'package:bite_food_delivery/Screens/AddressPage/Page/add_address_screen.dart';
import 'package:bite_food_delivery/Screens/AddressPage/Page/address_screen.dart';
import 'package:bite_food_delivery/Screens/AddressPage/Page/update_address_screen.dart';
import 'package:bite_food_delivery/Screens/CategoryPage/Page/all_category_screen.dart';
import 'package:bite_food_delivery/Screens/CheckOutPage/Page/check_out_screen.dart';
import 'package:bite_food_delivery/Screens/LoginPage/Page/forgot_password_screen.dart';
import 'package:bite_food_delivery/Screens/RestaurantPage/Page/all_restaurant_screen.dart';
import 'package:bite_food_delivery/Screens/CartPage/Page/cart_screen.dart';
import 'package:bite_food_delivery/Screens/CategoryPage/Page/category_screen.dart';
import 'package:bite_food_delivery/Screens/FAQPage/Page/faq_screen.dart';
import 'package:bite_food_delivery/Screens/FavouritePage/Page/favourite_screen.dart';
import 'package:bite_food_delivery/Screens/FoodItemPage/Page/food_item_screen.dart';
import 'package:bite_food_delivery/Screens/LoginPage/Page/login_screen.dart';
import 'package:bite_food_delivery/Screens/NotificationPage/Page/notification_screen.dart';
import 'package:bite_food_delivery/Screens/OrderHistoryPage/Page/order_history_screen.dart';
import 'package:bite_food_delivery/Screens/PaymentPage/Page/payment_screen.dart';
import 'package:bite_food_delivery/Screens/PersonInfoPage/Page/person_info_screen.dart';
import 'package:bite_food_delivery/Screens/RestaurantPage/Page/restaurant_screen.dart';
import 'package:bite_food_delivery/Screens/ReviewPage/Pages/my_reviews_screen.dart';
import 'package:bite_food_delivery/Screens/ReviewPage/Pages/review_screen.dart';
import 'package:bite_food_delivery/Screens/SettingPage/Page/setting_screen.dart';
import 'package:bite_food_delivery/Screens/PaymentPage/Page/add_card_screen.dart';
import 'package:bite_food_delivery/Screens/SignupPage/Page/signup_screen.dart';
import 'package:bite_food_delivery/Screens/TrackOrderPage/Page/track_order_screen.dart';
import 'package:bite_food_delivery/configs/firebase_auth_conn.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void _ensureAddressLoaded(BuildContext context) {
  final cubit = context.read<AddressCubit>();
  if (cubit.state is AddressInitial) {
    cubit.loadAddresses();
  }
}

void _ensureCartInitialized(BuildContext context) {
  final user = getCurrentUser();
  if (user == null) {
    return;
  }

  final cubit = context.read<CartCubit>();
  if (cubit.state is CartInitial) {
    cubit.initialize(user.uid);
  }
}

void _ensureCategoriesLoaded(BuildContext context) {
  final cubit = context.read<CategoriesCubit>();
  if (cubit.state is CategoriesInitial) {
    cubit.loadCategories();
  }
}

void _ensureRestaurantsLoaded(BuildContext context) {
  final cubit = context.read<RestaurantsCubit>();
  if (cubit.state is RestaurantsInitial) {
    cubit.loadRestaurants();
  }
}

void _ensureFoodItemsLoaded(BuildContext context) {
  final cubit = context.read<FoodItemCubit>();
  if (cubit.state is FoodItemInitial) {
    cubit.loadFoodItem();
  }
}

String? _loggedInUserId(BuildContext context) {
  final userState = context.read<UserAuthCubit>().state;
  if (userState is UserLoggedIn && userState.user.id != null) {
    return userState.user.id!;
  }
  return null;
}

final Map<String, Widget Function(BuildContext)> routes = {
  '/address_screen': (context) {
    _ensureAddressLoaded(context);
    return const AddressScreen();
  },
  '/person_info_screen': (context) => const PersonInfoScreen(),
  '/all_restaurants_screen': (context) {
    _ensureRestaurantsLoaded(context);
    return const AllRestaurantScreen();
  },
  '/all_categories_screen': (context) {
    _ensureCategoriesLoaded(context);
    return const AllCategoryScreen();
  },
  '/cart_screen': (context) {
    _ensureAddressLoaded(context);
    _ensureCartInitialized(context);
    return const CartScreen();
  },
  '/order_history_screen': (context) {
    final userId = _loggedInUserId(context);
    return BlocProvider(
      create: (providerContext) {
        final cubit = OrderCubit(
          notificationsCubit: providerContext.read<NotificationsCubit>(),
        );
        if (userId != null) {
          cubit.loadOrderHistory(userId);
        }
        return cubit;
      },
      child: const OrderHistoryScreen(),
    );
  },
  '/category_screen': (context) {
    _ensureRestaurantsLoaded(context);
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => CategorySelectionCubit()),
        BlocProvider(create: (_) => FilterRestaurantsCubit()),
      ],
      child: const CategoryScreen(),
    );
  },
  '/favourite': (context) {
    _ensureRestaurantsLoaded(context);
    _ensureFoodItemsLoaded(context);
    return const FavouriteScreen();
  },
  '/notification': (context) => const NotificationScreen(),
  '/setting_screen': (context) => const SettingScreen(),
  '/faq_screen': (context) => const FAQScreen(),
  '/add_address_screen': (context) {
    _ensureAddressLoaded(context);
    return const AddAddressScreen();
  },
  '/update_address_screen': (context) {
    _ensureAddressLoaded(context);
    return const UpdateAddressScreen();
  },
  '/payment_screen': (context) => const PaymentScreen(),
  '/add_card_screen': (context) => const AddCardScreen(),
  '/restaurant_screen': (context) {
    _ensureFoodItemsLoaded(context);
    return BlocProvider(
      create: (_) => CategorySelectionCubit(),
      child: const RestaurantScreen(),
    );
  },
  '/food_item_screen': (context) {
    _ensureCartInitialized(context);
    return const FoodItemScreen();
  },
  '/login_screen': (context) => const LoginScreen(),
  '/signup_screen': (context) => const SignupScreen(),
  '/forgot_password_screen': (context) => const ForgotPasswordScreen(),
  '/checkout_screen': (context) {
    _ensureAddressLoaded(context);
    _ensureCartInitialized(context);
    return const CheckOutScreen();
  },
  '/track_order_screen': (context) {
    _ensureRestaurantsLoaded(context);
    return const TrackOrderScreen();
  },
  '/review_screen': (context) => const ReviewScreen(),
  '/my_reviews_screen': (context) => const MyReviewsScreen(),
};
