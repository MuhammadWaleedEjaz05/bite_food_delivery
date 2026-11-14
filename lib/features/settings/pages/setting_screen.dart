import 'package:bite_food_delivery/features/settings/sections/setting_about_section.dart';
import 'package:bite_food_delivery/features/settings/sections/setting_header_section.dart';
import 'package:bite_food_delivery/features/settings/sections/setting_preferences_section.dart';
import 'package:material_ui/material_ui.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          key: PageStorageKey('setting_screen'),
          physics: BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics(),
          ),
          slivers: [
            SettingHeaderSection(),
            SettingPreferencesSection(),
            SettingAboutSection(),
          ],
        ),
      ),
    );
  }
}
