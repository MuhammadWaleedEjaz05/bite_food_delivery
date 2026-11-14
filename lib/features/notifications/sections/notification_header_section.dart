import 'package:bite_food_delivery/app/theme/app_text_styles.dart';
import 'package:bite_food_delivery/core/extensions/theme_extensions.dart';
import 'package:bite_food_delivery/features/authentication/bloc/user_auth_cubit.dart';
import 'package:bite_food_delivery/features/notifications/bloc/notifications_cubit.dart';
import 'package:bite_food_delivery/l10n/app_localizations.dart';
import 'package:bite_food_delivery/core/services/firebase/firebase_auth_conn.dart';
import 'package:bite_food_delivery/widgets/app_text.dart';
import 'package:bite_food_delivery/widgets/custom_app_bar.dart';
import 'package:material_ui/material_ui.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NotificationHeaderSection extends StatelessWidget {
  const NotificationHeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context)!;
    final cubit = context.read<NotificationsCubit>();
    final authState = context.watch<UserAuthCubit>().state;
    final userId = authState is UserLoggedIn
        ? (authState.user.id ?? 'guest')
        : getCurrentUser()?.uid;

    return CustomSliverAppBar(
      showBack: true,
      title: AppText(
        t.notifications,
        style: AppTextStyles.titleMedium(context),
      ),
      actions: [
        BlocBuilder<NotificationsCubit, NotificationsState>(
          builder: (context, state) {
            final hasUnread =
                state is NotificationsLoaded &&
                state.notifications.any((n) => !n.isRead);

            if (!hasUnread || userId == null) return const SizedBox.shrink();

            return TextButton(
              onPressed: () => cubit.markAllAsRead(userId),
              child: AppText(
                t.markAllAsRead,
                style: AppTextStyles.labelMedium(context).copyWith(
                  color: context.appColors.primary,
                  fontWeight: FontWeight.bold,
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
