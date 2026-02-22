import 'package:bite_food_delivery/Cubits/AddressCubit/address_cubit.dart';
import 'package:bite_food_delivery/Cubits/CartCubit/cart_cubit.dart';
import 'package:bite_food_delivery/Cubits/PaymentCubit/payment_method_selector_cubit.dart';
import 'package:bite_food_delivery/Cubits/RestaurantsCubit/restaurants_cubit.dart';
import 'package:bite_food_delivery/GlobalWidgets/bite_app_bar.dart';
import 'package:bite_food_delivery/GlobalWidgets/bite_address_selector_modal.dart';
import 'package:bite_food_delivery/Models/credit_card_model.dart';
import 'package:bite_food_delivery/Screens/CheckOutPage/Widgets/bite_check_out_payment_block.dart';
import 'package:bite_food_delivery/Screens/CheckOutPage/Widgets/bite_checkout_item_tile.dart';
import 'package:bite_food_delivery/Screens/CheckOutPage/Widgets/bite_summary_row.dart';
import 'package:bite_food_delivery/Screens/CheckOutPage/Widgets/bite_check_out_address_block.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

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
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: BiteAppBar(
        backButton: true,
        title: Text(
          'Checkout',
          style: GoogleFonts.sen(
            fontSize: 30.sp,
            fontWeight: FontWeight.bold,
            color: Theme.of(context).primaryColor,
          ),
        ),
        actions: [],
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        children: [
          10.verticalSpace,
          _DeliveryAddressSection(),
          25.verticalSpace,
          _OrderItemsSection(),
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
              color: Theme.of(context).primaryColor,
              size: 22.r,
            ),
            8.horizontalSpace,
            Text(
              'Delivery Address',
              style: GoogleFonts.sen(
                fontSize: 18.sp,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            Spacer(),
            TextButton(
              onPressed: () => showAddressSelectorModal(context),
              child: Text(
                'Change',
                style: GoogleFonts.sen(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).primaryColor,
                  decoration: TextDecoration.underline,
                  decorationColor: Theme.of(context).primaryColor,
                ),
              ),
            ),
          ],
        ),
        8.verticalSpace,
        BlocBuilder<AddressCubit, AddressState>(
          builder: (context, state) {
            String addressLabel = '';
            String addressText = 'No address selected';

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
              color: Theme.of(context).primaryColor,
              size: 22.r,
            ),
            8.horizontalSpace,
            Text(
              'Order Items',
              style: GoogleFonts.sen(
                fontSize: 18.sp,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
          ],
        ),
        12.verticalSpace,
        BlocBuilder<CartCubit, CartState>(
          builder: (context, state) {
            if (state is CartLoaded) {
              return Container(
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: ListView.separated(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  padding: EdgeInsets.symmetric(vertical: 5.h),
                  itemCount: state.cart.cartItems.length,
                  separatorBuilder: (context, index) => Divider(
                    color: Colors.grey.shade300,
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
            return SizedBox.shrink();
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
              color: Theme.of(context).primaryColor,
              size: 22.r,
            ),
            8.horizontalSpace,
            Text(
              'Payment Method',
              style: GoogleFonts.sen(
                fontSize: 18.sp,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            Spacer(),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/payment_screen');
              },
              child: Text(
                'Change',
                style: GoogleFonts.sen(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).primaryColor,
                  decoration: TextDecoration.underline,
                  decorationColor: Theme.of(context).primaryColor,
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
    final cartState = BlocProvider.of<CartCubit>(context).state;
    final restaurantsState = BlocProvider.of<RestaurantsCubit>(context).state;

    final double deliveryFee =
        restaurantsState is RestaurantsLoaded && cartState is CartLoaded
        ? (restaurantsState).restaurants
              .firstWhere(
                (r) =>
                    r.id == (cartState).cart.cartItems[0].product.RestuarantId,
              )
              .deliveryFee
        : 100.0;
    final double platformFee = 20.0;
    final double grandTotal = totalAmount + deliveryFee + platformFee;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(
              Icons.receipt_long_outlined,
              color: Theme.of(context).primaryColor,
              size: 22.r,
            ),
            8.horizontalSpace,
            Text(
              'Order Summary',
              style: GoogleFonts.sen(
                fontSize: 18.sp,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
          ],
        ),
        12.verticalSpace,
        Container(
          padding: EdgeInsets.all(15.r),
          decoration: BoxDecoration(
            color: Colors.grey.shade100,
            borderRadius: BorderRadius.circular(12.r),
          ),
          child: Column(
            children: [
              BiteSummaryRow(
                label: 'Subtotal',
                value: 'PKR ${totalAmount.toStringAsFixed(2)}',
              ),
              10.verticalSpace,
              BiteSummaryRow(
                label: 'Delivery Fee',
                value: 'PKR ${deliveryFee.toStringAsFixed(2)}',
              ),
              10.verticalSpace,
              BiteSummaryRow(
                label: 'Platform Fee',
                value: 'PKR ${platformFee.toStringAsFixed(2)}',
              ),
              12.verticalSpace,
              Divider(color: Colors.grey.shade300, height: 1),
              12.verticalSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Total',
                    style: GoogleFonts.sen(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  Text(
                    'PKR ${grandTotal.toStringAsFixed(2)}',
                    style: GoogleFonts.sen(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).primaryColor,
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

  @override
  Widget build(BuildContext context) {
    final cartState = BlocProvider.of<CartCubit>(context).state;
    final restaurantsState = BlocProvider.of<RestaurantsCubit>(context).state;

    final double deliveryFee =
        restaurantsState is RestaurantsLoaded && cartState is CartLoaded
        ? (restaurantsState).restaurants
              .firstWhere(
                (r) =>
                    r.id == (cartState).cart.cartItems[0].product.RestuarantId,
              )
              .deliveryFee
        : 100.0;
    final double platformFee = 20.0;
    final double grandTotal = totalAmount + deliveryFee + platformFee;

    return Row(
      children: [
        Expanded(
          child: ElevatedButton(
            onPressed: () {
              showDialog(
                context: context,
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
                          color: Theme.of(context).primaryColor.withAlpha(25),
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.check_circle_outline,
                          color: Theme.of(context).primaryColor,
                          size: 60.r,
                        ),
                      ),
                      20.verticalSpace,
                      Text(
                        'Order Placed!',
                        style: GoogleFonts.sen(
                          fontSize: 24.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                      10.verticalSpace,
                      Text(
                        'Your order has been placed successfully.\nYou can track your order in order history.',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.sen(
                          fontSize: 14.sp,
                          color: Colors.grey.shade600,
                        ),
                      ),
                      25.verticalSpace,
                      Row(
                        children: [
                          Expanded(
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.of(ctx).pop();
                                Navigator.of(
                                  context,
                                ).popUntil((route) => route.isFirst);
                              },
                              style: ElevatedButton.styleFrom(
                                padding: EdgeInsets.symmetric(vertical: 12.h),
                                backgroundColor: Theme.of(context).primaryColor,
                                foregroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.r),
                                ),
                              ),
                              child: Text(
                                'Back to Home',
                                style: GoogleFonts.sen(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.bold,
                                ),
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
            },
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(vertical: 14.h),
              backgroundColor: Theme.of(context).primaryColor,
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.r),
              ),
              elevation: 2,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.shopping_cart_checkout, size: 22.r),
                10.horizontalSpace,
                Text(
                  'Place Order  •  PKR ${grandTotal.toStringAsFixed(0)}',
                  style: GoogleFonts.sen(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
