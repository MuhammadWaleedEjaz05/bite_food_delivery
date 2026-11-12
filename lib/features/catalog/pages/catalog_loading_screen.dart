import 'package:flutter/material.dart';
import 'package:bite_food_delivery/features/restaurants/sections/catalog_unavailable_header_section.dart';
import '../sections/catalog_loading_section.dart';

class CatalogLoadingScreen extends StatelessWidget {
  const CatalogLoadingScreen({super.key, required this.id, required this.food});
  final String id;
  final bool food;
  @override
  Widget build(BuildContext context) => Scaffold(
    body: SafeArea(
      child: CustomScrollView(
        physics: const BouncingScrollPhysics(
          parent: AlwaysScrollableScrollPhysics(),
        ),
        slivers: [
          const CatalogUnavailableHeaderSection(),
          CatalogLoadingSection(id: id, food: food),
        ],
      ),
    ),
  );
}
