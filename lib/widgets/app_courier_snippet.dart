import 'package:bite_food_delivery/app/theme/app_text_styles.dart';
import 'package:bite_food_delivery/core/extensions/theme_extensions.dart';
import 'package:bite_food_delivery/widgets/app_text.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:material_ui/material_ui.dart';

class AppCourierSnippet extends StatelessWidget {
  const AppCourierSnippet({
    super.key,
    this.courierName = 'Alice Johnson',
    this.courierRole = 'Delivery Man',
    this.onCall,
    this.onMessage,
  });

  final String courierName;
  final String courierRole;
  final VoidCallback? onCall;
  final VoidCallback? onMessage;

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
                        style: AppTextStyles.labelLarge(context).copyWith(
                          fontWeight: FontWeight.bold,
                          color: colors.onSurface,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      2.verticalSpace,
                      AppText(
                        courierRole,
                        style: AppTextStyles.labelSmall(context).copyWith(
                          color: colors.onSurfaceVariant,
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
              _ActionCircleButton(
                icon: Icons.chat_bubble_outline_rounded,
                onTap: onMessage,
              ),
              8.horizontalSpace,
              _ActionCircleButton(
                icon: Icons.phone_outlined,
                onTap: onCall,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _ActionCircleButton extends StatelessWidget {
  const _ActionCircleButton({
    required this.icon,
    this.onTap,
  });

  final IconData icon;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final colors = context.appColors;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(20).r,
        child: Container(
          width: 36.r,
          height: 36.r,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: isDark ? const Color(0xFF2C2C36) : const Color(0xFFF4F5F8),
            border: Border.all(
              color: colors.outlineVariant.withValues(alpha: 0.25),
              width: 1.r,
            ),
          ),
          child: Icon(
            icon,
            size: 17.r,
            color: colors.onSurface,
          ),
        ),
      ),
    );
  }
}

