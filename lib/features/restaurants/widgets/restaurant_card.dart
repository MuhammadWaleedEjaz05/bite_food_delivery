import 'package:bite_food_delivery/app/routes/app_navigation.dart';
import 'package:bite_food_delivery/features/restaurants/models/restaurants_model.dart';
import 'package:bite_food_delivery/widgets/app_restaurant_card.dart';
import 'package:bite_food_delivery/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class RestaurantCard extends StatelessWidget {
  const RestaurantCard({
    super.key,
    required this.restaurant,
    this.favouriteButton,
  });
  final RestaurantModel restaurant;
  final Widget? favouriteButton;
  @override
  Widget build(BuildContext context) => AppRestaurantCard(
    name: restaurant.name,
    imageUrl: restaurant.logoUrl,
    category: restaurant.category,
    favouriteButton: favouriteButton,
    rating: NumberFormat.decimalPatternDigits(
      locale: Localizations.localeOf(context).toString(),
      decimalDigits: 1,
    ).format(restaurant.rating),
    deliveryTime: AppLocalizations.of(
      context,
    )!.deliveryMinutes(restaurant.deliveryTime.round()),
    deliveryFee: NumberFormat.simpleCurrency(
      locale: Localizations.localeOf(context).toString(),
      name: 'PKR',
    ).format(restaurant.deliveryFee),
    onTap: () => AppNavigation.push(
      context,
      '/restaurant_screen',
      arguments: restaurant,
    ),
  );
}

// Backward-compatibility alias
typedef BiteRestaurantCard = RestaurantCard;

