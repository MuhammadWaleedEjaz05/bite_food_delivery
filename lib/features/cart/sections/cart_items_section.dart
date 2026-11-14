import 'package:material_ui/material_ui.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bite_food_delivery/features/cart/bloc/cart_cubit.dart';
import 'package:bite_food_delivery/l10n/app_localizations.dart';
import 'package:bite_food_delivery/core/extensions/responsive_extensions.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:bite_food_delivery/features/cart/widgets/cart_line_card.dart';
import 'package:bite_food_delivery/widgets/app_staggered_entrance.dart';
import 'package:bite_food_delivery/core/extensions/price_format.dart';

class CartItemsSection extends StatelessWidget {
  const CartItemsSection({super.key});
  @override
  Widget build(BuildContext context) => BlocBuilder<CartCubit, CartState>(
    builder: (context, state) {
      if (state is! CartLoaded) return const SliverToBoxAdapter();
      final t = AppLocalizations.of(context)!;
      return SliverPadding(
        padding: context.contentInsets(),
        sliver: SliverList.separated(
          itemCount: state.cartItems.length,
          separatorBuilder: (_, _) => 12.verticalSpace,
          itemBuilder: (context, index) {
            final line = state.cartItems[index];
            final busy = state.pending.contains(line.documentID);
            void change(int quantity) =>
                context.read<CartCubit>().updateCartItem(
                  cartID: state.cart.cartID,
                  cartItem: line.copyWith(quantity: quantity),
                );
            return AppStaggeredEntrance(
              index: index,
              child: CartLineCard(
                key: ValueKey(line.documentID),
                name: line.product.name,
                options: [
                  line.selectedSize,
                  (line.selectedFlavors ?? []).isNotEmpty
                      ? line.selectedFlavors!.join(', ')
                      : line.selectedFlavor,
                ].whereType<String>().where((v) => v.isNotEmpty).join(' · '),
                imageUrl: line.product.images.firstOrNull ?? '',
                price: context.priceLabel(line.totalPrice),
                quantity: line.quantity,
                quantityLabel: t.quantityLabel,
                increaseLabel: t.increaseQuantity,
                decreaseLabel: line.quantity == 1
                    ? t.removeFromCart
                    : t.decreaseQuantity,
                onIncrease: busy || line.quantity >= 99
                    ? null
                    : () => change(line.quantity + 1),
                onDecrease: busy ? null : () => change(line.quantity - 1),
              ),
            );
          },
        ),
      );
    },
  );
}
