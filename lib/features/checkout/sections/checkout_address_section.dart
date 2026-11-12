import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bite_food_delivery/features/checkout/bloc/checkout_cubit.dart';
import 'package:bite_food_delivery/features/cart/bloc/cart_cubit.dart';
import 'package:bite_food_delivery/l10n/app_localizations.dart';
import 'package:bite_food_delivery/core/extensions/responsive_extensions.dart';
import 'package:bite_food_delivery/widgets/app_feedback.dart';
import 'package:bite_food_delivery/features/addresses/bloc/address_cubit.dart';
import 'package:bite_food_delivery/src/shared/widgets/bite_address_selector_modal.dart';

class CheckoutAddressSection extends StatelessWidget {
  const CheckoutAddressSection({super.key});
  @override
  Widget build(BuildContext context) {
    final addresses = context.watch<AddressCubit>().state;
    final cart = context.watch<CartCubit>().state;
    final checkout = context.watch<CheckoutCubit>().state;
    final address = addresses is AddressesLoaded
        ? addresses.selectedAddress
        : null;
    final owned =
        address != null &&
        cart is CartLoaded &&
        address.userID == cart.cart.userID;
    final t = AppLocalizations.of(context)!;
    return SliverPadding(
      padding: context.contentInsets(),
      sliver: SliverToBoxAdapter(
        child: AppFeedback(
          icon: Icons.location_on_outlined,
          message:
              checkout.quote?.deliveryAddress ??
              (owned
                  ? '${address.label} · ${address.street}, ${address.city}, ${address.country}'
                  : t.selectAnAddress),
          actionLabel: t.deliveryAddress2,
          onAction:
              checkout.busy ||
                  checkout.cardPending ||
                  checkout.orderId != null ||
                  (checkout.failed && checkout.quote != null)
              ? null
              : () => showAddressSelectorModal(context),
        ),
      ),
    );
  }
}
