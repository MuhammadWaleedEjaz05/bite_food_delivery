import 'package:material_ui/material_ui.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bite_food_delivery/core/di/di.dart';
import 'package:bite_food_delivery/features/checkout/bloc/checkout_cubit.dart';
import 'package:bite_food_delivery/features/checkout/pages/checkout_screen.dart';
import 'package:bite_food_delivery/features/cart/bloc/cart_cubit.dart';
import 'package:bite_food_delivery/features/addresses/bloc/address_cubit.dart';

class CheckoutScope extends StatelessWidget {
  const CheckoutScope({super.key});
  @override
  Widget build(BuildContext context) => BlocProvider(
    create: (_) => Di.sl<CheckoutCubit>(),
    child: MultiBlocListener(
      listeners: [
        BlocListener<CartCubit, CartState>(
          listener: (context, state) =>
              context.read<CheckoutCubit>().invalidate(),
        ),
        BlocListener<AddressCubit, AddressState>(
          listener: (context, state) =>
              context.read<CheckoutCubit>().invalidate(),
        ),
      ],
      child: const CheckoutScreen(),
    ),
  );
}
