import 'package:bite_food_delivery/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BiteAppBar extends StatelessWidget implements PreferredSizeWidget {
  const BiteAppBar({
    super.key,
    this.isLogoVisible = false,
    this.isDarkMode = false,
    this.backButton = false,
    required this.title,
    required this.actions,
  });
  final bool isDarkMode;
  final bool isLogoVisible;
  final bool backButton;
  final Widget title;
  final List<Widget> actions;

  @override
  Size get preferredSize => Size.fromHeight(100.h);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: Colors.white.withAlpha(0),
      shadowColor: Colors.white.withAlpha(0),
      scrolledUnderElevation: 0,
      elevation: 0,
      toolbarHeight: 100.h,
      leadingWidth: isLogoVisible ? 100.w : 75.w,
      leading: isLogoVisible
          ? SvgPicture.asset(
              'assets/svgs/logo.svg',
              colorFilter: ColorFilter.mode(
                Theme.of(context).colorScheme.primary,
                BlendMode.srcIn,
              ),
            )
          : backButton
          ? const CustomBackButton()
          : null,
      centerTitle: isLogoVisible ? true : false,
      title: title,
      actions: actions,
    );
  }
}
