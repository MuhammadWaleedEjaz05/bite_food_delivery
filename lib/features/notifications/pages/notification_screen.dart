import 'package:bite_food_delivery/features/notifications/sections/notification_header_section.dart';
import 'package:bite_food_delivery/features/notifications/sections/notification_list_section.dart';
import 'package:flutter/material.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          key: PageStorageKey('notification_screen'),
          physics: BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics(),
          ),
          slivers: [NotificationHeaderSection(), NotificationListSection()],
        ),
      ),
    );
  }
}
