import 'package:bite_food_delivery/app/theme/app_text_styles.dart';
import 'package:bite_food_delivery/core/extensions/theme_extensions.dart';
import 'package:bite_food_delivery/features/notifications/models/notification_model.dart';
import 'package:bite_food_delivery/widgets/app_text.dart';
import 'package:material_ui/material_ui.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class NotificationCard extends StatelessWidget {
  final NotificationModel notification;
  final VoidCallback onTap;
  final VoidCallback? onDelete;

  const NotificationCard({
    super.key,
    required this.notification,
    required this.onTap,
    this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.appColors;
    final formattedTime = DateFormat(
      'dd MMM, hh:mm a',
    ).format(notification.createdAt);

    final isOrder = notification.type.startsWith('order');
    final icon = isOrder
        ? Icons.local_shipping_outlined
        : Icons.notifications_none_rounded;

    final iconColor = notification.isRead
        ? colors.onSurfaceVariant
        : colors.primary;

    return Dismissible(
      key: Key(notification.id),
      direction: DismissDirection.endToStart,
      onDismissed: (_) => onDelete?.call(),
      background: Container(
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: 20).r,
        decoration: BoxDecoration(
          color: colors.error,
          borderRadius: BorderRadius.circular(20).r,
        ),
        child: Icon(Icons.delete_outline, color: colors.onError),
      ),
      child: Material(
        color: notification.isRead
            ? colors.surfaceContainerLow
            : colors.primary.withValues(alpha: 0.06),
        borderRadius: BorderRadius.circular(20).r,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(20).r,
          child: Container(
            padding: const EdgeInsets.all(16).r,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20).r,
              border: Border.all(
                color: notification.isRead
                    ? colors.outlineVariant
                    : colors.primary.withValues(alpha: 0.3),
                width: 1,
              ),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.all(10).r,
                  decoration: BoxDecoration(
                    color: iconColor.withValues(alpha: 0.12),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(icon, size: 22.r, color: iconColor),
                ),
                14.horizontalSpace,
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: AppText(
                              notification.title,
                              style: AppTextStyles.titleMedium(context)
                                  .copyWith(
                                    fontWeight: notification.isRead
                                        ? FontWeight.w600
                                        : FontWeight.bold,
                                  ),
                              maxLines: 1,
                            ),
                          ),
                          if (!notification.isRead) ...[
                            8.horizontalSpace,
                            Container(
                              width: 8.r,
                              height: 8.r,
                              decoration: BoxDecoration(
                                color: colors.primary,
                                shape: BoxShape.circle,
                              ),
                            ),
                          ],
                        ],
                      ),
                      4.verticalSpace,
                      AppText(
                        notification.body,
                        style: AppTextStyles.bodyMedium(
                          context,
                        ).copyWith(color: colors.onSurfaceVariant),
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                      8.verticalSpace,
                      AppText(
                        formattedTime,
                        style: AppTextStyles.labelSmall(
                          context,
                        ).copyWith(color: colors.onSurfaceVariant),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
