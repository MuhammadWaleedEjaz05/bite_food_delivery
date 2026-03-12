import 'package:bite_food_delivery/Cubits/CreditCardCubit/credit_card_type_selector_cubit.dart';
import 'package:bite_food_delivery/Cubits/PaymentCubit/payment_cubit.dart';
import 'package:bite_food_delivery/Cubits/PaymentCubit/payment_method_selector_cubit.dart';
import 'package:bite_food_delivery/Cubits/PhoneCallCubit/phone_call_cubit.dart';
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
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

final Map<String, Widget Function(BuildContext)> routes = {
  '/address_screen': (context) => const AddressScreen(),
  '/person_info_screen': (context) => const PersonInfoScreen(),
  '/all_restaurants_screen': (context) => const AllRestaurantScreen(),
  '/all_categories_screen': (context) => const AllCategoryScreen(),
  '/cart_screen': (context) => const CartScreen(),
  '/order_history_screen': (context) => const OrderHistoryScreen(),
  '/category_screen': (context) => const CategoryScreen(),
  '/favourite': (context) => const FavouriteScreen(),
  '/notification': (context) => const NotificationScreen(),
  '/setting_screen': (context) => const SettingScreen(),
  '/faq_screen': (context) => const FAQScreen(),
  '/add_address_screen': (context) => const AddAddressScreen(),
  '/update_address_screen': (context) => const UpdateAddressScreen(),
  '/restaurant_screen': (context) => const RestaurantScreen(),
  '/food_item_screen': (context) => const FoodItemScreen(),
  '/login_screen': (context) => const LoginScreen(),
  '/signup_screen': (context) => const SignupScreen(),
  '/forgot_password_screen': (context) => const ForgotPasswordScreen(),
  '/review_screen': (context) => const ReviewScreen(),
  '/my_reviews_screen': (context) => const MyReviewsScreen(),
  '/payment_screen': (context) {
    return BlocProvider(
      create: (_) => PaymentMethodSelectorCubit(),
      child: const PaymentScreen(),
    );
  },
  '/add_card_screen': (context) => BlocProvider(
    create: (_) => CreditCardTypeSelectorCubit(),
    child: const AddCardScreen(),
  ),

  '/checkout_screen': (context) => MultiBlocProvider(
    providers: [
      BlocProvider(create: (_) => PaymentMethodSelectorCubit()),
      BlocProvider(create: (_) => PaymentCubit()),
    ],
    child: const CheckOutScreen(),
  ),
  '/track_order_screen': (context) => BlocProvider(
    create: (_) => PhoneCallCubit(),
    child: const TrackOrderScreen(),
  ),
};
