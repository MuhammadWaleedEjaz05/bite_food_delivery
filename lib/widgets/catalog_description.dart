import 'package:material_ui/material_ui.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:bite_food_delivery/widgets/app_text.dart';
import 'package:bite_food_delivery/app/theme/app_text_styles.dart';
import 'package:bite_food_delivery/core/extensions/theme_extensions.dart';

class CatalogDescription extends StatelessWidget {
  const CatalogDescription({
    super.key,
    required this.title,
    required this.subtitle,
    required this.description,
  });
  final String title, subtitle, description;
  @override
  Widget build(BuildContext context) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      AppText(
        subtitle,
        style: AppTextStyles.labelLarge(
          context,
        ).copyWith(color: context.appColors.primary),
      ),
      8.verticalSpace,
      AppText(title, style: AppTextStyles.headlineMedium(context)),
      if (description.isNotEmpty) ...[
        12.verticalSpace,
        AppText(
          description,
          style: AppTextStyles.bodyMedium(
            context,
          ).copyWith(color: context.appColors.onSurfaceVariant),
        ),
      ],
    ],
  );
}
