import 'package:bite_food_delivery/app/routes/app_navigation.dart';
import 'package:bite_food_delivery/core/extensions/responsive_extensions.dart';
import 'package:bite_food_delivery/l10n/app_localizations.dart';
import 'package:bite_food_delivery/widgets/app_primary_button.dart';
import 'package:material_ui/material_ui.dart';

class AddressActionSection extends StatelessWidget {
  const AddressActionSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Padding(
        padding: context.contentInsets(top: 12, bottom: 12),
        child: AppPrimaryButton(
          label: AppLocalizations.of(context)!.addAddress,
          onTap: () => AppNavigation.push(context, '/add_address_screen'),
        ),
      ),
    );
  }
}
