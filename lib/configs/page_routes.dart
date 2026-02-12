import 'package:bite_food_delivery/Screens/AddressPage/Page/add_address_screen.dart';
import 'package:bite_food_delivery/Screens/AddressPage/Page/address_screen.dart';
import 'package:bite_food_delivery/Screens/CategoryPage/Page/all_category_screen.dart';
import 'package:bite_food_delivery/Screens/LoginPage/Page/forgot_password_screen.dart';
import 'package:bite_food_delivery/Screens/LoginPage/Page/new_password_screen.dart';
import 'package:bite_food_delivery/Screens/LoginPage/Page/otp_screen.dart';
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
import 'package:bite_food_delivery/Screens/SettingPage/Page/setting_screen.dart';
import 'package:bite_food_delivery/Screens/PaymentPage/Page/add_card_screen.dart';
import 'package:bite_food_delivery/Screens/SignupPage/Page/signup_screen.dart';
import 'package:flutter/material.dart';

final Map<String, Widget Function(BuildContext)> routes = {
  '/address_screen': (context) => AddressScreen(),
  '/person_info_screen': (context) => PersonInfoScreen(),
  '/all_restaurants_screen': (context) => AllRestaurantScreen(),
  '/all_categories_screen': (context) => AllCategoryScreen(),
  '/cart_screen': (context) => CartScreen(),
  '/order_history_screen': (context) => OrderHistoryScreen(),
  '/category_screen': (context) => CategoryScreen(),
  '/favourite': (context) => FavouriteScreen(),
  '/notification': (context) => NotificationScreen(),
  '/setting_screen': (context) => SettingScreen(),
  '/faq_screen': (context) => FAQScreen(),
  '/add_address_screen': (context) => AddAddressScreen(),
  '/payment_screen': (context) => PaymentScreen(),
  '/add_card_screen': (context) => AddCardScreen(),
  '/restaurant_screen': (context) => RestaurantScreen(),
  '/food_item_screen': (context) => FoodItemScreen(),
  '/login_screen': (context) => LoginScreen(),
  '/signup_screen': (context) => SignupScreen(),
  '/forgot_password_screen': (context) => ForgotPasswordScreen(),
  '/otp_screen': (context) => OTPScreen(),
  '/new_password_screen': (context) => NewPasswordScreen(),
};
