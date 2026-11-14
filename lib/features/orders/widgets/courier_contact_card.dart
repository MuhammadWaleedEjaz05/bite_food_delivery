import 'package:bite_food_delivery/app/theme/app_text_styles.dart';
import 'package:bite_food_delivery/core/extensions/theme_extensions.dart';
import 'package:bite_food_delivery/l10n/app_localizations.dart';
import 'package:bite_food_delivery/widgets/app_text.dart';
import 'package:material_ui/material_ui.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CourierContactCard extends StatelessWidget {
  final String name;
  final String phone;
  final VoidCallback onCall;

  const CourierContactCard({
    super.key,
    required this.name,
    required this.phone,
    required this.onCall,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.appColors;
    final t = AppLocalizations.of(context)!;
    return Material(
      color: colors.surfaceContainerLow,
      borderRadius: BorderRadius.circular(20).r,
      child: Container(
        padding: const EdgeInsets.all(16).r,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20).r,
          border: Border.all(color: colors.outlineVariant, width: 1),
        ),
        child: Row(
          children: [
            Container(
              width: 48.r,
              height: 48.r,
              decoration: BoxDecoration(
                color: colors.primary.withValues(alpha: 0.12),
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.delivery_dining_rounded,
                size: 26.r,
                color: colors.primary,
              ),
            ),
            14.horizontalSpace,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppText(name, style: AppTextStyles.titleMedium(context)),
                  4.verticalSpace,
                  AppText(
                    t.deliveryRider,
                    style: AppTextStyles.bodyMedium(
                      context,
                    ).copyWith(color: colors.onSurfaceVariant),
                  ),
                ],
              ),
            ),
            Material(
              color: colors.primary,
              shape: const CircleBorder(),
              child: InkWell(
                customBorder: const CircleBorder(),
                onTap: onCall,
                child: Padding(
                  padding: const EdgeInsets.all(12).r,
                  child: Icon(
                    Icons.phone_rounded,
                    color: colors.onPrimary,
                    size: 20.r,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
