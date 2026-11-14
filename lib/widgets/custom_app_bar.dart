import 'package:bite_food_delivery/app/routes/app_navigation.dart';
import 'package:bite_food_delivery/widgets/app_bouncing_tap.dart';
import 'package:material_ui/material_ui.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:bite_food_delivery/core/extensions/theme_extensions.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({super.key});

  @override
  Widget build(BuildContext context) => Padding(
    padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h).r,
    child: AppBouncingTap(
      onTap: () => AppNavigation.back(context),
      pressedScale: 0.88,
      child: Container(
        width: 38.r,
        height: 38.r,
        decoration: BoxDecoration(
          color: context.appColors.surfaceContainerHighest.withValues(
            alpha: 0.65,
          ),
          borderRadius: BorderRadius.circular(12).r,
          border: Border.all(
            color: context.appColors.outlineVariant.withValues(alpha: 0.35),
            width: 1.r,
          ),
        ),
        child: Icon(
          Icons.arrow_back_rounded,
          size: 18.r,
          color: context.appColors.onSurface,
        ),
      ),
    ),
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
  Size get preferredSize => Size.fromHeight(60.r);

  @override
  Widget build(BuildContext context) => AppBar(
    automaticallyImplyLeading: false,
    leading: showBack ? const CustomBackButton() : null,
    title: title,
    actions: actions,
    backgroundColor: context.appColors.surface,
    elevation: 0,
    scrolledUnderElevation: 0,
    toolbarHeight: 60.r,
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
    toolbarHeight: 76.r * MediaQuery.textScalerOf(context).scale(1).clamp(1, 2),
    scrolledUnderElevation: 0,
  );
}
