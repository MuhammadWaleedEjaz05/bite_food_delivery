import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:bite_food_delivery/l10n/app_localizations.dart';
import '../widgets/dashboard_navigation_bar.dart';

class DashboardNavigationSection extends StatelessWidget {
  const DashboardNavigationSection({super.key, required this.shell});
  final StatefulNavigationShell shell;
  @override
  Widget build(BuildContext context) {
    final text = AppLocalizations.of(context)!;
    return DashboardNavigationBar(
      index: shell.currentIndex,
      labels: [text.home, text.discoverTab, text.ordersTab, text.accountTab],
      onSelected: (index) => shell.goBranch(index),
    );
  }
}
