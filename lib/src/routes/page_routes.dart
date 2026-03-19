import 'package:bite_food_delivery/src/features/payment/cubits/credit_card_cubit/credit_card_type_selector_cubit.dart';
import 'package:bite_food_delivery/src/features/order_management_and_history/cubits/order_cubit/order_cubit.dart';
import 'package:bite_food_delivery/src/features/payment/cubits/payment_cubit/payment_cubit.dart';
import 'package:bite_food_delivery/src/services/phone_call_cubit/phone_call_cubit.dart';
import 'package:bite_food_delivery/src/features/authentication/cubits/remember_me_cubit/remember_me_cubit.dart';
import 'package:bite_food_delivery/src/features/address_management/pages/add_address_screen.dart';
import 'package:bite_food_delivery/src/features/address_management/pages/address_screen.dart';
import 'package:bite_food_delivery/src/features/address_management/pages/update_address_screen.dart';
import 'package:bite_food_delivery/src/features/categories/pages/all_category_screen.dart';
import 'package:bite_food_delivery/src/features/checkout/pages/check_out_screen.dart';
import 'package:bite_food_delivery/src/features/authentication/pages/forgot_password_screen.dart';
import 'package:bite_food_delivery/src/features/restaurants/pages/all_restaurant_screen.dart';
import 'package:bite_food_delivery/src/features/cart/pages/cart_screen.dart';
import 'package:bite_food_delivery/src/features/categories/pages/category_screen.dart';
import 'package:bite_food_delivery/src/features/faq_help_support/pages/faq_screen.dart';
import 'package:bite_food_delivery/src/features/favourites/pages/favourite_screen.dart';
import 'package:bite_food_delivery/src/features/food_items/pages/food_item_screen.dart';
import 'package:bite_food_delivery/src/features/authentication/pages/login_screen.dart';
import 'package:bite_food_delivery/src/features/notifications/pages/notification_screen.dart';
import 'package:bite_food_delivery/src/features/order_management_and_history/pages/order_history_screen.dart';
import 'package:bite_food_delivery/src/features/payment/pages/payment_screen.dart';
import 'package:bite_food_delivery/src/features/profile/pages/person_info_screen.dart';
import 'package:bite_food_delivery/src/features/restaurants/pages/restaurant_screen.dart';
import 'package:bite_food_delivery/src/features/rating_and_reviews/pages/my_reviews_screen.dart';
import 'package:bite_food_delivery/src/features/rating_and_reviews/pages/review_screen.dart';
import 'package:bite_food_delivery/src/features/settings/pages/setting_screen.dart';
import 'package:bite_food_delivery/src/features/payment/pages/add_card_screen.dart';
import 'package:bite_food_delivery/src/features/authentication/pages/signup_screen.dart';
import 'package:bite_food_delivery/src/features/order_management_and_history/pages/track_order_screen.dart';
import 'package:bite_food_delivery/src/services/firebase/firebase_auth_conn.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

final Map<String, Widget Function(BuildContext)> routes = {
  '/address_screen': (context) => const AddressScreen(),
  '/person_info_screen': (context) => const PersonInfoScreen(),
  '/all_restaurants_screen': (context) => const AllRestaurantScreen(),
  '/all_categories_screen': (context) => const AllCategoryScreen(),
  '/cart_screen': (context) => const CartScreen(),
  '/order_history_screen': (context) => BlocProvider(
    create: (context) =>
        OrderCubit(notificationsCubit: context.read())
          ..loadOrderHistory(getCurrentUser()?.uid ?? ''),
    child: const OrderHistoryScreen(),
  ),
  '/category_screen': (context) => const CategoryScreen(),
  '/favourite': (context) => const FavouriteScreen(),
  '/notification': (context) => const NotificationScreen(),
  '/setting_screen': (context) => const SettingScreen(),
  '/faq_screen': (context) => const FAQScreen(),
  '/add_address_screen': (context) => const AddAddressScreen(),
  '/update_address_screen': (context) => const UpdateAddressScreen(),
  '/restaurant_screen': (context) => const RestaurantScreen(),
  '/food_item_screen': (context) => const FoodItemScreen(),
  '/login_screen': (context) => BlocProvider(
    create: (context) => RememberMeCubit()..getRememberMeData(),
    child: const LoginScreen(),
  ),
  '/signup_screen': (context) => const SignupScreen(),
  '/forgot_password_screen': (context) => const ForgotPasswordScreen(),
  '/review_screen': (context) => const ReviewScreen(),
  '/my_reviews_screen': (context) => const MyReviewsScreen(),
  '/payment_screen': (context) {
    return const PaymentScreen();
  },

  '/add_card_screen': (context) => BlocProvider(
    create: (_) => CreditCardTypeSelectorCubit(),
    child: const AddCardScreen(),
  ),

  '/checkout_screen': (context) => BlocProvider(
    create: (context) => PaymentCubit(),
    child: const CheckOutScreen(),
  ),

  '/track_order_screen': (context) => BlocProvider(
    create: (_) => PhoneCallCubit(),
    child: const TrackOrderScreen(),
  ),
};
