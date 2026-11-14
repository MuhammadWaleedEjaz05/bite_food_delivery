import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:material_ui/material_ui.dart';
import 'package:bite_food_delivery/features/food_items/sections/food_header_section.dart';
import 'package:bite_food_delivery/features/food_items/sections/food_hero_section.dart';
import 'package:bite_food_delivery/features/food_items/sections/food_info_section.dart';
import 'package:bite_food_delivery/features/food_items/sections/food_size_section.dart';
import 'package:bite_food_delivery/features/food_items/sections/food_flavor_section.dart';
import 'package:bite_food_delivery/features/food_items/sections/food_purchase_section.dart';

class FoodItemScreen extends StatelessWidget {
  const FoodItemScreen({super.key});
  @override
  Widget build(BuildContext context) => Scaffold(
    body: SafeArea(
      bottom: false,
      child: CustomScrollView(
        key: const PageStorageKey('food_item-detail'),
        physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
        slivers: [
          const FoodHeaderSection(),
          const FoodHeroSection(),
          const FoodInfoSection(),
          const FoodSizeSection(),
          const FoodFlavorSection(),
          SliverToBoxAdapter(child: 120.verticalSpace),
        ],
      ),
    ),
    bottomNavigationBar: const FoodPurchaseSection(),
  );
}
