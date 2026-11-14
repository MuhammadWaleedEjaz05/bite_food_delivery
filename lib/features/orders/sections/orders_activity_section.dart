import 'package:bite_food_delivery/features/orders/widgets/orders_guest_card.dart';
import 'package:material_ui/material_ui.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bite_food_delivery/l10n/app_localizations.dart';
import 'package:bite_food_delivery/widgets/app_feedback.dart';
import 'package:bite_food_delivery/app/routes/app_navigation.dart';
import 'package:bite_food_delivery/features/authentication/bloc/user_auth_cubit.dart';
import 'package:bite_food_delivery/features/orders/bloc/order_cubit.dart';

class OrdersActivitySection extends StatelessWidget {
  const OrdersActivitySection({super.key});
  @override
  Widget build(BuildContext context) => SliverToBoxAdapter(
    child: BlocBuilder<UserAuthCubit, UserAuthState>(
      builder: (context, session) {
        final text = AppLocalizations.of(context)!;
        if (session is! UserLoggedIn) {
          return const OrdersGuestCard();
        }
        return BlocBuilder<OrderCubit, OrderState>(
          builder: (context, state) {
            final orders = context.read<OrderCubit>();
            final active =
                orders.hasActiveOrder &&
                orders.activeOrder?.userId == session.user.id;
            return AppFeedback(
              message: active ? text.trackOrder : text.noOngoingOrders,
              actionLabel: active ? text.trackOrder : text.browseRestaurants,
              onAction: () => AppNavigation.push(
                context,
                active ? '/track_order_screen' : '/all_restaurants_screen',
              ),
              icon: Icons.delivery_dining,
            );
          },
        );
      },
    ),
  );
}
