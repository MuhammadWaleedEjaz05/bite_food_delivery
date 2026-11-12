import 'package:bite_food_delivery/features/profile/sections/profile_account_menu_section.dart';
import 'package:bite_food_delivery/features/profile/sections/profile_header_section.dart';
import 'package:bite_food_delivery/features/profile/sections/profile_logout_section.dart';
import 'package:bite_food_delivery/features/profile/sections/profile_orders_menu_section.dart';
import 'package:bite_food_delivery/features/profile/sections/profile_support_menu_section.dart';
import 'package:bite_food_delivery/features/profile/sections/profile_user_card_section.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          key: PageStorageKey('profile_screen'),
          physics: BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics(),
          ),
          slivers: [
            ProfileHeaderSection(),
            ProfileUserCardSection(),
            ProfileAccountMenuSection(),
            ProfileOrdersMenuSection(),
            ProfileSupportMenuSection(),
            ProfileLogoutSection(),
          ],
        ),
      ),
    );
  }
}
