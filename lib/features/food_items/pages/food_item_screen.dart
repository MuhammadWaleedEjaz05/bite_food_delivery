import 'package:flutter/material.dart';
import 'package:bite_food_delivery/features/food_items/sections/food_header_section.dart';
import 'package:bite_food_delivery/features/food_items/sections/food_hero_section.dart';
import 'package:bite_food_delivery/features/food_items/sections/food_info_section.dart';
import 'package:bite_food_delivery/features/food_items/sections/food_size_section.dart';
import 'package:bite_food_delivery/features/food_items/sections/food_flavor_section.dart';
import 'package:bite_food_delivery/features/food_items/sections/food_quantity_section.dart';
import 'package:bite_food_delivery/features/food_items/sections/food_purchase_section.dart';

class FoodItemScreen extends StatelessWidget {
  const FoodItemScreen({super.key});
  @override
  Widget build(BuildContext context) => const Scaffold(
    body: SafeArea(
      bottom: false,
      child: CustomScrollView(
        key: PageStorageKey('food_item-detail'),
        physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
        slivers: [
          FoodHeaderSection(),
          FoodHeroSection(),
          FoodInfoSection(),
          FoodSizeSection(),
          FoodFlavorSection(),
          FoodQuantitySection(),
        ],
      ),
    ),
    bottomNavigationBar: FoodPurchaseSection(),
  );
}
