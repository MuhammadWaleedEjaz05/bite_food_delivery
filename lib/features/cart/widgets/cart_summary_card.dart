import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:bite_food_delivery/widgets/app_text.dart';
import 'package:bite_food_delivery/app/theme/app_text_styles.dart';
import 'package:bite_food_delivery/core/extensions/theme_extensions.dart';

class CartSummaryCard extends StatelessWidget {
  const CartSummaryCard({
    super.key,
    required this.label,
    required this.amount,
    required this.note,
  });
  final String label, amount, note;
  @override
  Widget build(BuildContext context) => Container(
    padding: const EdgeInsets.all(20).r,
    decoration: BoxDecoration(
      color: context.appColors.surfaceContainerLow,
      borderRadius: BorderRadius.circular(24).r,
      border: Border.all(
        color: context.appColors.outlineVariant.withValues(alpha: 0.6),
        width: 1,
      ),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withValues(alpha: 0.03),
          blurRadius: 10.r,
          offset: Offset(0, 4.r),
        ),
      ],
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Wrap(
          spacing: 20.r,
          runSpacing: 8.r,
          children: [
            AppText(label, style: AppTextStyles.titleMedium(context)),
            AppText(amount, style: AppTextStyles.titleLarge(context)),
          ],
        ),
        12.verticalSpace,
        AppText(note, style: AppTextStyles.bodyMedium(context)),
      ],
    ),
  );
}
