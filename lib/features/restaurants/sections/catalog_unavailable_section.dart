import 'package:flutter/material.dart';
import 'package:bite_food_delivery/l10n/app_localizations.dart';
import 'package:bite_food_delivery/widgets/app_feedback.dart';

class CatalogUnavailableSection extends StatelessWidget {
  const CatalogUnavailableSection({super.key});
  @override
  Widget build(BuildContext context) => SliverToBoxAdapter(
    child: AppFeedback(message: AppLocalizations.of(context)!.catalogMissing),
  );
}
