import 'package:bite_food_delivery/app/routes/app_navigation.dart';
import 'package:bite_food_delivery/app/theme/app_text_styles.dart';
import 'package:bite_food_delivery/core/extensions/theme_extensions.dart';
import 'package:bite_food_delivery/l10n/app_localizations.dart';
import 'package:bite_food_delivery/widgets/app_bouncing_tap.dart';
import 'package:bite_food_delivery/widgets/app_primary_button.dart';
import 'package:bite_food_delivery/widgets/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OrdersGuestCard extends StatelessWidget {
  const OrdersGuestCard({super.key});

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context)!;
    final dark = Theme.of(context).brightness == Brightness.dark;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h).r,
      child: Container(
        padding: EdgeInsets.all(24.r),
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
              color: Colors.black.withValues(alpha: dark ? 0.25 : 0.04),
              blurRadius: 18.r,
              offset: Offset(0, 6.h),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 76.r,
              height: 76.r,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    context.appColors.primary.withValues(alpha: 0.18),
                    context.appColors.primary.withValues(alpha: 0.05),
                  ],
                ),
                shape: BoxShape.circle,
                border: Border.all(
                  color: context.appColors.primary.withValues(alpha: 0.25),
                  width: 2.r,
                ),
              ),
              child: Icon(
                Icons.delivery_dining_rounded,
                size: 38.r,
                color: context.appColors.primary,
              ),
            ),
            18.verticalSpace,
            AppText(
              'Track Your Orders Live',
              style: AppTextStyles.titleMedium(
                context,
              ).copyWith(fontWeight: FontWeight.w800, fontSize: 18.sp),
              textAlign: TextAlign.center,
            ),
            8.verticalSpace,
            AppText(
              t.pleaseSignInToContinue,
              style: AppTextStyles.bodyMedium(
                context,
              ).copyWith(color: context.appColors.onSurfaceVariant),
              textAlign: TextAlign.center,
            ),
            20.verticalSpace,
            AppPrimaryButton(
              label: t.login,
              onTap: () => AppNavigation.push(context, '/login_screen'),
            ),
            12.verticalSpace,
            AppBouncingTap(
              onTap: () =>
                  AppNavigation.push(context, '/all_restaurants_screen'),
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(vertical: 13.h).r,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: context.appColors.surfaceContainerHighest.withValues(
                    alpha: 0.6,
                  ),
                  borderRadius: BorderRadius.circular(16).r,
                ),
                child: AppText(
                  t.browseRestaurants,
                  style: AppTextStyles.labelLarge(context).copyWith(
                    color: context.appColors.primary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            24.verticalSpace,
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _FeaturePill(icon: Icons.gps_fixed_rounded, label: 'Live GPS'),
                _FeaturePill(
                  icon: Icons.replay_rounded,
                  label: '1-Tap Reorder',
                ),
                _FeaturePill(
                  icon: Icons.receipt_long_rounded,
                  label: 'Past Receipts',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _FeaturePill extends StatelessWidget {
  const _FeaturePill({required this.icon, required this.label});
  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) => Container(
    padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 6.h).r,
    decoration: BoxDecoration(
      color: context.appColors.primary.withValues(alpha: 0.08),
      borderRadius: BorderRadius.circular(12).r,
    ),
    child: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 14.r, color: context.appColors.primary),
        5.horizontalSpace,
        AppText(
          label,
          style: AppTextStyles.labelSmall(context).copyWith(
            color: context.appColors.primary,
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    ),
  );
}
