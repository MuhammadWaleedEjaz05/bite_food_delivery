import 'package:material_ui/material_ui.dart';
import 'package:bite_food_delivery/widgets/custom_app_bar.dart';
import 'package:bite_food_delivery/widgets/app_text.dart';
import 'package:bite_food_delivery/app/theme/app_text_styles.dart';
import 'package:bite_food_delivery/l10n/app_localizations.dart';

class CheckoutHeaderSection extends StatelessWidget {
  const CheckoutHeaderSection({super.key});
  @override
  Widget build(BuildContext context) => CustomSliverAppBar(
    showBack: true,
    title: AppText(
      AppLocalizations.of(context)!.checkout,
      style: AppTextStyles.headlineMedium(context),
    ),
  );
}
