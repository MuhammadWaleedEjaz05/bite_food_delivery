import 'package:bite_food_delivery/configs/order_history_tab_list.dart';
import 'package:flutter/material.dart';

class BiteTabBar extends StatelessWidget {
  const BiteTabBar({super.key});

  @override
  Widget build(BuildContext context) {
    return TabBar(
      labelColor: Colors.deepOrange,
      unselectedLabelColor: Colors.grey,
      indicatorColor: Colors.deepOrange,
      labelStyle: Theme.of(context).textTheme.titleLarge,
      unselectedLabelStyle: Theme.of(context).textTheme.titleLarge,
      tabs: tabsList,
    );
  }
}
