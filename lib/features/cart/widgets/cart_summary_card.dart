import 'package:material_ui/material_ui.dart';
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
        // Free Delivery Unlock Progress Banner
        Container(
          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h).r,
          decoration: BoxDecoration(
            color: context.appColors.primary.withValues(alpha: 0.08),
            borderRadius: BorderRadius.circular(16).r,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.bolt_rounded,
                    size: 16.r,
                    color: context.appColors.primary,
                  ),
                  6.horizontalSpace,
                  Flexible(
                    child: AppText(
                      'Free Express Delivery Unlocked!',
                      style: AppTextStyles.labelSmall(context).copyWith(
                        fontWeight: FontWeight.w800,
                        color: context.appColors.primary,
                        fontSize: 11.sp,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
              8.verticalSpace,
              ClipRRect(
                borderRadius: BorderRadius.circular(6).r,
                child: LinearProgressIndicator(
                  value: 0.85,
                  minHeight: 5.h,
                  backgroundColor:
                      context.appColors.primary.withValues(alpha: 0.15),
                  valueColor:
                      AlwaysStoppedAnimation(context.appColors.primary),
                ),
              ),
            ],
          ),
        ),
        16.verticalSpace,
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
