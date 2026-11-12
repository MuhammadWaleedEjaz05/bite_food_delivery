import 'package:bite_food_delivery/app/routes/app_navigation.dart';
import 'package:bite_food_delivery/core/extensions/responsive_extensions.dart';
import 'package:bite_food_delivery/features/profile/widgets/profile_menu_group.dart';
import 'package:bite_food_delivery/features/profile/widgets/profile_menu_tile.dart';
import 'package:bite_food_delivery/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

class ProfileSupportMenuSection extends StatelessWidget {
  const ProfileSupportMenuSection({super.key});

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context)!;

    return SliverPadding(
      padding: context.contentInsets(bottom: 16),
      sliver: SliverToBoxAdapter(
        child: ProfileMenuGroup(
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
      ),
    );
  }
}
