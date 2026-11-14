import 'package:bite_food_delivery/core/extensions/responsive_extensions.dart';
import 'package:bite_food_delivery/features/orders/bloc/order_cubit.dart';
import 'package:bite_food_delivery/features/orders/models/order_model.dart';
import 'package:bite_food_delivery/features/orders/widgets/courier_contact_card.dart';
import 'package:bite_food_delivery/core/services/phone_call/phone_call_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TrackOrderCourierSection extends StatelessWidget {
  const TrackOrderCourierSection({super.key});
  static const String _courierPhoneNumber = '+923186384283';

  @override
  Widget build(BuildContext context) {
    final order = context.watch<OrderCubit>().activeOrder;

    if (order == null ||
        order.orderStatus == OrderStatus.delivered ||
        order.orderStatus == OrderStatus.cancelled) {
      return const SliverToBoxAdapter(child: SizedBox.shrink());
    }

    return SliverPadding(
      padding: context.contentInsets(bottom: 24),
      sliver: SliverToBoxAdapter(
        child: CourierContactCard(
          name: 'Ahmed Khan',
          phone: _courierPhoneNumber,
          onCall: () =>
              context.read<PhoneCallCubit>().makePhoneCall(_courierPhoneNumber),
        ),
      ),
    );
  }
}
