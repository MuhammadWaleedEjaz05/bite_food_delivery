import 'package:bite_food_delivery/Widgets/bite_app_bar.dart';
import 'package:bite_food_delivery/Widgets/bite_menu_section.dart';
import 'package:bite_food_delivery/Widgets/bite_setting_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
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
            style: GoogleFonts.sen(
              fontSize: 14.sp,
              fontWeight: FontWeight.w600,
              color: Colors.grey.shade500,
              letterSpacing: 1.2,
            ),
          ),
        ),
        BiteMenuSection(
          menuItems: [
            BiteSettingItem(
              item: BiteSettingItemModel(
                icon: Icons.notifications_outlined,
                iconColor: Theme.of(context).primaryColor,
                iconBgColor: Theme.of(context).primaryColor.withAlpha(25),
                title: 'Notifications',
                trailing: Switch(
                  value: true,
                  onChanged: (value) {},
                  activeTrackColor: Theme.of(context).primaryColor,
                  inactiveTrackColor: Colors.grey.shade300,
                  inactiveThumbColor: Colors.white,
                ),
              ),
            ),
            BiteSettingItem(
              item: BiteSettingItemModel(
                icon: Icons.dark_mode_outlined,
                iconColor: Theme.of(context).primaryColor,
                iconBgColor: Theme.of(context).primaryColor.withAlpha(25),
                title: 'Dark Mode',
                trailing: Switch(
                  value: false,
                  onChanged: (value) {},
                  activeTrackColor: Theme.of(context).primaryColor,
                  inactiveTrackColor: Colors.grey.shade300,
                  inactiveThumbColor: Colors.white,
                ),
              ),
            ),
            BiteSettingItem(
              item: BiteSettingItemModel(
                icon: Icons.language,
                iconColor: Theme.of(context).primaryColor,
                iconBgColor: Theme.of(context).primaryColor.withAlpha(25),
                title: 'Language',
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'English',
                      style: GoogleFonts.sen(
                        fontSize: 15.sp,
                        color: Colors.grey.shade500,
                      ),
                    ),
                    5.horizontalSpace,
                    Icon(
                      Icons.arrow_forward_ios,
                      size: 18.r,
                      color: Colors.grey.shade400,
                    ),
                  ],
                ),
                onTap: () {
                  // TODO: Navigate to language selection screen
                },
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
        style: GoogleFonts.sen(fontSize: 14.sp, color: Colors.grey.shade400),
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
          fontSize: 30.sp,
          fontWeight: FontWeight.bold,
          color: Theme.of(context).primaryColor,
        ),
      ),
      actions: [],
    );
  }
}
