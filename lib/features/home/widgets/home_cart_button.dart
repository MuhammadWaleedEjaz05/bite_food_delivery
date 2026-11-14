import 'package:material_ui/material_ui.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:bite_food_delivery/widgets/app_bouncing_tap.dart';
import 'package:bite_food_delivery/widgets/app_text.dart';
import 'package:bite_food_delivery/app/theme/app_text_styles.dart';
import 'package:bite_food_delivery/core/extensions/theme_extensions.dart';

class HomeCartButton extends StatelessWidget {
  const HomeCartButton({
    super.key,
    required this.count,
    required this.label,
    required this.onTap,
  });

  final int count;
  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) => Padding(
    padding: EdgeInsetsDirectional.only(end: 16.r),
    child: AppBouncingTap(
      onTap: onTap,
      pressedScale: 0.9,
      child: Semantics(
        label: label,
        button: true,
        child: Container(
          width: 42.r,
          height: 42.r,
          decoration: BoxDecoration(
            color: context.appColors.surfaceContainerHighest.withValues(
              alpha: 0.7,
            ),
            borderRadius: BorderRadius.circular(14).r,
            border: Border.all(
              color: context.appColors.outlineVariant.withValues(alpha: 0.35),
              width: 1.r,
            ),
          ),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Icon(
                Icons.shopping_bag_outlined,
                size: 20.r,
                color: context.appColors.onSurface,
              ),
              if (count > 0)
                Positioned(
                  top: 6.r,
                  right: 6.r,
                  child: Container(
                    padding: EdgeInsets.all(4.r),
                    decoration: BoxDecoration(
                      color: context.appColors.primary,
                      shape: BoxShape.circle,
                    ),
                    constraints: BoxConstraints(
                      minWidth: 16.r,
                      minHeight: 16.r,
                    ),
                    child: Center(
                      child: AppText(
                        '$count',
                        style: AppTextStyles.labelSmall(context).copyWith(
                          color: context.appColors.onPrimary,
                          fontSize: 9.sp,
                          height: 1.0,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    ),
  );
}
