import 'package:bite_food_delivery/Cubits/NotificationCubit/notifications_cubit.dart';
import 'package:bite_food_delivery/Cubits/UserAuthCubit/user_auth_cubit.dart';
import 'package:bite_food_delivery/GlobalWidgets/bite_app_bar.dart';
import 'package:bite_food_delivery/Models/notification_model.dart';
import 'package:bite_food_delivery/Screens/NotificationPage/Widgets/bite_notification_card.dart';
import 'package:bite_food_delivery/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: const _AppSection(),
      body: BlocBuilder<NotificationsCubit, NotificationsState>(
        builder: (context, state) {
          if (state is NotificationsLoaded) {
            return _NotificationBody(state: state);
          }
          if (state is NotificationsError) {
            return Center(
              child: Text(
                state.message,
                style: Theme.of(
                  context,
                ).textTheme.titleSmall!.copyWith(color: Colors.grey),
              ),
            );
          }
          return Center(
            child: CircularProgressIndicator(
              color: Theme.of(context).colorScheme.primary,
            ),
          );
        },
      ),
    );
  }
}

class _NotificationBody extends StatelessWidget {
  final NotificationsLoaded state;
  const _NotificationBody({required this.state});

  @override
  Widget build(BuildContext context) {
    if (state.notifications.isEmpty) {
      return Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.notifications_off_outlined,
              size: 60.r,
              color: Colors.grey.shade300,
            ),
            15.verticalSpace,
            Text(
              S.of(context).noNotificationsYet,
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                color: Theme.of(context).colorScheme.onSecondary,
                fontWeight: FontWeight.normal,
              ),
            ),
          ],
        ),
      );
    }

    return DefaultTabController(
      initialIndex: 0,
      length: 2,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              S
                  .of(context)
                  .stateunreadcountUnreadNotifications(state.unreadCount),
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                color: Theme.of(context).colorScheme.onSecondary,
                fontWeight: FontWeight.normal,
              ),
            ),
            15.verticalSpace,
            _TabSection(
              totalCount: state.notifications.length,
              unreadCount: state.unreadCount,
            ),
            20.verticalSpace,
            Expanded(
              child: TabBarView(
                children: [
                  _NotificationList(notifications: state.notifications),
                  _NotificationList(notifications: state.unreadNotifications),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _NotificationList extends StatelessWidget {
  final List<NotificationModel> notifications;
  const _NotificationList({required this.notifications});

  @override
  Widget build(BuildContext context) {
    if (notifications.isEmpty) {
      return Center(
        child: Text(
          S.of(context).noNotificationsYet,
          style: Theme.of(context).textTheme.titleSmall!.copyWith(
            color: Theme.of(context).colorScheme.secondary,
            fontWeight: FontWeight.normal,
          ),
        ),
      );
    }

    return ListView.separated(
      itemCount: notifications.length,
      separatorBuilder: (context, index) => 12.verticalSpace,
      itemBuilder: (context, index) {
        final notification = notifications[index];
        final style = _styleForType(notification.type);

        return GestureDetector(
          onTap: () {
            if (!notification.isRead) {
              context.read<NotificationsCubit>().markAsRead(notification.id);
            }
          },
          child: BiteNotificationCard(
            icon: style.$1,
            iconColor: style.$2,
            iconBgColor: style.$3,
            borderColor: notification.isRead
                ? Colors.grey.shade300
                : Theme.of(context).colorScheme.primary,
            title: notification.title,
            subtitle: notification.body,
            time: _timeAgo(notification.createdAt),
            isUnread: !notification.isRead,
          ),
        );
      },
    );
  }
}

class _TabSection extends StatelessWidget {
  final int totalCount;
  final int unreadCount;
  const _TabSection({required this.totalCount, required this.unreadCount});

  @override
  Widget build(BuildContext context) {
    return TabBar(
      indicatorSize: TabBarIndicatorSize.tab,
      indicator: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        borderRadius: BorderRadius.circular(30.r),
      ),
      dividerColor: Colors.transparent,
      labelColor: Colors.white,
      unselectedLabelColor: Colors.black,
      labelStyle: Theme.of(context).textTheme.titleSmall,
      unselectedLabelStyle: Theme.of(
        context,
      ).textTheme.titleSmall!.copyWith(fontWeight: FontWeight.normal),
      tabs: [
        Tab(text: S.of(context).allNotifications(totalCount)),
        Tab(text: S.of(context).unreadNotifications(unreadCount)),
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
        S.of(context).notifications,
        style: GoogleFonts.sen(
          fontSize: Theme.of(context).textTheme.displaySmall!.fontSize,
          fontWeight: Theme.of(context).textTheme.displaySmall!.fontWeight,
          color: Theme.of(context).colorScheme.primary,
        ),
      ),
      actions: [
        PopupMenuButton<String>(
          icon: Icon(Icons.more_vert, size: 24.r),
          onSelected: (value) {
            final userState = context.read<UserAuthCubit>().state;
            if (userState is! UserLoggedIn || userState.user.id == null) return;
            final userId = userState.user.id!;
            final cubit = context.read<NotificationsCubit>();
            if (value == 'mark_all_read') {
              cubit.markAllAsRead(userId);
            } else if (value == 'clear_all') {
              showDialog(
                context: context,
                builder: (ctx) => AlertDialog(
                  title: Text(S.of(context).clearAllNotifications),
                  content: Text(
                    S.of(context).deleteAllNotificationsConfirmation,
                  ),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(ctx),
                      child: Text(S.of(context).cancel),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pop(ctx);
                        cubit.clearAllNotifications(userId);
                      },
                      child: const Text(
                        'Clear All',
                        style: TextStyle(color: Colors.red),
                      ),
                    ),
                  ],
                ),
              );
            }
          },
          itemBuilder: (context) => [
            PopupMenuItem(
              value: 'mark_all_read',
              child: Row(
                children: [
                  const Icon(Icons.done_all),
                  const SizedBox(width: 8),
                  Text(S.of(context).markAllAsRead),
                ],
              ),
            ),
            PopupMenuItem(
              value: 'clear_all',
              child: Row(
                children: [
                  const Icon(Icons.delete_outline, color: Colors.red),
                  const SizedBox(width: 8),
                  Text(S.of(context).clearAll, style: const TextStyle(color: Colors.red)),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}

(IconData, Color, Color) _styleForType(String type) {
  switch (type) {
    case 'order_placed':
      return (Icons.check_circle_outline, Colors.green, Colors.green.shade50);
    case 'order_preparing':
      return (Icons.restaurant, Colors.orange, Colors.orange.shade50);
    case 'order_dispatched':
      return (Icons.local_shipping_outlined, Colors.blue, Colors.blue.shade50);
    case 'order_delivered':
      return (Icons.inventory_2_outlined, Colors.green, Colors.green.shade50);
    case 'order_cancelled':
      return (Icons.cancel_outlined, Colors.red, Colors.red.shade50);
    default:
      return (Icons.notifications_none, Colors.grey, Colors.grey.shade50);
  }
}

String _timeAgo(DateTime dateTime) {
  final diff = DateTime.now().difference(dateTime);
  if (diff.inMinutes < 1) return 'Just now';
  if (diff.inMinutes < 60) return '${diff.inMinutes} min ago';
  if (diff.inHours < 24) return '${diff.inHours}h ago';
  return '${diff.inDays}d ago';
}
