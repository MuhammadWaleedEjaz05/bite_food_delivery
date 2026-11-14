import 'package:bite_food_delivery/app/theme/app_text_styles.dart';
import 'package:bite_food_delivery/core/extensions/responsive_extensions.dart';
import 'package:bite_food_delivery/core/extensions/theme_extensions.dart';
import 'package:bite_food_delivery/features/orders/models/order_model.dart';
import 'package:bite_food_delivery/features/restaurants/bloc/restaurants_cubit.dart';
import 'package:bite_food_delivery/widgets/app_text.dart';
import 'package:material_ui/material_ui.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class ReviewTargetSection extends StatelessWidget {
  final OrderModel order;

  const ReviewTargetSection({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    final colors = context.appColors;
    final restaurantName = context
        .read<RestaurantsCubit>()
        .getRestaurantNameById(order.restaurantId);
    final shortOrderId = order.orderId.length > 8
        ? order.orderId.substring(0, 8)
        : order.orderId;
    final formattedDate = DateFormat(
      'dd MMM yyyy, hh:mm a',
    ).format(order.orderPlacedAt);

    return SliverPadding(
      padding: context.contentInsets(bottom: 20),
      sliver: SliverToBoxAdapter(
        child: Container(
          padding: const EdgeInsets.all(16).r,
          decoration: BoxDecoration(
            color: colors.surfaceContainerLow,
            borderRadius: BorderRadius.circular(20).r,
            border: Border.all(color: colors.outlineVariant, width: 1),
          ),
          child: Row(
            children: [
              Container(
                width: 48.r,
                height: 48.r,
                decoration: BoxDecoration(
                  color: colors.primary.withValues(alpha: 0.12),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.restaurant_rounded,
                  size: 24.r,
                  color: colors.primary,
                ),
              ),
              14.horizontalSpace,
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppText(
                      restaurantName,
                      style: AppTextStyles.titleMedium(context),
                      maxLines: 1,
                    ),
                    4.verticalSpace,
                    AppText(
                      '#$shortOrderId • $formattedDate',
                      style: AppTextStyles.bodyMedium(
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
    );
  }
}
