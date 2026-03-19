import 'package:bite_food_delivery/src/features/address_management/cubits/address_cubit/address_cubit.dart';
import 'package:bite_food_delivery/src/features/cart/cubits/cart_cubit/cart_cubit.dart';
import 'package:bite_food_delivery/src/shared/widgets/bite_app_bar.dart';
import 'package:bite_food_delivery/src/shared/widgets/bite_address_selector_modal.dart';
import 'package:bite_food_delivery/src/features/cart/models/cart_item_model.dart';
import 'package:bite_food_delivery/src/features/cart/widgets/bite_cart_item_card.dart';
import 'package:bite_food_delivery/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color.fromARGB(255, 2, 30, 46),
      appBar: _AppBarSection(),
      body: Column(children: [_CartSection(), _CheckOutSection()]),
    );
  }
}

class _CheckOutSection extends StatelessWidget {
  const _CheckOutSection();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        if (state is CartLoading) {
          return Center(
            child: Lottie.asset(
              'assets/animations/loading.json',
              height: 75.h,
              width: 75.w,
            ),
          );
        } else if (state is CartError) {
          return Center(child: Text(state.message));
        } else if (state is CartEmpty) {
          return const SizedBox.shrink();
        }

        List<CartItemModel>? cartItems;
        double totalAmount = 0;

        if (state is CartLoaded) {
          cartItems = state.cart.cartItems;
          totalAmount = state.totalAmount;
        }

        if (cartItems == null || cartItems.isEmpty) {
          return const SizedBox.shrink();
        }

        return Expanded(
          child: ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25.r),
              topRight: Radius.circular(25.r),
            ),
            child: Container(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surface,
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 15.w,
                  vertical: 7.5.h,
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          AppLocalizations.of(context)!.deliveryAddress2,
                          style: Theme.of(context).textTheme.bodyMedium!
                              .copyWith(
                                color: Theme.of(
                                  context,
                                ).colorScheme.onSecondary,
                              ),
                        ),
                        const Spacer(),
                        BlocBuilder<AddressCubit, AddressState>(
                          builder: (context, addressState) {
                            return TextButton(
                              onPressed: () =>
                                  showAddressSelectorModal(context),
                              child: Text(
                                AppLocalizations.of(context)!.edit2,
                                style: Theme.of(context).textTheme.bodyMedium!
                                    .copyWith(
                                      color: Theme.of(
                                        context,
                                      ).colorScheme.primary,
                                      decoration: TextDecoration.underline,
                                      decorationColor: Theme.of(
                                        context,
                                      ).colorScheme.primary,
                                      decorationThickness: 2,
                                    ),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                    10.verticalSpace,
                    BlocBuilder<AddressCubit, AddressState>(
                      builder: (context, addressState) {
                        String addressText = '';
                        if (addressState is AddressesLoaded &&
                            addressState.selectedAddress != null) {
                          final addr = addressState.selectedAddress!;
                          addressText =
                              '${addr.street}, ${addr.city}, ${addr.zipCode}, ${addr.country}';
                        }

                        return TextField(
                          readOnly: true,
                          decoration: InputDecoration(
                            hintText: AppLocalizations.of(
                              context,
                            )!.selectAnAddress,
                            filled: true,
                            fillColor: Theme.of(
                              context,
                            ).colorScheme.onSecondaryFixed,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.r),
                              borderSide: BorderSide.none,
                            ),
                          ),
                          controller: TextEditingController(text: addressText),
                        );
                      },
                    ),
                    10.verticalSpace,
                    Row(
                      children: [
                        Text(
                          AppLocalizations.of(context)!.total2,
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        Text(
                          'PKR ${totalAmount.toStringAsFixed(2)}',
                          style: Theme.of(context).textTheme.titleLarge!
                              .copyWith(
                                color: Theme.of(context).colorScheme.primary,
                              ),
                        ),
                      ],
                    ),
                    10.verticalSpace,
                    Row(
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Theme.of(
                                context,
                              ).colorScheme.primary,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.r),
                              ),
                            ),
                            onPressed: () {
                              Navigator.pushNamed(
                                context,
                                '/checkout_screen',
                                arguments: {
                                  'cartID': state is CartLoaded
                                      ? state.cart.cartID
                                      : '',
                                  'totalAmount': totalAmount,
                                },
                              );
                            },
                            child: Text(
                              AppLocalizations.of(context)!.checkout2,
                              style: Theme.of(context).textTheme.bodyMedium!
                                  .copyWith(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class _CartSection extends StatelessWidget {
  const _CartSection();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        if (state is CartLoading) {
          return Expanded(
            flex: 2,
            child: Center(
              child: Lottie.asset(
                'assets/animations/loading.json',
                height: 75.h,
                width: 75.w,
              ),
            ),
          );
        } else if (state is CartError) {
          return Expanded(flex: 2, child: Center(child: Text(state.message)));
        } else if (state is CartEmpty) {
          return Expanded(
            flex: 2,
            child: Center(
              child: Text(
                AppLocalizations.of(context)!.yourCartIsEmpty,
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
          );
        } else if (state is CartLoaded) {
          if (state.cart.cartItems.isEmpty) {
            return Expanded(
              flex: 2,
              child: Center(
                child: Text(
                  AppLocalizations.of(context)!.yourCartIsEmpty,
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
            );
          }

          return Expanded(
            flex: 2,
            child: Container(
              decoration: BoxDecoration(color: Colors.white.withAlpha(0)),
              child: ListView.separated(
                shrinkWrap: true,
                padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
                itemBuilder: (context, index) => BiteCartItemCard(
                  cartItem: state.cart.cartItems[index],
                  cartID: state.cart.cartID,
                ),
                separatorBuilder: (context, index) => 10.verticalSpace,
                itemCount: state.cart.cartItems.length,
              ),
            ),
          );
        }
        return Expanded(
          flex: 2,
          child: Center(
            child: Text(
              AppLocalizations.of(context)!.yourCartIsEmpty,
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.normal,
              ),
            ),
          ),
        );
      },
    );
  }
}

class _AppBarSection extends StatelessWidget implements PreferredSizeWidget {
  const _AppBarSection();
  @override
  Size get preferredSize => Size.fromHeight(100.h);
  @override
  Widget build(BuildContext context) {
    return BiteAppBar(
      isDarkMode: true,
      backButton: true,
      title: Text(
        AppLocalizations.of(context)!.cart,
        style: GoogleFonts.sen(
          fontSize: Theme.of(context).textTheme.displaySmall!.fontSize,
          fontWeight: Theme.of(context).textTheme.displaySmall!.fontWeight,
          color: Colors.white,
        ),
      ),
      actions: const [],
    );
  }
}
