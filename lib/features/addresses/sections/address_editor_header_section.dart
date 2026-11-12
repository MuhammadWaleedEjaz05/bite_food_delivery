import 'package:bite_food_delivery/app/theme/app_text_styles.dart';
import 'package:bite_food_delivery/l10n/app_localizations.dart';
import 'package:bite_food_delivery/widgets/app_text.dart';
import 'package:bite_food_delivery/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';

class AddressEditorHeaderSection extends StatelessWidget {
  final bool isUpdate;

  const AddressEditorHeaderSection({super.key, required this.isUpdate});

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context)!;
    return CustomSliverAppBar(
      showBack: true,
      title: AppText(
        isUpdate ? t.updateAddress : t.addAddress,
        style: AppTextStyles.titleMedium(context),
      ),
    );
  }
}
