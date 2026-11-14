import 'package:material_ui/material_ui.dart';
import 'package:bite_food_delivery/l10n/app_localizations.dart';
import 'package:bite_food_delivery/widgets/custom_app_bar.dart';
import 'package:bite_food_delivery/widgets/app_text.dart';
import 'package:bite_food_delivery/app/theme/app_text_styles.dart';
import 'package:bite_food_delivery/app/routes/app_navigation.dart';
import '../widgets/discovery_header_actions.dart';

class DiscoveryHeaderSection extends StatelessWidget {
  const DiscoveryHeaderSection({super.key, this.savedOnly = false});
  final bool savedOnly;
  @override
  Widget build(BuildContext context) => CustomSliverAppBar(
    showBack: savedOnly || Navigator.of(context).canPop(),
    title: AppText(
      savedOnly
          ? AppLocalizations.of(context)!.favorites
          : AppLocalizations.of(context)!.discoverTab,
      style: AppTextStyles.headlineMedium(context),
    ),
    actions: [
      DiscoveryHeaderActions(
        savedOnly: savedOnly,
        onTap: () => AppNavigation.push(
          context,
          savedOnly ? '/cart_screen' : '/favourite',
        ),
      ),
    ],
  );
}
