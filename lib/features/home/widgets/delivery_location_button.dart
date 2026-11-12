import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:bite_food_delivery/widgets/app_text.dart';
import 'package:bite_food_delivery/app/theme/app_text_styles.dart';
import 'package:bite_food_delivery/core/extensions/theme_extensions.dart';

class DeliveryLocationButton extends StatelessWidget {
  const DeliveryLocationButton({
    super.key,
    required this.label,
    required this.address,
    required this.onTap,
  });
  final String label, address;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) => Semantics(
    button: true,
    child: InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12).r,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8).r,
        child: Row(
          children: [
            Icon(
              Icons.location_on_outlined,
              size: 24.r,
              color: context.appColors.primary,
            ),
            10.horizontalSpace,
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppText(
                    label,
                    style: AppTextStyles.labelSmall(
                      context,
                    ).copyWith(color: context.appColors.onSurfaceVariant),
                    maxLines: 1,
                  ),
                  AppText(
                    address,
                    style: AppTextStyles.labelLarge(context),
                    maxLines: 1,
                  ),
                ],
              ),
            ),
            Icon(Icons.keyboard_arrow_down_rounded, size: 20.r),
          ],
        ),
      ),
    ),
  );
}
