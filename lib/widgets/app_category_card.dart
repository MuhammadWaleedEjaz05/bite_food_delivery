import 'package:material_ui/material_ui.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:bite_food_delivery/widgets/app_bouncing_tap.dart';
import 'package:bite_food_delivery/widgets/app_text.dart';
import 'package:bite_food_delivery/widgets/app_network_image.dart';
import 'package:bite_food_delivery/app/theme/app_text_styles.dart';
import 'package:bite_food_delivery/core/extensions/theme_extensions.dart';

class AppCategoryCard extends StatelessWidget {
  const AppCategoryCard({
    super.key,
    required this.name,
    required this.imageUrl,
    required this.onTap,
  });

  final String name, imageUrl;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final dark = Theme.of(context).brightness == Brightness.dark;
    final displayName = name.trim().toLowerCase() == 'deserts'
        ? 'Desserts'
        : name;

    return AppBouncingTap(
      onTap: onTap,
      pressedScale: 0.93,
      child: Container(
        padding: EdgeInsets.fromLTRB(6.w, 5.h, 14.w, 5.h).r,
        decoration: BoxDecoration(
          color: dark
              ? const Color(0xFF1E1E26)
              : Colors.white,
          borderRadius: BorderRadius.circular(28).r,
          border: Border.all(
            color: dark
                ? Colors.white.withValues(alpha: 0.1)
                : const Color(0xFFEEEEEE),
            width: 1.r,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: dark ? 0.28 : 0.05),
              blurRadius: 10.r,
              offset: Offset(0, 3.h),
            ),
          ],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 36.r,
              height: 36.r,
              decoration: BoxDecoration(
                color: context.appColors.primary.withValues(alpha: 0.12),
                shape: BoxShape.circle,
                border: Border.all(
                  color: context.appColors.primary.withValues(alpha: 0.25),
                  width: 1.r,
                ),
              ),
              child: Center(
                child: AppNetworkImage(
                  url: imageUrl,
                  height: 24.r,
                  width: 24.r,
                  radius: 12,
                  fit: BoxFit.contain,
                ),
              ),
            ),
            10.horizontalSpace,
            Flexible(
              child: AppText(
                displayName,
                style: AppTextStyles.labelMedium(context).copyWith(
                  fontWeight: FontWeight.w800,
                  fontSize: 12.sp,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
