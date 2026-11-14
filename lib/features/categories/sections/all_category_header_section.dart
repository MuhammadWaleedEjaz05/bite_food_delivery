import 'package:bite_food_delivery/app/theme/app_text_styles.dart';
import 'package:bite_food_delivery/l10n/app_localizations.dart';
import 'package:bite_food_delivery/widgets/app_text.dart';
import 'package:bite_food_delivery/widgets/custom_app_bar.dart';
import 'package:material_ui/material_ui.dart';

class AllCategoryHeaderSection extends StatelessWidget {
  const AllCategoryHeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomSliverAppBar(
      showBack: true,
      title: AppText(
        AppLocalizations.of(context)!.allCategories,
        style: AppTextStyles.titleMedium(context),
      ),
    );
  }
}
