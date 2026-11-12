import 'package:bite_food_delivery/features/restaurants/sections/catalog_unavailable_header_section.dart';
import 'package:flutter/material.dart';
import 'package:bite_food_delivery/features/restaurants/sections/catalog_unavailable_section.dart';

class CatalogUnavailableScreen extends StatelessWidget {
  const CatalogUnavailableScreen({super.key});
  @override
  Widget build(BuildContext context) => const Scaffold(
    body: SafeArea(
      child: CustomScrollView(
        physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
        slivers: [
          CatalogUnavailableHeaderSection(),
          CatalogUnavailableSection(),
        ],
      ),
    ),
  );
}
