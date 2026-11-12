import 'package:flutter/material.dart';
import 'package:bite_food_delivery/l10n/app_localizations.dart';
import 'package:bite_food_delivery/widgets/app_text.dart';
import 'package:bite_food_delivery/widgets/custom_app_bar.dart';
import 'package:bite_food_delivery/app/theme/app_text_styles.dart';

class CatalogUnavailableHeaderSection extends StatelessWidget {
  const CatalogUnavailableHeaderSection({super.key});
  @override
  Widget build(BuildContext context) => CustomSliverAppBar(
    showBack: true,
    title: AppText(
      AppLocalizations.of(context)!.restaurants,
      style: AppTextStyles.titleMedium(context),
    ),
  );
}
