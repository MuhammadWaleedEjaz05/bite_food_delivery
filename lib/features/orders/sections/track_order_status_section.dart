import 'package:bite_food_delivery/core/extensions/responsive_extensions.dart';
import 'package:bite_food_delivery/features/orders/bloc/order_cubit.dart';
import 'package:bite_food_delivery/features/orders/widgets/track_order_arrival_card.dart';
import 'package:bite_food_delivery/l10n/app_localizations.dart';
import 'package:bite_food_delivery/widgets/app_text.dart';
import 'package:bite_food_delivery/app/theme/app_text_styles.dart';
import 'package:material_ui/material_ui.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TrackOrderStatusSection extends StatelessWidget {
  const TrackOrderStatusSection({super.key});

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context)!;
    final order = context.watch<OrderCubit>().activeOrder;

    if (order == null) {
      return SliverPadding(
        padding: context.contentInsets(top: 20, bottom: 20),
        sliver: SliverToBoxAdapter(
          child: Center(
            child: AppText(
              t.noActiveOrder,
              style: AppTextStyles.titleMedium(context),
            ),
          ),
        ),
      );
    }

    return SliverPadding(
      padding: context.contentInsets(bottom: 16),
      sliver: SliverToBoxAdapter(
        child: TrackOrderArrivalCard(order: order),
      ),
    );
  }
}
