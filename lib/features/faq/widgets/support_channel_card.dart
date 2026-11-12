import 'package:bite_food_delivery/app/theme/app_text_styles.dart';
import 'package:bite_food_delivery/core/extensions/theme_extensions.dart';
import 'package:bite_food_delivery/widgets/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SupportChannelCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  const SupportChannelCard({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.appColors;

    return Material(
      color: colors.surfaceContainerLow,
      borderRadius: BorderRadius.circular(16).r,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16).r,
        child: Container(
          padding: const EdgeInsets.all(16).r,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16).r,
            border: Border.all(color: colors.outlineVariant, width: 1),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: const EdgeInsets.all(10).r,
                decoration: BoxDecoration(
                  color: colors.primary.withValues(alpha: 0.12),
                  shape: BoxShape.circle,
                ),
                child: Icon(icon, color: colors.primary, size: 22.r),
              ),
              10.verticalSpace,
              AppText(
                title,
                style: AppTextStyles.labelLarge(
                  context,
                ).copyWith(fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              4.verticalSpace,
              AppText(
                subtitle,
                style: AppTextStyles.labelSmall(
                  context,
                ).copyWith(color: colors.onSurfaceVariant),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
