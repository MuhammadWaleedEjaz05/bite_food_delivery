import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:bite_food_delivery/features/home/widgets/home_search_button.dart';
import 'package:bite_food_delivery/l10n/app_localizations.dart';

class BiteSearchBar extends StatelessWidget {
  const BiteSearchBar({super.key});
  @override
  Widget build(BuildContext context) => HomeSearchButton(
    label: AppLocalizations.of(context)!.searchForRestaurantsOrDishes,
    onTap: () => context.go('/discover'),
  );
}
