import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bite_food_delivery/features/cart/bloc/cart_cubit.dart';
import 'package:bite_food_delivery/l10n/app_localizations.dart';
import 'package:bite_food_delivery/core/extensions/responsive_extensions.dart';
import 'package:bite_food_delivery/widgets/app_primary_button.dart';
import 'package:bite_food_delivery/app/routes/app_navigation.dart';

class CartCheckoutSection extends StatelessWidget {
  const CartCheckoutSection({super.key});
  @override
  Widget build(BuildContext context) => BlocBuilder<CartCubit, CartState>(
    builder: (context, state) {
      if (state is! CartLoaded) return const SizedBox.shrink();
      return SafeArea(
        top: false,
        child: Padding(
          padding: context.contentInsets(top: 12, bottom: 12),
          child: AppPrimaryButton(
            label: AppLocalizations.of(context)!.checkout,
            busy: state.pending.isNotEmpty,
            onTap: state.validForCheckout
                ? () => AppNavigation.push(context, '/checkout_screen')
                : null,
          ),
        ),
      );
    },
  );
}
