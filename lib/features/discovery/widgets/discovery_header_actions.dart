import 'package:flutter/material.dart';
import 'package:bite_food_delivery/l10n/app_localizations.dart';

class DiscoveryHeaderActions extends StatelessWidget {
  const DiscoveryHeaderActions({
    super.key,
    required this.savedOnly,
    required this.onTap,
  });
  final bool savedOnly;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) => IconButton(
    tooltip: savedOnly
        ? AppLocalizations.of(context)!.cart
        : AppLocalizations.of(context)!.favorites,
    onPressed: onTap,
    icon: Icon(savedOnly ? Icons.shopping_bag_outlined : Icons.favorite_border),
  );
}
