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
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 6.h).r,
        decoration: BoxDecoration(
          color: context.appColors.surfaceContainerLow,
          borderRadius: BorderRadius.circular(24).r,
          border: Border.all(
            color: context.appColors.outlineVariant.withValues(
              alpha: dark ? 0.25 : 0.45,
            ),
            width: 1.r,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: dark ? 0.22 : 0.03),
              blurRadius: 10.r,
              offset: Offset(0, 3.h),
            ),
          ],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: EdgeInsets.all(2.r),
              decoration: BoxDecoration(
                color: context.appColors.primary.withValues(alpha: 0.1),
                shape: BoxShape.circle,
              ),
              child: AppNetworkImage(
                url: imageUrl,
                height: 32.r,
                width: 32.r,
                radius: 16,
              ),
            ),
            8.horizontalSpace,
            AppText(
              displayName,
              style: AppTextStyles.labelMedium(
                context,
              ).copyWith(fontWeight: FontWeight.w700),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            4.horizontalSpace,
          ],
        ),
      ),
    );
  }
}
