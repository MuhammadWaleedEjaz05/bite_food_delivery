import 'package:bite_food_delivery/app/theme/app_text_styles.dart';
import 'package:bite_food_delivery/core/extensions/responsive_extensions.dart';
import 'package:bite_food_delivery/core/extensions/theme_extensions.dart';
import 'package:bite_food_delivery/features/orders/bloc/order_cubit.dart';
import 'package:bite_food_delivery/features/orders/models/order_model.dart';
import 'package:bite_food_delivery/features/orders/widgets/order_timeline_step.dart';
import 'package:bite_food_delivery/l10n/app_localizations.dart';
import 'package:bite_food_delivery/widgets/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TrackOrderTimelineSection extends StatelessWidget {
  const TrackOrderTimelineSection({super.key});

  int _orderStatusToStep(OrderStatus status) {
    switch (status) {
      case OrderStatus.received:
        return 0;
      case OrderStatus.preparing:
        return 1;
      case OrderStatus.dispatched:
        return 2;
      case OrderStatus.delivered:
        return 3;
      case OrderStatus.cancelled:
        return -1; // Handled specially, never crashes!
    }
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.appColors;
    final t = AppLocalizations.of(context)!;
    final order = context.watch<OrderCubit>().activeOrder;

    if (order == null) {
      return const SliverToBoxAdapter(child: SizedBox.shrink());
    }

    final isCancelled = order.orderStatus == OrderStatus.cancelled;
    final currentStep = _orderStatusToStep(order.orderStatus);

    final steps = [
      {'title': t.orderReceived, 'subtitle': t.orderReceivedSubtitle},
      {'title': t.preparing, 'subtitle': t.preparingSubtitle},
      {'title': t.dispatched, 'subtitle': t.dispatchedSubtitle},
      {'title': t.delivered, 'subtitle': t.deliveredSubtitle},
    ];

    return SliverPadding(
      padding: context.contentInsets(bottom: 20),
      sliver: SliverToBoxAdapter(
        child: Container(
          padding: const EdgeInsets.all(20).r,
          decoration: BoxDecoration(
            color: colors.surfaceContainerLow,
            borderRadius: BorderRadius.circular(24).r,
            border: Border.all(color: colors.outlineVariant, width: 1),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppText(t.orderStatus, style: AppTextStyles.titleMedium(context)),
              18.verticalSpace,
              if (isCancelled)
                OrderTimelineStep(
                  title: t.cancelled,
                  subtitle: t.orderCancelledSuccessfully,
                  isCancelled: true,
                  isLast: true,
                )
              else
                for (var i = 0; i < steps.length; i++)
                  OrderTimelineStep(
                    title: steps[i]['title']!,
                    subtitle: steps[i]['subtitle'],
                    isCompleted: currentStep > i,
                    isCurrent: currentStep == i,
                    isLast: i == steps.length - 1,
                  ),
            ],
          ),
        ),
      ),
    );
  }
}
