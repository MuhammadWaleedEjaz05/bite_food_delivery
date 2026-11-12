import 'package:bite_food_delivery/features/discovery/sections/discovery_refresh_section.dart';
import 'package:flutter/material.dart';
import 'package:bite_food_delivery/features/discovery/sections/discovery_header_section.dart';
import 'package:bite_food_delivery/features/discovery/sections/discovery_search_section.dart';
import 'package:bite_food_delivery/features/discovery/sections/discovery_filters_section.dart';
import 'package:bite_food_delivery/features/discovery/sections/discovery_recent_section.dart';
import 'package:bite_food_delivery/features/discovery/sections/discovery_status_section.dart';
import 'package:bite_food_delivery/features/discovery/sections/discovery_restaurants_section.dart';
import 'package:bite_food_delivery/features/discovery/sections/discovery_foods_section.dart';
import 'package:bite_food_delivery/features/discovery/sections/discovery_more_section.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key});
  @override
  Widget build(BuildContext context) => const Scaffold(
    body: SafeArea(
      child: CustomScrollView(
        key: PageStorageKey('favourites'),
        physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
        slivers: [
          DiscoveryHeaderSection(savedOnly: true),
          DiscoveryRefreshSection(),
          DiscoverySearchSection(),
          DiscoveryFiltersSection(),
          DiscoveryRecentSection(),
          DiscoveryStatusSection(savedOnly: true),
          DiscoveryRestaurantsSection(savedOnly: true),
          DiscoveryFoodsSection(savedOnly: true),
          DiscoveryMoreSection(savedOnly: true),
        ],
      ),
    ),
  );
}
