import 'package:bite_food_delivery/GlobalWidgets/bite_app_bar.dart';
import 'package:bite_food_delivery/GlobalWidgets/bite_menu_section.dart';
import 'package:bite_food_delivery/Screens/SettingPage/Widgets/bite_setting_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: _AppBarSection(),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 15.w),
        children: [
          _PreferencesSection(),
          30.verticalSpace,
          _VersionSection(),
          30.verticalSpace,
        ],
      ),
    );
  }
}

class _PreferencesSection extends StatelessWidget {
  const _PreferencesSection();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 15.w, bottom: 10.h),
          child: Text(
            'PREFERENCES',
            style: Theme.of(context).textTheme.bodySmall!.copyWith(
              fontWeight: FontWeight.w600,
              color: Theme.of(context).colorScheme.onSecondary,
              letterSpacing: 1.2,
            ),
          ),
        ),
        BiteMenuSection(
          menuItems: [
            BiteSettingItem(
              item: BiteSettingItemModel(
                icon: Icons.notifications_outlined,
                iconColor: Theme.of(context).colorScheme.primary,
                iconBgColor: Theme.of(
                  context,
                ).colorScheme.primary.withAlpha(25),
                title: 'Notifications',
                trailing: Switch(
                  value: true,
                  onChanged: (value) {},
                  activeTrackColor: Theme.of(context).colorScheme.primary,
                  inactiveTrackColor: Colors.grey.shade300,
                  inactiveThumbColor: Colors.white,
                ),
              ),
            ),
            BiteSettingItem(
              item: BiteSettingItemModel(
                icon: Icons.dark_mode_outlined,
                iconColor: Theme.of(context).colorScheme.primary,
                iconBgColor: Theme.of(
                  context,
                ).colorScheme.primary.withAlpha(25),
                title: 'Dark Mode',
                trailing: Switch(
                  value: false,
                  onChanged: (value) {},
                  activeTrackColor: Theme.of(context).colorScheme.primary,
                  inactiveTrackColor: Colors.grey.shade300,
                  inactiveThumbColor: Colors.white,
                ),
              ),
            ),
            BiteSettingItem(
              item: BiteSettingItemModel(
                icon: Icons.language,
                iconColor: Theme.of(context).colorScheme.primary,
                iconBgColor: Theme.of(
                  context,
                ).colorScheme.primary.withAlpha(25),
                title: 'Language',
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'English',
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: Theme.of(context).colorScheme.onSecondary,
                      ),
                    ),
                    5.horizontalSpace,
                    Icon(
                      Icons.arrow_forward_ios,
                      size: 18.r,
                      color: Colors.grey.shade300,
                    ),
                  ],
                ),
                onTap: () {},
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _VersionSection extends StatelessWidget {
  const _VersionSection();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Version 1.0.0',
        style: Theme.of(
          context,
        ).textTheme.bodySmall!.copyWith(color: Colors.grey.shade300),
      ),
    );
  }
}

class _AppBarSection extends StatelessWidget implements PreferredSizeWidget {
  const _AppBarSection();

  @override
  Size get preferredSize => Size.fromHeight(100.h);

  @override
  Widget build(BuildContext context) {
    return BiteAppBar(
      backButton: true,
      title: Text(
        'Settings',
        style: GoogleFonts.sen(
          fontSize: Theme.of(context).textTheme.displaySmall!.fontSize,
          fontWeight: Theme.of(context).textTheme.displaySmall!.fontWeight,
          color: Theme.of(context).colorScheme.primary,
        ),
      ),
      actions: [],
    );
  }
}
