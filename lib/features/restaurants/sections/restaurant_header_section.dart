import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bite_food_delivery/widgets/app_text.dart';
import 'package:bite_food_delivery/app/theme/app_text_styles.dart';
import 'package:bite_food_delivery/features/restaurants/bloc/restaurant_menu_cubit.dart';

import 'package:bite_food_delivery/widgets/custom_app_bar.dart';
import 'package:bite_food_delivery/features/favourites/sections/catalog_favourite_section.dart';

class RestaurantHeaderSection extends StatelessWidget {
  const RestaurantHeaderSection({super.key});
  @override
  Widget build(BuildContext context) {
    final cubit = context.read<RestaurantMenuCubit>();
    final item = cubit.restaurant;
    return CustomSliverAppBar(
      showBack: true,
      title: AppText(
        item.name,
        style: AppTextStyles.titleMedium(context),
        maxLines: 1,
      ),
      actions: [
        CatalogFavouriteSection(
          id: item.id,
          food: false,
          initialValue: item.isFavorite,
        ),
      ],
    );
  }
}
