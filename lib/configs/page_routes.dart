import 'package:bite_food_delivery/Screens/address_screen.dart';
import 'package:bite_food_delivery/Screens/all_category_screen.dart';
import 'package:bite_food_delivery/Screens/all_restaurant_screen.dart';
import 'package:bite_food_delivery/Screens/person_info_screen.dart';
import 'package:flutter/material.dart';

final Map<String, Widget Function(BuildContext)> routes = {
  '/address_screen': (context) => AddressScreen(),
  '/person_info_screen': (context) => PersonInfoScreen(),
  '/all_restaurants_screen': (context) => AllRestaurantScreen(),
  '/all_categories_screen': (context) => AllCategoryScreen(),
};
