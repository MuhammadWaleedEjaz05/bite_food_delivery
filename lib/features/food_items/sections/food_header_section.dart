import 'package:material_ui/material_ui.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bite_food_delivery/widgets/app_text.dart';
import 'package:bite_food_delivery/app/theme/app_text_styles.dart';
import 'package:bite_food_delivery/features/food_items/bloc/food_details_cubit.dart';

import 'package:bite_food_delivery/widgets/custom_app_bar.dart';
import 'package:bite_food_delivery/features/favourites/sections/catalog_favourite_section.dart';

class FoodHeaderSection extends StatelessWidget {
  const FoodHeaderSection({super.key});
  @override
  Widget build(BuildContext context) {
    final cubit = context.read<FoodDetailsCubit>();
    final item = cubit.arguments.item;
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
          food: true,
          initialValue: item.isFavorite ?? false,
        ),
      ],
    );
  }
}
