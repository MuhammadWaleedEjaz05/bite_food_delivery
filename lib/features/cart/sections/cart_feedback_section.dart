import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bite_food_delivery/features/cart/bloc/cart_cubit.dart';
import 'package:bite_food_delivery/l10n/app_localizations.dart';
import 'package:bite_food_delivery/core/extensions/responsive_extensions.dart';
import 'package:bite_food_delivery/widgets/app_feedback.dart';
import 'package:bite_food_delivery/app/routes/app_navigation.dart';

class CartFeedbackSection extends StatelessWidget {
  const CartFeedbackSection({super.key});
  @override
  Widget build(BuildContext context) => BlocBuilder<CartCubit, CartState>(
    builder: (context, state) {
      final t = AppLocalizations.of(context)!;
      return SliverPadding(
        padding: context.contentInsets(),
        sliver: SliverToBoxAdapter(
          child: state is CartLoading || state is CartInitial
              ? const AppLoadingCard()
              : state is CartError || (state is CartLoaded && state.failed)
              ? AppFeedback(
                  message: t.cartChangeFailed,
                  actionLabel: t.retryAction,
                  onAction: context.read<CartCubit>().retry,
                )
              : state is CartEmpty
              ? AppFeedback(
                  message: t.yourCartIsEmpty,
                  actionLabel: t.browseRestaurants,
                  onAction: () =>
                      AppNavigation.push(context, '/all_restaurants_screen'),
                )
              : state is CartLoaded &&
                    !state.validForCheckout &&
                    state.pending.isEmpty
              ? AppFeedback(message: t.cartNeedsReview)
              : const SizedBox.shrink(),
        ),
      );
    },
  );
}
