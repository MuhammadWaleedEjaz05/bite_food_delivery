import 'package:bite_food_delivery/core/extensions/responsive_extensions.dart';
import 'package:bite_food_delivery/features/orders/bloc/order_cubit.dart';
import 'package:bite_food_delivery/features/orders/widgets/track_order_segmented_stepper.dart';
import 'package:material_ui/material_ui.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TrackOrderTimelineSection extends StatelessWidget {
  const TrackOrderTimelineSection({super.key});

  @override
  Widget build(BuildContext context) {
    final order = context.watch<OrderCubit>().activeOrder;

    if (order == null) {
      return const SliverToBoxAdapter(child: SizedBox.shrink());
    }

    return SliverPadding(
      padding: context.contentInsets(bottom: 20),
      sliver: SliverToBoxAdapter(
        child: TrackOrderSegmentedStepper(order: order),
      ),
    );
  }
}
