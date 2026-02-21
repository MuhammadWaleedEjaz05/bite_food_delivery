import 'package:bite_food_delivery/Cubits/CartCubit/cart_cubit.dart';
import 'package:bite_food_delivery/Models/cart_item_model.dart';
import 'package:bite_food_delivery/Models/food_item_model.dart';
import 'package:bite_food_delivery/configs/firebase_auth_conn.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class BiteFoodCard extends StatelessWidget {
  final FoodItemModel foodItem;
  final String restaurantName;
  const BiteFoodCard({
    super.key,
    required this.foodItem,
    required this.restaurantName,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          '/food_item_screen',
          arguments: {'foodItem': foodItem, 'restaurantName': restaurantName},
        );
      },
      child: Container(
        padding: EdgeInsets.all(10.r),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20.r),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade300,
              spreadRadius: 3.r,
              blurRadius: 10.r,
              offset: Offset(0, 10.h),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16.r),
              child: AspectRatio(
                aspectRatio: 4 / 3,
                child: CachedNetworkImage(
                  imageUrl: foodItem.images[0],
                  fit: BoxFit.cover,
                ),
              ),
            ),
            10.verticalSpace,
            Text(
              foodItem.name,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: GoogleFonts.sen(
                fontSize: 18.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            4.verticalSpace,
            Text(
              foodItem.category,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: GoogleFonts.sen(fontSize: 14.sp, color: Colors.grey),
            ),
            12.verticalSpace,
            Row(
              children: [
                Text(
                  'Rs ${foodItem.price}',
                  style: GoogleFonts.sen(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Spacer(),
                BlocListener<CartCubit, CartState>(
                  listenWhen: (previous, current) {
                    if (current is CartItemAdded) {
                      return current.productID == foodItem.id;
                    } else if (current is CartItemUpdated) {
                      return current.productID == foodItem.id;
                    } else if (current is CartError) {
                      return true;
                    }
                    return false;
                  },
                  listener: (context, state) {
                    if (state is CartItemAdded) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('${foodItem.name} added to cart!'),
                          duration: Duration(seconds: 2),
                          backgroundColor: Colors.green,
                        ),
                      );
                    } else if (state is CartItemUpdated) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('${foodItem.name} quantity updated!'),
                          duration: Duration(seconds: 2),
                          backgroundColor: Colors.blue,
                        ),
                      );
                    } else if (state is CartError) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(state.message),
                          duration: Duration(seconds: 3),
                          backgroundColor: Colors.red,
                        ),
                      );
                    }
                  },
                  child: SizedBox(
                    height: 34.r,
                    width: 34.r,
                    child: IconButton(
                      onPressed: () {
                        BlocProvider.of<CartCubit>(context).addToCart(
                          userID: getCurrentUser()!.uid,
                          cartItem: CartItemModel(
                            productID: foodItem.id,
                            product: foodItem,
                            quantity: 1,
                          ),
                        );
                      },
                      icon: Icon(Icons.add, size: 18.r),
                      padding: EdgeInsets.zero,
                      style: IconButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: Colors.deepOrange,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
