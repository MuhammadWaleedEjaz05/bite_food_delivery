import 'package:material_ui/material_ui.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:bite_food_delivery/widgets/app_bouncing_tap.dart';
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
    child: AppBouncingTap(
      onTap: onTap,
      pressedScale: 0.96,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 4.h).r,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: EdgeInsets.all(7.r),
              decoration: BoxDecoration(
                color: context.appColors.primary.withValues(alpha: 0.12),
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.location_on_rounded,
                size: 18.r,
                color: context.appColors.primary,
              ),
            ),
            10.horizontalSpace,
            Flexible(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppText(
                    label,
                    style: AppTextStyles.labelSmall(context).copyWith(
                      color: context.appColors.onSurfaceVariant,
                      fontSize: 10.5.sp,
                      letterSpacing: 0.2,
                    ),
                    maxLines: 1,
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Flexible(
                        child: AppText(
                          address,
                          style: AppTextStyles.labelMedium(
                            context,
                          ).copyWith(fontWeight: FontWeight.w700),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      4.horizontalSpace,
                      Icon(
                        Icons.keyboard_arrow_down_rounded,
                        size: 16.r,
                        color: context.appColors.primary,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
