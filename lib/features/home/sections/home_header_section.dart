import 'package:bite_food_delivery/app/routes/app_navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bite_food_delivery/l10n/app_localizations.dart';
import 'package:bite_food_delivery/widgets/custom_app_bar.dart';
import 'package:bite_food_delivery/features/home/widgets/delivery_location_button.dart';
import 'package:bite_food_delivery/features/home/widgets/home_cart_button.dart';
import 'package:bite_food_delivery/features/addresses/bloc/address_cubit.dart';
import 'package:bite_food_delivery/features/cart/bloc/cart_cubit.dart';
import 'package:bite_food_delivery/features/addresses/widgets/address_selector_modal.dart';

class HomeHeaderSection extends StatelessWidget {
  const HomeHeaderSection({super.key});
  @override
  Widget build(BuildContext context) => CustomSliverAppBar(
    title: BlocBuilder<AddressCubit, AddressState>(
      builder: (context, state) => DeliveryLocationButton(
        label: AppLocalizations.of(context)!.homeDeliverTo,
        address: state is AddressesLoaded
            ? state.selectedAddress?.street ??
                  AppLocalizations.of(context)!.selectDeliveryAddress
            : state is AddressSelected
            ? state.selectedAddress.street
            : AppLocalizations.of(context)!.selectDeliveryAddress,
        onTap: () => showAddressSelectorModal(context),
      ),
    ),
    actions: [
      BlocBuilder<CartCubit, CartState>(
        builder: (context, state) => HomeCartButton(
          count: state is CartLoaded ? state.totalItems : 0,
          label: AppLocalizations.of(context)!.cart,
          onTap: () => AppNavigation.push(context, '/cart_screen'),
        ),
      ),
    ],
  );
}
