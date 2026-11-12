import 'package:bite_food_delivery/features/restaurants/sections/all_restaurant_header_section.dart';
import 'package:bite_food_delivery/features/restaurants/sections/all_restaurant_list_section.dart';
import 'package:flutter/material.dart';

class AllRestaurantScreen extends StatelessWidget {
  const AllRestaurantScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          key: PageStorageKey('all_restaurant_screen'),
          physics: BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics(),
          ),
          slivers: [AllRestaurantHeaderSection(), AllRestaurantListSection()],
        ),
      ),
    );
  }
}
