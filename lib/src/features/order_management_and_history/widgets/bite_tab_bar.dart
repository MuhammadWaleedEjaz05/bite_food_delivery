import 'package:bite_food_delivery/src/features/order_management_and_history/models/order_history_tab_list.dart';
import 'package:flutter/material.dart';

class BiteTabBar extends StatelessWidget {
  const BiteTabBar({super.key});

  @override
  Widget build(BuildContext context) {
    return TabBar(
      labelColor: Theme.of(context).colorScheme.primary,
      unselectedLabelColor: Theme.of(context).colorScheme.secondary,
      indicatorColor: Theme.of(context).colorScheme.primary,
      labelStyle: Theme.of(context).textTheme.titleLarge,
      unselectedLabelStyle: Theme.of(context).textTheme.titleLarge,
      tabs: getTabsList(context),
    );
  }
}
