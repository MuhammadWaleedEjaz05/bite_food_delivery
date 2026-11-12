import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bite_food_delivery/features/checkout/bloc/checkout_cubit.dart';
import 'package:bite_food_delivery/l10n/app_localizations.dart';
import 'package:bite_food_delivery/core/extensions/responsive_extensions.dart';
import '../widgets/checkout_totals_card.dart';
import 'package:bite_food_delivery/core/extensions/price_format.dart';

class CheckoutTotalsSection extends StatelessWidget {
  const CheckoutTotalsSection({super.key});
  @override
  Widget build(BuildContext context) {
    final quote = context.watch<CheckoutCubit>().state.quote;
    final t = AppLocalizations.of(context)!;
    if (quote == null) return const SliverToBoxAdapter();
    return SliverPadding(
      padding: context.contentInsets(),
      sliver: SliverToBoxAdapter(
        child: CheckoutTotalsCard(
          rows: {
            t.subtotal: context.priceLabel(quote.subtotalMinor / 100),
            t.deliveryFee: context.priceLabel(quote.deliveryMinor / 100),
            t.platformFee: context.priceLabel(quote.platformFeeMinor / 100),
            t.total: context.priceLabel(quote.totalMinor / 100),
          },
        ),
      ),
    );
  }
}
