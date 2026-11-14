import 'package:bite_food_delivery/app/routes/app_navigation.dart';
import 'package:bite_food_delivery/core/extensions/responsive_extensions.dart';
import 'package:bite_food_delivery/features/profile/widgets/profile_menu_group.dart';
import 'package:bite_food_delivery/features/profile/widgets/profile_menu_tile.dart';
import 'package:bite_food_delivery/l10n/app_localizations.dart';
import 'package:material_ui/material_ui.dart';

import 'package:bite_food_delivery/app/theme/app_text_styles.dart';
import 'package:bite_food_delivery/core/extensions/theme_extensions.dart';
import 'package:bite_food_delivery/widgets/app_text.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileSupportMenuSection extends StatelessWidget {
  const ProfileSupportMenuSection({super.key});

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context)!;

    return SliverPadding(
      padding: context.contentInsets(bottom: 24),
      sliver: SliverToBoxAdapter(
        child: Column(
          children: [
            ProfileMenuGroup(
              children: [
                ProfileMenuTile(
                  icon: Icons.help_outline_rounded,
                  title: t.faqs,
                  onTap: () => AppNavigation.push(context, '/faq_screen'),
                ),
                ProfileMenuTile(
                  icon: Icons.settings_outlined,
                  title: t.settings,
                  onTap: () => AppNavigation.push(context, '/setting_screen'),
                ),
              ],
            ),
            24.verticalSpace,
            Center(
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 10.w,
                      vertical: 4.h,
                    ).r,
                    decoration: BoxDecoration(
                      color: context.appColors.primary.withValues(alpha: 0.08),
                      borderRadius: BorderRadius.circular(12).r,
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.fastfood_rounded,
                          size: 14.r,
                          color: context.appColors.primary,
                        ),
                        6.horizontalSpace,
                        AppText(
                          'Bite Food Delivery • v2.4.0',
                          style: AppTextStyles.labelSmall(context).copyWith(
                            color: context.appColors.primary,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ),
                  6.verticalSpace,
                  AppText(
                    'Crafted with ❤️ for food lovers',
                    style: AppTextStyles.labelSmall(context).copyWith(
                      color: context.appColors.onSurfaceVariant.withValues(
                        alpha: 0.7,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
