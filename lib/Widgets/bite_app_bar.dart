import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
      surfaceTintColor: Colors.white.withAlpha(0),
      toolbarHeight: 100.h,
      leadingWidth: isLogoVisible ? 100.w : 75.w,
      leading: isLogoVisible
          ? Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/logo.png'),
                  fit: BoxFit.cover,
                ),
              ),
            )
          : backButton
          ? IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              style: IconButton.styleFrom(
                foregroundColor: isDarkMode ? Colors.white : Colors.black,
                backgroundColor: Colors.grey.withAlpha(50),
              ),
              icon: Icon(Icons.arrow_back, size: 30.r),
            )
          : null,
      centerTitle: isLogoVisible ? true : false,
      title: title,
      actions: actions,
    );
  }
}
