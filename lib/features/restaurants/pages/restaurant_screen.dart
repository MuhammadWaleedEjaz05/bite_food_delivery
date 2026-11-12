import 'package:flutter/material.dart';
import 'package:bite_food_delivery/features/restaurants/sections/restaurant_header_section.dart';
import 'package:bite_food_delivery/features/restaurants/sections/restaurant_hero_section.dart';
import 'package:bite_food_delivery/features/restaurants/sections/restaurant_info_section.dart';
import 'package:bite_food_delivery/features/restaurants/sections/restaurant_service_section.dart';
import 'package:bite_food_delivery/features/restaurants/sections/restaurant_filter_section.dart';
import 'package:bite_food_delivery/features/restaurants/sections/restaurant_menu_section.dart';
import 'package:bite_food_delivery/features/restaurants/sections/restaurant_cart_section.dart';

class RestaurantScreen extends StatelessWidget {
  const RestaurantScreen({super.key});
  @override
  Widget build(BuildContext context) => const Scaffold(
    body: SafeArea(
      bottom: false,
      child: CustomScrollView(
        key: PageStorageKey('restaurant-detail'),
        physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
        slivers: [
          RestaurantHeaderSection(),
          RestaurantHeroSection(),
          RestaurantInfoSection(),
          RestaurantServiceSection(),
          RestaurantFilterSection(),
          RestaurantMenuSection(),
        ],
      ),
    ),
    bottomNavigationBar: RestaurantCartSection(),
  );
}
