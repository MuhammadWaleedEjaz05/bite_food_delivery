import 'package:material_ui/material_ui.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bite_food_delivery/features/cart/bloc/cart_cubit.dart';
import 'package:bite_food_delivery/l10n/app_localizations.dart';
import 'package:bite_food_delivery/core/extensions/responsive_extensions.dart';
import '../widgets/cart_summary_card.dart';
import 'package:bite_food_delivery/core/extensions/price_format.dart';

class CartSummarySection extends StatelessWidget {
  const CartSummarySection({super.key});
  @override
  Widget build(BuildContext context) => BlocBuilder<CartCubit, CartState>(
    builder: (context, state) {
      if (state is! CartLoaded) return const SliverToBoxAdapter();
      final t = AppLocalizations.of(context)!;
      return SliverPadding(
        padding: context.contentInsets(),
        sliver: SliverToBoxAdapter(
          child: CartSummaryCard(
            label: t.subtotal,
            amount: context.priceLabel(state.totalAmount),
            note: t.cartEstimate,
          ),
        ),
      );
    },
  );
}
