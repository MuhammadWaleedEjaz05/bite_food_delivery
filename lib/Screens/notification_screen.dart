import 'package:bite_food_delivery/Widgets/bite_app_bar.dart';
import 'package:bite_food_delivery/Widgets/bite_notification_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _AppSection(),
      body: DefaultTabController(
        initialIndex: 0,
        length: 2,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _UnreadCountSection(),
              15.verticalSpace,
              _TabSection(),
              20.verticalSpace,
              Expanded(child: _NotificationSection()),
            ],
          ),
        ),
      ),
    );
  }
}

class _UnreadCountSection extends StatelessWidget {
  const _UnreadCountSection();

  @override
  Widget build(BuildContext context) {
    return Text(
      '2 unread notifications',
      style: GoogleFonts.sen(fontSize: 16.sp, color: Colors.grey.shade600),
    );
  }
}

class _NotificationSection extends StatelessWidget {
  const _NotificationSection();

  @override
  Widget build(BuildContext context) {
    return TabBarView(
      children: [_AllNotificationsSection(), _UnreadNotificationsSection()],
    );
  }
}

class _AllNotificationsSection extends StatelessWidget {
  const _AllNotificationsSection();

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, index) => BiteNotificationCard(
        icon: _notificationData(context)[index]['icon'] as IconData,
        iconColor: _notificationData(context)[index]['iconColor'] as Color,
        iconBgColor: _notificationData(context)[index]['iconBgColor'] as Color,
        borderColor: _notificationData(context)[index]['borderColor'] as Color,
        title: _notificationData(context)[index]['title'] as String,
        subtitle: _notificationData(context)[index]['subtitle'] as String,
        time: _notificationData(context)[index]['time'] as String,
        isUnread: _notificationData(context)[index]['isUnread'] as bool,
      ),
      separatorBuilder: (context, index) => 12.verticalSpace,
      itemCount: _notificationData(context).length,
    );
  }
}

class _UnreadNotificationsSection extends StatelessWidget {
  const _UnreadNotificationsSection();

  @override
  Widget build(BuildContext context) {
    final unreadNotifications = _notificationData(
      context,
    ).where((n) => n['isUnread'] == true).toList();
    return ListView.separated(
      itemBuilder: (context, index) => BiteNotificationCard(
        icon: unreadNotifications[index]['icon'] as IconData,
        iconColor: unreadNotifications[index]['iconColor'] as Color,
        iconBgColor: unreadNotifications[index]['iconBgColor'] as Color,
        borderColor: unreadNotifications[index]['borderColor'] as Color,
        title: unreadNotifications[index]['title'] as String,
        subtitle: unreadNotifications[index]['subtitle'] as String,
        time: unreadNotifications[index]['time'] as String,
        isUnread: unreadNotifications[index]['isUnread'] as bool,
      ),
      separatorBuilder: (context, index) => 12.verticalSpace,
      itemCount: unreadNotifications.length,
    );
  }
}

class _TabSection extends StatelessWidget {
  const _TabSection();

  @override
  Widget build(BuildContext context) {
    return TabBar(
      indicatorSize: TabBarIndicatorSize.tab,
      indicator: BoxDecoration(
        color: Theme.of(context).primaryColor,
        borderRadius: BorderRadius.circular(30.r),
      ),
      dividerColor: Colors.transparent,
      labelColor: Colors.white,
      unselectedLabelColor: Colors.black,
      labelStyle: GoogleFonts.sen(fontSize: 16.sp, fontWeight: FontWeight.bold),
      unselectedLabelStyle: GoogleFonts.sen(fontSize: 16.sp),
      tabs: [
        Tab(text: 'All (6)'),
        Tab(text: 'Unread (2)'),
      ],
    );
  }
}

class _AppSection extends StatelessWidget implements PreferredSizeWidget {
  const _AppSection();
  @override
  Size get preferredSize => Size.fromHeight(100.h);

  @override
  Widget build(BuildContext context) {
    return BiteAppBar(
      backButton: true,
      title: Text(
        'Notifications',
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

List<Map<String, dynamic>> _notificationData(BuildContext context) {
  return [
    {
      'icon': Icons.inventory_2_outlined,
      'iconColor': Colors.blue,
      'iconBgColor': Colors.blue.shade50,
      'borderColor': Theme.of(context).primaryColor,
      'title': 'Order Delivered',
      'subtitle': 'Your order #12345 has been delivered successfully',
      'time': '5 min ago',
      'isUnread': true,
    },
    {
      'icon': Icons.percent,
      'iconColor': Colors.deepOrange,
      'iconBgColor': Colors.orange.shade50,
      'borderColor': Theme.of(context).primaryColor,
      'title': 'Special Offer!',
      'subtitle': 'Get 30% off on your next order. Use code: SAVE30',
      'time': '1 hour ago',
      'isUnread': true,
    },
    {
      'icon': Icons.check_circle_outline,
      'iconColor': Colors.green,
      'iconBgColor': Colors.green.shade50,
      'borderColor': Colors.grey.shade300,
      'title': 'Order Confirmed',
      'subtitle': 'Your order #12344 has been confirmed and is being prepared',
      'time': '2 hours ago',
      'isUnread': false,
    },
    {
      'icon': Icons.notifications_none,
      'iconColor': Colors.deepOrange,
      'iconBgColor': Colors.orange.shade50,
      'borderColor': Colors.grey.shade300,
      'title': 'Rate Your Order',
      'subtitle': 'How was your experience with Pizza Paradise?',
      'time': '5 hours ago',
      'isUnread': false,
    },
    {
      'icon': Icons.local_shipping_outlined,
      'iconColor': Colors.blue,
      'iconBgColor': Colors.blue.shade50,
      'borderColor': Colors.grey.shade300,
      'title': 'Order Out for Delivery',
      'subtitle': 'Your order #12343 is out for delivery',
      'time': '1 day ago',
      'isUnread': false,
    },
  ];
}
