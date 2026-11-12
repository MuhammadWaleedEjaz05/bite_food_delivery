import 'package:bite_food_delivery/app/routes/app_navigation.dart';
import 'package:bite_food_delivery/core/extensions/responsive_extensions.dart';
import 'package:bite_food_delivery/features/authentication/bloc/user_auth_cubit.dart';
import 'package:bite_food_delivery/features/notifications/bloc/notifications_cubit.dart';
import 'package:bite_food_delivery/features/notifications/widgets/notification_card.dart';
import 'package:bite_food_delivery/l10n/app_localizations.dart';
import 'package:bite_food_delivery/src/services/firebase/firebase_auth_conn.dart';
import 'package:bite_food_delivery/widgets/app_feedback.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NotificationListSection extends StatelessWidget {
  const NotificationListSection({super.key});

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context)!;
    final cubit = context.read<NotificationsCubit>();
    final authState = context.watch<UserAuthCubit>().state;
    final userId = authState is UserLoggedIn
        ? (authState.user.id ?? 'guest')
        : getCurrentUser()?.uid;

    if (userId == null) {
      return SliverPadding(
        padding: context.contentInsets(bottom: 24),
        sliver: SliverToBoxAdapter(
          child: AppFeedback(
            message: t.pleaseSignUpToGetStarted,
            icon: Icons.notifications_none_rounded,
            actionLabel: t.logIn,
            onAction: () => AppNavigation.push(context, '/login_screen'),
          ),
        ),
      );
    }

    return SliverPadding(
      padding: context.contentInsets(bottom: 24),
      sliver: BlocBuilder<NotificationsCubit, NotificationsState>(
        builder: (context, state) {
          if (state is NotificationsLoading) {
            return const SliverToBoxAdapter(child: AppLoadingCard());
          }
          if (state is NotificationsError) {
            return SliverToBoxAdapter(
              child: AppFeedback(
                message: state.message,
                actionLabel: t.retryAction,
                onAction: () => cubit.loadNotifications(userId),
              ),
            );
          }
          if (state is NotificationsLoaded) {
            final items = state.notifications;
            if (items.isEmpty) {
              return SliverToBoxAdapter(
                child: AppFeedback(
                  message: t.noNotificationsYet,
                  icon: Icons.notifications_off_outlined,
                ),
              );
            }

            return SliverList.separated(
              itemCount: items.length,
              separatorBuilder: (_, _) => 12.verticalSpace,
              itemBuilder: (context, index) {
                final item = items[index];
                return NotificationCard(
                  notification: item,
                  onTap: () {
                    cubit.markAsRead(item.id, userId);
                    if (item.orderId != null && item.orderId!.isNotEmpty) {
                      AppNavigation.push(
                        context,
                        '/track_order_screen?orderId=${item.orderId}',
                      );
                    }
                  },
                );
              },
            );
          }
          return const SliverToBoxAdapter(child: SizedBox.shrink());
        },
      ),
    );
  }
}
