import 'package:bite_food_delivery/Cubits/CartCubit/cart_cubit.dart';
import 'package:bite_food_delivery/Models/cart_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class BiteCartItemCard extends StatelessWidget {
  final CartModel cartItem;
  const BiteCartItemCard({super.key, required this.cartItem});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            width: 136.w,
            height: 170.h,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: CachedNetworkImageProvider(cartItem.productImage),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(25.r),
            ),
          ),
        ),
        20.horizontalSpace,
        SizedBox(
          width: 175.w,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                cartItem.productName,
                style: GoogleFonts.sen(fontSize: 25.sp, color: Colors.white),
                maxLines: 1,
                softWrap: true,
                overflow: TextOverflow.ellipsis,
              ),
              5.verticalSpace,
              Row(
                children: [
                  Text(
                    'PKR ${cartItem.productPrice}',
                    style: GoogleFonts.sen(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  Spacer(),
                ],
              ),
              15.verticalSpace,
              Row(
                spacing: 5.w,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () {
                      BlocProvider.of<CartCubit>(context).updateCartItem(
                        cartItem.copyWith(quantity: cartItem.quantity + 1),
                      );
                    },
                    style: IconButton.styleFrom(
                      backgroundColor: Colors.white.withAlpha(50),
                    ),
                    icon: Icon(Icons.add, color: Colors.white),
                  ),
                  Text(
                    cartItem.quantity.toString(),
                    style: GoogleFonts.sen(
                      fontSize: 25.sp,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      BlocProvider.of<CartCubit>(context).updateCartItem(
                        cartItem.copyWith(quantity: cartItem.quantity - 1),
                      );
                    },
                    style: IconButton.styleFrom(
                      backgroundColor: Colors.white.withAlpha(50),
                    ),
                    icon: Icon(Icons.remove, color: Colors.white),
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
