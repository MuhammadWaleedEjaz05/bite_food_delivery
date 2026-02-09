import 'package:bite_food_delivery/Widgets/bite_app_bar.dart';
import 'package:bite_food_delivery/Widgets/bite_menu_item.dart';
import 'package:bite_food_delivery/Widgets/bite_menu_section.dart';
import 'package:bite_food_delivery/configs/profile_menu_items_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: _AppBarSection(),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 15.w),
        children: [
          _UserInfoSection(),
          30.verticalSpace,
          _MenuSection(),
          30.verticalSpace,
        ],
      ),
    );
  }
}

class _MenuSection extends StatelessWidget {
  const _MenuSection();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BiteMenuSection(
          menuItems: pInfoList(
            context,
          ).map((item) => BiteMenuItem(item: item)).toList(),
        ),
        20.verticalSpace,
        BiteMenuSection(
          menuItems: pAppList(
            context,
          ).map((item) => BiteMenuItem(item: item)).toList(),
        ),
        20.verticalSpace,
        BiteMenuSection(
          menuItems: pSupportList(
            context,
          ).map((item) => BiteMenuItem(item: item)).toList(),
        ),
        30.verticalSpace,
        BiteMenuSection(
          menuItems: [
            BiteMenuItem(
              item: BiteMenuItemModel(
                leadingIcon: Icons.logout,
                leadingIconColor: Colors.red,
                title: 'Logout',
                onTap: () {},
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _UserInfoSection extends StatelessWidget {
  const _UserInfoSection();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleAvatar(radius: 60.r, backgroundColor: Colors.grey),
        20.horizontalSpace,
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Waleed Ejaz',
              style: GoogleFonts.sen(
                fontSize: 25.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'I Love Fast Food',
              style: GoogleFonts.sen(
                fontSize: 15.sp,
                color: Colors.grey.shade500,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
        30.horizontalSpace,
      ],
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
      title: Text(
        'Profile',
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
