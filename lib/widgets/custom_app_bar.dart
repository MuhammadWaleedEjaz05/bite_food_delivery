import 'package:bite_food_delivery/app/routes/app_navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:bite_food_delivery/core/extensions/theme_extensions.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({super.key});
  @override
  Widget build(BuildContext context) => IconButton(
    tooltip: MaterialLocalizations.of(context).backButtonTooltip,
    onPressed: () => AppNavigation.back(context),
    icon: const Icon(Icons.arrow_back),
  );
}

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    required this.title,
    this.actions = const [],
    this.showBack = true,
  });
  final Widget title;
  final List<Widget> actions;
  final bool showBack;
  @override
  Size get preferredSize => Size.fromHeight(64.r);
  @override
  Widget build(BuildContext context) => AppBar(
    automaticallyImplyLeading: false,
    leading: showBack ? const CustomBackButton() : null,
    title: title,
    actions: actions,
    backgroundColor: context.appColors.surface,
    elevation: 0,
    toolbarHeight: 64.r,
  );
}

class CustomSliverAppBar extends StatelessWidget {
  const CustomSliverAppBar({
    super.key,
    required this.title,
    this.actions = const [],
    this.showBack = false,
  });
  final Widget title;
  final List<Widget> actions;
  final bool showBack;
  @override
  Widget build(BuildContext context) => SliverAppBar(
    pinned: true,
    automaticallyImplyLeading: false,
    leading: showBack ? const CustomBackButton() : null,
    title: title,
    actions: actions,
    backgroundColor: context.appColors.surface,
    toolbarHeight: 80.r * MediaQuery.textScalerOf(context).scale(1).clamp(1, 2),
    scrolledUnderElevation: 0,
  );
}
