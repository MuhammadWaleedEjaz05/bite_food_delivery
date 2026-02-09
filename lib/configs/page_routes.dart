import 'package:bite_food_delivery/Screens/address_screen.dart';
import 'package:bite_food_delivery/Screens/all_category_screen.dart';
import 'package:bite_food_delivery/Screens/all_restaurant_screen.dart';
import 'package:bite_food_delivery/Screens/cart_screen.dart';
import 'package:bite_food_delivery/Screens/category_screen.dart';
import 'package:bite_food_delivery/Screens/faq_screen.dart';
import 'package:bite_food_delivery/Screens/favourite_screen.dart';
import 'package:bite_food_delivery/Screens/notification_screen.dart';
import 'package:bite_food_delivery/Screens/order_history_screen.dart';
import 'package:bite_food_delivery/Screens/person_info_screen.dart';
import 'package:bite_food_delivery/Screens/setting_screen.dart';
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
};
