import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bite_food_delivery/features/checkout/bloc/checkout_cubit.dart';
import 'package:bite_food_delivery/features/cart/bloc/cart_cubit.dart';
import 'package:bite_food_delivery/l10n/app_localizations.dart';
import 'package:bite_food_delivery/core/extensions/responsive_extensions.dart';
import 'package:bite_food_delivery/widgets/app_primary_button.dart';
import 'package:bite_food_delivery/features/addresses/bloc/address_cubit.dart';
import 'package:bite_food_delivery/features/orders/bloc/order_cubit.dart';

class CheckoutActionSection extends StatelessWidget {
  const CheckoutActionSection({super.key});
  @override
  Widget build(BuildContext context) =>
      BlocConsumer<CheckoutCubit, CheckoutState>(
        listener: (context, state) {
          if (state.orderId != null) {
            context.read<OrderCubit>().loadOrderById(state.orderId!);
          }
        },
        builder: (context, state) {
          if (state.orderId != null || state.cardPending) {
            return const SizedBox.shrink();
          }
          final cart = context.watch<CartCubit>().state;
          final addresses = context.watch<AddressCubit>().state;
          final address = addresses is AddressesLoaded
              ? addresses.selectedAddress
              : null;
          final ready =
              cart is CartLoaded &&
              cart.validForCheckout &&
              address != null &&
              address.userID == cart.cart.userID;
          final c = context.read<CheckoutCubit>();
          final t = AppLocalizations.of(context)!;
          final VoidCallback? action;
          if (state.quote != null) {
            action = ready || state.failed ? c.place : null;
          } else if (ready) {
            action = () => c.review(cart.cart.cartID, address.addressID);
          } else {
            action = null;
          }
          return SafeArea(
            top: false,
            child: Padding(
              padding: context.contentInsets(top: 12, bottom: 12),
              child: AppPrimaryButton(
                label: state.quote == null ? t.checkoutReview : t.order,
                busy: state.busy,
                onTap: action,
              ),
            ),
          );
        },
      );
}
