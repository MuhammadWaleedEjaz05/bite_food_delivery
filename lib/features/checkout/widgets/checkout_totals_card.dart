import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:bite_food_delivery/widgets/app_text.dart';
import 'package:bite_food_delivery/app/theme/app_text_styles.dart';
import 'package:bite_food_delivery/core/extensions/theme_extensions.dart';

class CheckoutTotalsCard extends StatelessWidget {
  const CheckoutTotalsCard({super.key, required this.rows});
  final Map<String, String> rows;
  @override
  Widget build(BuildContext context) => Container(
    padding: const EdgeInsets.all(20).r,
    decoration: BoxDecoration(
      color: context.appColors.surfaceContainerLow,
      borderRadius: BorderRadius.circular(24).r,
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        for (final row in rows.entries)
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8).r,
            child: Wrap(
              spacing: 16.r,
              runSpacing: 6.r,
              alignment: WrapAlignment.spaceBetween,
              children: [
                AppText(row.key, style: AppTextStyles.bodyMedium(context)),
                AppText(row.value, style: AppTextStyles.titleMedium(context)),
              ],
            ),
          ),
      ],
    ),
  );
}
