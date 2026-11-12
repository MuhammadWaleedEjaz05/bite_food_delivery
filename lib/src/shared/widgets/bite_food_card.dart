import 'package:bite_food_delivery/app/routes/app_navigation.dart';
import 'package:flutter/material.dart';
import 'package:bite_food_delivery/features/food_items/models/food_item_model.dart';
import 'package:bite_food_delivery/features/food_items/models/food_detail_arguments.dart';
import 'package:bite_food_delivery/widgets/app_food_card.dart';
import 'package:bite_food_delivery/l10n/app_localizations.dart';
import 'package:bite_food_delivery/core/extensions/price_format.dart';

class BiteFoodCard extends StatelessWidget {
  const BiteFoodCard({
    super.key,
    required this.foodItem,
    required this.restaurantName,
  });
  final FoodItemModel foodItem;
  final String restaurantName;
  @override
  Widget build(BuildContext context) => AppFoodCard(
    name: foodItem.name,
    subtitle: foodItem.category,
    price: context.priceLabel(foodItem.price),
    imageUrl: foodItem.images.firstOrNull ?? '',
    available: foodItem.isAvailable != false,
    availabilityLabel: AppLocalizations.of(context)!.itemUnavailable,
    onTap: () => AppNavigation.push(
      context,
      '/food_item_screen',
      arguments: FoodDetailArguments(
        item: foodItem,
        restaurantName: restaurantName,
      ),
    ),
  );
}
