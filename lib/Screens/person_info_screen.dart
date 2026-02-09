import 'package:bite_food_delivery/Widgets/bite_app_bar.dart';
import 'package:bite_food_delivery/Widgets/bite_menu_item.dart';
import 'package:bite_food_delivery/Widgets/bite_menu_section.dart';
import 'package:bite_food_delivery/configs/profile_menu_items_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class PersonInfoScreen extends StatelessWidget {
  const PersonInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: BiteAppBar(
        backButton: true,
        title: Text(
          'Personal Info',
          style: GoogleFonts.sen(
            fontSize: 20.sp,
            fontWeight: FontWeight.bold,
            color: Theme.of(context).primaryColor,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {},
            child: Text(
              'EDIT',
              style: GoogleFonts.sen(
                fontSize: 20.sp,
                color: Theme.of(context).primaryColor,
                decoration: TextDecoration.underline,
                decorationColor: Theme.of(context).primaryColor,
                decorationThickness: 2,
              ),
            ),
          ),
          15.horizontalSpace,
        ],
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 15.w),
        children: [
          30.verticalSpace,
          _UserInfoSection(),
          40.verticalSpace,
          BiteMenuSection(
            menuItems: personalInfoList(
              context,
            ).map((e) => BiteMenuItem(item: e)).toList(),
          ),
        ],
      ),
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
