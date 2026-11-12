import 'package:bite_food_delivery/app/theme/app_text_styles.dart';
import 'package:bite_food_delivery/core/extensions/price_format.dart';
import 'package:bite_food_delivery/core/extensions/responsive_extensions.dart';
import 'package:bite_food_delivery/core/extensions/theme_extensions.dart';
import 'package:bite_food_delivery/features/orders/bloc/order_cubit.dart';
import 'package:bite_food_delivery/l10n/app_localizations.dart';
import 'package:bite_food_delivery/widgets/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class TrackOrderDetailsSection extends StatelessWidget {
  const TrackOrderDetailsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = context.appColors;
    final t = AppLocalizations.of(context)!;
    final order = context.watch<OrderCubit>().activeOrder;

    if (order == null) {
      return const SliverToBoxAdapter(child: SizedBox.shrink());
    }

    final formattedDate = DateFormat(
      'dd MMM yyyy, hh:mm a',
    ).format(order.orderPlacedAt);

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
              AppText(
                t.orderDetails,
                style: AppTextStyles.titleMedium(context),
              ),
              14.verticalSpace,
              _DetailRow(
                label: t.orderId,
                value: '#${order.orderId.substring(0, 8)}',
              ),
              10.verticalSpace,
              _DetailRow(label: t.orderDate, value: formattedDate),
              10.verticalSpace,
              _DetailRow(
                label: t.paymentMethod,
                value: order.paymentMethod.name.toUpperCase(),
              ),
              14.verticalSpace,
              Divider(color: colors.outlineVariant, height: 1),
              14.verticalSpace,
              Wrap(
                alignment: WrapAlignment.spaceBetween,
                crossAxisAlignment: WrapCrossAlignment.center,
                spacing: 8.r,
                runSpacing: 6.r,
                children: [
                  AppText(
                    t.totalPrice,
                    style: AppTextStyles.titleMedium(context),
                  ),
                  AppText(
                    context.priceLabel(order.totalPrice),
                    style: AppTextStyles.titleLarge(context).copyWith(
                      color: colors.primary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _DetailRow extends StatelessWidget {
  final String label;
  final String value;

  const _DetailRow({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      alignment: WrapAlignment.spaceBetween,
      crossAxisAlignment: WrapCrossAlignment.center,
      spacing: 8.r,
      runSpacing: 4.r,
      children: [
        AppText(
          label,
          style: AppTextStyles.bodyMedium(
            context,
          ).copyWith(color: context.appColors.onSurfaceVariant),
        ),
        AppText(value, style: AppTextStyles.labelLarge(context)),
      ],
    );
  }
}
