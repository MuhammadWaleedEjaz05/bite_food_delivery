import 'package:bite_food_delivery/app/routes/app_navigation.dart';
import 'package:material_ui/material_ui.dart';
import 'package:bite_food_delivery/l10n/app_localizations.dart';
import 'package:bite_food_delivery/core/extensions/responsive_extensions.dart';

import 'package:bite_food_delivery/widgets/app_primary_button.dart';

class RestaurantCartSection extends StatelessWidget {
  const RestaurantCartSection({super.key});
  @override
  Widget build(BuildContext context) => SafeArea(
    top: false,
    child: Padding(
      padding: context.contentInsets(top: 12, bottom: 12),
      child: AppPrimaryButton(
        label: AppLocalizations.of(context)!.viewCartAction,
        onTap: () => AppNavigation.push(context, '/cart_screen'),
      ),
    ),
  );
}
