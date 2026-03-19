import 'package:bite_food_delivery/src/features/address_management/cubits/address_cubit/address_cubit.dart';
import 'package:bite_food_delivery/src/features/cart/cubits/cart_cubit/cart_cubit.dart';
import 'package:bite_food_delivery/src/features/order_management_and_history/cubits/order_cubit/order_cubit.dart';
import 'package:bite_food_delivery/src/features/payment/cubits/payment_cubit/payment_cubit.dart';
import 'package:bite_food_delivery/src/features/payment/cubits/payment_cubit/payment_method_selector_cubit.dart';
import 'package:bite_food_delivery/src/features/restaurants/cubits/restaurants_cubit/restaurants_cubit.dart';
import 'package:bite_food_delivery/src/features/authentication/cubits/user_auth_cubit/user_auth_cubit.dart';
import 'package:bite_food_delivery/src/shared/widgets/bite_app_bar.dart';
import 'package:bite_food_delivery/src/shared/widgets/bite_address_selector_modal.dart';
import 'package:bite_food_delivery/src/features/payment/models/credit_card_model.dart';
import 'package:bite_food_delivery/src/features/order_management_and_history/models/order_model.dart';
import 'package:bite_food_delivery/src/features/checkout/widgets/bite_check_out_payment_block.dart';
import 'package:bite_food_delivery/src/features/checkout/widgets/bite_checkout_item_tile.dart';
import 'package:bite_food_delivery/src/features/checkout/widgets/bite_summary_row.dart';
import 'package:bite_food_delivery/src/features/checkout/widgets/bite_check_out_address_block.dart';
import 'package:bite_food_delivery/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class CheckOutScreen extends StatelessWidget {
  const CheckOutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>? ??
        {};
    final String cartID = args['cartID'] as String? ?? '';
    final double totalAmount = (args['totalAmount'] as num?)?.toDouble() ?? 0;

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: BiteAppBar(
        backButton: true,
        title: Text(
          AppLocalizations.of(context)!.checkout,
          style: Theme.of(context).textTheme.displaySmall!.copyWith(
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
        actions: const [],
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        children: [
          10.verticalSpace,
          const _DeliveryAddressSection(),
          25.verticalSpace,
          const _OrderItemsSection(),
          25.verticalSpace,
          _PaymentMethodSection(context),
          25.verticalSpace,
          _OrderSummarySection(totalAmount: totalAmount),
          30.verticalSpace,
          _PlaceOrderButton(cartID: cartID, totalAmount: totalAmount),
          30.verticalSpace,
        ],
      ),
    );
  }
}

class _DeliveryAddressSection extends StatelessWidget {
  const _DeliveryAddressSection();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(
              Icons.location_on_outlined,
              color: Theme.of(context).colorScheme.primary,
              size: 22.r,
            ),
            8.horizontalSpace,
            Text(
              AppLocalizations.of(context)!.deliveryAddress,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const Spacer(),
            TextButton(
              onPressed: () => showAddressSelectorModal(context),
              child: Text(
                AppLocalizations.of(context)!.change,
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.primary,
                  decoration: TextDecoration.underline,
                  decorationColor: Theme.of(context).colorScheme.primary,
                ),
              ),
            ),
          ],
        ),
        8.verticalSpace,
        BlocBuilder<AddressCubit, AddressState>(
          builder: (context, state) {
            String addressLabel = '';
            String addressText = AppLocalizations.of(
              context,
            )!.noAddressSelected;

            if (state is AddressesLoaded && state.selectedAddress != null) {
              final addr = state.selectedAddress!;
              addressLabel = addr.label;
              addressText =
                  '${addr.street}, ${addr.city}, ${addr.zipCode}, ${addr.country}';
            }

            return BiteCheckOutAddressBlock(
              addressLabel: addressLabel,
              addressText: addressText,
            );
          },
        ),
      ],
    );
  }
}

class _OrderItemsSection extends StatelessWidget {
  const _OrderItemsSection();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(
              Icons.shopping_bag_outlined,
              color: Theme.of(context).colorScheme.primary,
              size: 22.r,
            ),
            8.horizontalSpace,
            Text(
              AppLocalizations.of(context)!.orderItems,
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ],
        ),
        12.verticalSpace,
        BlocBuilder<CartCubit, CartState>(
          builder: (context, state) {
            if (state is CartLoaded) {
              return Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.onSecondaryFixed,
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  padding: EdgeInsets.symmetric(vertical: 5.h),
                  itemCount: state.cart.cartItems.length,
                  separatorBuilder: (context, index) => Divider(
                    color: Theme.of(
                      context,
                    ).colorScheme.onSecondaryFixedVariant,
                    height: 1,
                    indent: 15.w,
                    endIndent: 15.w,
                  ),
                  itemBuilder: (context, index) {
                    final item = state.cart.cartItems[index];
                    return BiteCheckoutItemTile(item: item);
                  },
                ),
              );
            }
            return const SizedBox.shrink();
          },
        ),
      ],
    );
  }
}

class _PaymentMethodSection extends StatelessWidget {
  final BuildContext parentContext;
  const _PaymentMethodSection(this.parentContext);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(
              Icons.payment_outlined,
              color: Theme.of(context).colorScheme.primary,
              size: 22.r,
            ),
            8.horizontalSpace,
            Text(
              AppLocalizations.of(context)!.paymentMethod,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const Spacer(),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/payment_screen');
              },
              child: Text(
                AppLocalizations.of(context)!.change,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.primary,
                  decoration: TextDecoration.underline,
                  decorationColor: Theme.of(context).colorScheme.primary,
                ),
              ),
            ),
          ],
        ),
        8.verticalSpace,
        BlocBuilder<PaymentMethodSelectorCubit, CreditCardModel>(
          builder: (context, state) {
            return BiteCheckOutPaymentBlock(creditCard: state);
          },
        ),
      ],
    );
  }
}

class _OrderSummarySection extends StatelessWidget {
  final double totalAmount;
  const _OrderSummarySection({required this.totalAmount});

  @override
  Widget build(BuildContext context) {
    final cartState = context.read<CartCubit>().state;
    final restaurantsState = context.read<RestaurantsCubit>().state;

    final double deliveryFee =
        restaurantsState is RestaurantsLoaded && cartState is CartLoaded
        ? (restaurantsState).restaurants
              .firstWhere(
                (r) =>
                    r.id == (cartState).cart.cartItems[0].product.RestuarantId,
              )
              .deliveryFee
        : 100.0;
    const double platformFee = 20.0;
    final double grandTotal = totalAmount + deliveryFee + platformFee;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(
              Icons.receipt_long_outlined,
              color: Theme.of(context).colorScheme.primary,
              size: 22.r,
            ),
            8.horizontalSpace,
            Text(
              AppLocalizations.of(context)!.orderSummary,
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ],
        ),
        12.verticalSpace,
        Container(
          padding: EdgeInsets.all(15.r),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.onSecondaryFixed,
            borderRadius: BorderRadius.circular(12.r),
          ),
          child: Column(
            children: [
              BiteSummaryRow(
                label: AppLocalizations.of(context)!.subtotal,
                value: 'PKR ${totalAmount.toStringAsFixed(2)}',
              ),
              10.verticalSpace,
              BiteSummaryRow(
                label: AppLocalizations.of(context)!.deliveryFee,
                value: 'PKR ${deliveryFee.toStringAsFixed(2)}',
              ),
              10.verticalSpace,
              BiteSummaryRow(
                label: AppLocalizations.of(context)!.platformFee,
                value: 'PKR ${platformFee.toStringAsFixed(2)}',
              ),
              12.verticalSpace,
              Divider(color: Colors.grey.shade300, height: 1),
              12.verticalSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    AppLocalizations.of(context)!.total,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  Text(
                    'PKR ${grandTotal.toStringAsFixed(2)}',
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _PlaceOrderButton extends StatelessWidget {
  final String cartID;
  final double totalAmount;
  const _PlaceOrderButton({required this.cartID, required this.totalAmount});

  OrderModel _buildOrder(BuildContext context, double grandTotal) {
    final cartState = context.read<CartCubit>().state;
    final userState = context.read<UserAuthCubit>().state;
    final addressState = context.read<AddressCubit>().state;
    final paymentMethod = context.read<PaymentMethodSelectorCubit>().state;

    final String userId = userState is UserLoggedIn
        ? (userState.user.id ?? '')
        : '';
    final String addressId =
        addressState is AddressesLoaded && addressState.selectedAddress != null
        ? addressState.selectedAddress!.addressID
        : '';
    final String restaurantId =
        cartState is CartLoaded && cartState.cart.cartItems.isNotEmpty
        ? cartState.cart.cartItems[0].product.RestuarantId
        : '';

    return OrderModel(
      userId: userId,
      restaurantId: restaurantId,
      cartID: cartID,
      totalPrice: grandTotal,
      deliveryAddressId: addressId,
      paymentMethod: paymentMethod.cardType,
    );
  }

  void _showTrackOrderDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (ctx) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.r),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            20.verticalSpace,
            Container(
              padding: EdgeInsets.all(20.r),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary.withAlpha(25),
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.check_circle_outline,
                color: Theme.of(context).colorScheme.primary,
                size: 60.r,
              ),
            ),
            20.verticalSpace,
            Text(
              AppLocalizations.of(context)!.orderPlaced,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            10.verticalSpace,
            Text(
              AppLocalizations.of(context)!
                  .yourOrderHasBeenPlacedSuccessfullyntrackYourOrderInRealtime,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                color: Theme.of(context).colorScheme.onSecondary,
              ),
            ),
            25.verticalSpace,
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(ctx).pop();
                      Navigator.of(context).popUntil((route) => route.isFirst);
                      Navigator.of(context).pushNamed('/track_order_screen');
                    },
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(vertical: 12.h),
                      backgroundColor: Theme.of(context).colorScheme.primary,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                    ),
                    child: Text(
                      AppLocalizations.of(context)!.trackOrder,
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                  ),
                ),
                12.horizontalSpace,
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(ctx).pop();
                      Navigator.of(context).popUntil((route) => route.isFirst);
                    },
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(vertical: 12.h),
                      backgroundColor: Theme.of(context).colorScheme.surface,
                      foregroundColor: Theme.of(context).colorScheme.primary,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.r),
                        side: BorderSide(
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                    ),
                    child: Text(
                      AppLocalizations.of(context)!.backToHome,
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                  ),
                ),
              ],
            ),
            10.verticalSpace,
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final cartState = context.read<CartCubit>().state;
    final restaurantsState = context.read<RestaurantsCubit>().state;

    final double deliveryFee =
        restaurantsState is RestaurantsLoaded && cartState is CartLoaded
        ? (restaurantsState).restaurants
              .firstWhere(
                (r) =>
                    r.id == (cartState).cart.cartItems[0].product.RestuarantId,
              )
              .deliveryFee
        : 100.0;
    const double platformFee = 20.0;
    final double grandTotal = totalAmount + deliveryFee + platformFee;

    return Row(
      children: [
        Expanded(
          child: MultiBlocListener(
            listeners: [
              BlocListener<PaymentCubit, PaymentState>(
                listener: (context, paymentState) {
                  if (paymentState is PaymentSuccess) {
                    final order = _buildOrder(context, grandTotal);
                    context.read<OrderCubit>().placeOrder(order);
                  } else if (paymentState is PaymentFailure) {
                    showTopSnackBar(
                      Overlay.of(context),
                      CustomSnackBar.error(message: paymentState.errorMessage),
                    );
                  }
                },
              ),
              BlocListener<OrderCubit, OrderState>(
                listener: (context, orderState) {
                  if (orderState is OrderPlaced) {
                    _showTrackOrderDialog(context);
                  } else if (orderState is OrderError) {
                    showTopSnackBar(
                      Overlay.of(context),
                      CustomSnackBar.error(message: orderState.message),
                    );
                  }
                },
              ),
            ],
            child: BlocBuilder<PaymentCubit, PaymentState>(
              builder: (context, paymentState) {
                return BlocBuilder<OrderCubit, OrderState>(
                  builder: (context, orderState) {
                    final bool isLoading =
                        paymentState is PaymentProcessing ||
                        orderState is OrderLoading;

                    return ElevatedButton(
                      onPressed: isLoading
                          ? null
                          : () {
                              final paymentMethod = context
                                  .read<PaymentMethodSelectorCubit>()
                                  .state;

                              final bool isCardPayment =
                                  paymentMethod.cardType !=
                                  CreditCardType.onCash;

                              if (isCardPayment) {
                                context.read<PaymentCubit>().processPayment(
                                  grandTotal.toInt(),
                                  'usd',
                                  paymentMethod.customerId,
                                );
                              } else {
                                final order = _buildOrder(context, grandTotal);
                                context.read<OrderCubit>().placeOrder(order);
                              }
                            },
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(vertical: 14.h),
                        backgroundColor: Theme.of(context).colorScheme.primary,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                        elevation: 2,
                      ),
                      child: isLoading
                          ? SizedBox(
                              height: 22.r,
                              width: 22.r,
                              child: Lottie.asset(
                                'assets/animations/loading.json',
                                height: 75.h,
                                width: 75.w,
                              ),
                            )
                          : Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.shopping_cart_checkout, size: 22.r),
                                10.horizontalSpace,
                                Text(
                                  AppLocalizations.of(context)!.confirmPayment(
                                    grandTotal.toStringAsFixed(0),
                                  ),
                                  style: Theme.of(context).textTheme.titleLarge!
                                      .copyWith(color: Colors.white),
                                ),
                              ],
                            ),
                    );
                  },
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
