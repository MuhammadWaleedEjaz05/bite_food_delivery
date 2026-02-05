import 'package:bite_food_delivery/Screens/home_screen.dart';
import 'package:bite_food_delivery/Screens/profile_screen.dart';
import 'package:bite_food_delivery/Screens/search_screen.dart';
import 'package:bite_food_delivery/Widgets/bite_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';

List<BiteBottomItemModel> screenList = [
  BiteBottomItemModel(
    icon: Icons.home_outlined,
    selectedIcon: Icons.home,
    title: "Home",
    page: HomeScreen(),
  ),
  BiteBottomItemModel(
    icon: Icons.search_outlined,
    selectedIcon: Icons.search,
    title: "Search",
    page: SearchScreen(),
  ),
  BiteBottomItemModel(
    icon: Icons.person_outlined,
    selectedIcon: Icons.person,
    title: "Profile",
    page: ProfileScreen(),
  ),
];
