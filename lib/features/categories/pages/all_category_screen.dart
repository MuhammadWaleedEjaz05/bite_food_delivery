import 'package:bite_food_delivery/features/categories/sections/all_category_grid_section.dart';
import 'package:bite_food_delivery/features/categories/sections/all_category_header_section.dart';
import 'package:flutter/material.dart';

class AllCategoryScreen extends StatelessWidget {
  const AllCategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          key: PageStorageKey('all_category_screen'),
          physics: BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics(),
          ),
          slivers: [AllCategoryHeaderSection(), AllCategoryGridSection()],
        ),
      ),
    );
  }
}
