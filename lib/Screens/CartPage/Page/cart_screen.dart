import 'package:bite_food_delivery/Cubits/AddressCubit/address_cubit.dart';
import 'package:bite_food_delivery/Cubits/CartCubit/cart_cubit.dart';
import 'package:bite_food_delivery/GlobalWidgets/bite_app_bar.dart';
import 'package:bite_food_delivery/GlobalWidgets/bite_address_selector_modal.dart';
import 'package:bite_food_delivery/Models/cart_item_model.dart';
import 'package:bite_food_delivery/Screens/CartPage/Widgets/bite_cart_item_card.dart';
import 'package:bite_food_delivery/configs/firebase_auth_conn.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  void initState() {
    super.initState();

    final user = getCurrentUser();
    if (user != null) {
      context.read<CartCubit>().initialize(user.uid);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 2, 30, 46),
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
          return const Center(child: CircularProgressIndicator());
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
              decoration: BoxDecoration(color: Colors.white),
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
                          'DELIVERY ADDRESS',
                          style: GoogleFonts.sen(
                            fontSize: 15.sp,
                            color: Colors.grey.shade400,
                          ),
                        ),
                        Spacer(),
                        BlocBuilder<AddressCubit, AddressState>(
                          builder: (context, addressState) {
                            return TextButton(
                              onPressed: () =>
                                  showAddressSelectorModal(context),
                              child: Text(
                                'EDIT',
                                style: GoogleFonts.sen(
                                  fontSize: 15.sp,
                                  color: Colors.deepOrange,
                                  decoration: TextDecoration.underline,
                                  decorationColor: Colors.deepOrange,
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
                            hintText: 'Select an address',
                            filled: true,
                            fillColor: Colors.grey.shade100,
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
                          'TOTAL : ',
                          style: GoogleFonts.sen(fontSize: 15.sp),
                        ),
                        Text(
                          'PKR ${totalAmount.toStringAsFixed(2)}',
                          style: GoogleFonts.sen(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.bold,
                            color: Colors.deepOrange,
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
                              backgroundColor: Colors.deepOrange,
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
                              'CHECKOUT',
                              style: GoogleFonts.sen(
                                fontSize: 15.sp,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
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
            child: Center(child: CircularProgressIndicator()),
          );
        } else if (state is CartError) {
          return Expanded(flex: 2, child: Center(child: Text(state.message)));
        } else if (state is CartEmpty) {
          return Expanded(
            flex: 2,
            child: Center(
              child: Text(
                'Your cart is empty',
                style: GoogleFonts.sen(fontSize: 18.sp, color: Colors.white),
              ),
            ),
          );
        } else if (state is CartLoaded) {
          if (state.cart.cartItems.isEmpty) {
            return Expanded(
              flex: 2,
              child: Center(
                child: Text(
                  'Your cart is empty',
                  style: GoogleFonts.sen(fontSize: 18.sp, color: Colors.white),
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
              'Initializing cart...',
              style: GoogleFonts.sen(fontSize: 18.sp, color: Colors.white),
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
        'Cart',
        style: GoogleFonts.sen(
          fontSize: 30.sp,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
      actions: [],
    );
  }
}
