import 'package:material_ui/material_ui.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bite_food_delivery/features/checkout/bloc/checkout_cubit.dart';
import 'package:bite_food_delivery/features/cart/bloc/cart_cubit.dart';
import 'package:bite_food_delivery/l10n/app_localizations.dart';
import 'package:bite_food_delivery/core/extensions/responsive_extensions.dart';
import 'package:bite_food_delivery/widgets/app_feedback.dart';
import 'package:bite_food_delivery/app/routes/app_navigation.dart';

class CheckoutStatusSection extends StatelessWidget {
  const CheckoutStatusSection({super.key});
  @override
  Widget build(BuildContext context) {
    final state = context.watch<CheckoutCubit>().state;
    final cart = context.watch<CartCubit>().state;
    final t = AppLocalizations.of(context)!;
    return SliverPadding(
      padding: context.contentInsets(),
      sliver: SliverToBoxAdapter(
        child: state.orderId != null
            ? AppFeedback(
                message: t.orderPlaced,
                actionLabel: t.orderHistory,
                onAction: () =>
                    AppNavigation.push(context, '/order_history_screen'),
                icon: Icons.check_circle_outline,
              )
            : state.reviewing
            ? const AppLoadingCard()
            : AppFeedback(
                message: state.stale
                    ? t.checkoutChanged
                    : state.cardPending
                    ? t.cardPaymentPending
                    : state.failed
                    ? t.checkoutTryAgain
                    : cart is! CartLoaded || !cart.validForCheckout
                    ? t.cartNeedsReview
                    : t.checkoutCashNote,
                icon: Icons.receipt_long_outlined,
              ),
      ),
    );
  }
}
