import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../sections/dashboard_body_section.dart';
import '../sections/dashboard_navigation_section.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key, required this.shell});
  final StatefulNavigationShell shell;
  @override
  Widget build(BuildContext context) => Scaffold(
    extendBody: true,
    body: DashboardBodySection(child: shell),
    bottomNavigationBar: DashboardNavigationSection(shell: shell),
  );
}
