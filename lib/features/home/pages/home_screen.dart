import 'package:material_ui/material_ui.dart';
import 'package:bite_food_delivery/features/home/sections/home_header_section.dart';
import 'package:bite_food_delivery/features/home/sections/home_intro_section.dart';
import 'package:bite_food_delivery/features/home/sections/home_search_section.dart';
import 'package:bite_food_delivery/features/home/sections/home_categories_section.dart';
import 'package:bite_food_delivery/features/home/sections/home_restaurants_section.dart';
import 'package:bite_food_delivery/features/home/sections/home_refresh_section.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) => const Scaffold(
    body: SafeArea(
      child: CustomScrollView(
        key: PageStorageKey('home'),
        physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
        slivers: [
          HomeHeaderSection(),
          HomeRefreshSection(),
          HomeIntroSection(),
          HomeSearchSection(),
          HomeCategoriesSection(),
          HomeRestaurantsSection(),
        ],
      ),
    ),
  );
}
