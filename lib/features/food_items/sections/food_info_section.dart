import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bite_food_delivery/core/extensions/responsive_extensions.dart';
import 'package:bite_food_delivery/features/food_items/bloc/food_details_cubit.dart';

import 'package:bite_food_delivery/widgets/catalog_description.dart';

class FoodInfoSection extends StatelessWidget {
  const FoodInfoSection({super.key});
  @override
  Widget build(BuildContext context) {
    final cubit = context.read<FoodDetailsCubit>();
    final item = cubit.arguments.item;
    return SliverPadding(
      padding: context.contentInsets(bottom: 24),
      sliver: SliverToBoxAdapter(
        child: CatalogDescription(
          title: item.name,
          subtitle: cubit.arguments.restaurantName,
          description: item.description,
        ),
      ),
    );
  }
}
