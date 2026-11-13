import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:bite_food_delivery/core/extensions/theme_extensions.dart';
import 'package:bite_food_delivery/widgets/app_text.dart';
import 'package:bite_food_delivery/app/theme/app_text_styles.dart';

class FoodDetailsCourierSnippet extends StatelessWidget {
  const FoodDetailsCourierSnippet({
    super.key,
    this.courierName = 'Alice Johnson',
    this.courierRole = 'Delivery Man',
  });

  final String courierName;
  final String courierRole;

  @override
  Widget build(BuildContext context) {
    final colors = context.appColors;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h).r,
      decoration: BoxDecoration(
        color: isDark ? const Color(0xFF22222A) : Colors.white,
        borderRadius: BorderRadius.circular(20).r,
        border: Border.all(
          color: colors.outlineVariant.withValues(alpha: isDark ? 0.2 : 0.35),
          width: 1.r,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: isDark ? 0.2 : 0.04),
            blurRadius: 10.r,
            offset: Offset(0, 3.h),
          ),
        ],
      ),
      child: Wrap(
        alignment: WrapAlignment.spaceBetween,
        crossAxisAlignment: WrapCrossAlignment.center,
        spacing: 8.r,
        runSpacing: 8.r,
        children: [
          ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 0.58.sw),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                CircleAvatar(
                  radius: 18.r,
                  backgroundColor: colors.primary.withValues(alpha: 0.12),
                  child: Icon(
                    Icons.delivery_dining_rounded,
                    size: 20.r,
                    color: colors.primary,
                  ),
                ),
                10.horizontalSpace,
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      AppText(
                        courierName,
                        style: AppTextStyles.labelMedium(
                          context,
                        ).copyWith(fontWeight: FontWeight.bold),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      AppText(
                        courierRole,
                        style: AppTextStyles.bodySmall(context).copyWith(
                          color: colors.onSurfaceVariant,
                          fontSize: 11.sp,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: EdgeInsets.all(7.r),
                decoration: BoxDecoration(
                  color: colors.surfaceContainerHighest.withValues(alpha: 0.6),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.chat_bubble_outline_rounded,
                  size: 15.r,
                  color: colors.onSurfaceVariant,
                ),
              ),
              8.horizontalSpace,
              Container(
                padding: EdgeInsets.all(7.r),
                decoration: BoxDecoration(
                  color: colors.primary.withValues(alpha: 0.12),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.phone_rounded,
                  size: 15.r,
                  color: colors.primary,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
