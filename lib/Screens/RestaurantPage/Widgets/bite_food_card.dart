import 'package:bite_food_delivery/Cubits/CartCubit/cart_cubit.dart';
import 'package:bite_food_delivery/Models/cart_item_model.dart';
import 'package:bite_food_delivery/Models/food_item_model.dart';
import 'package:bite_food_delivery/configs/firebase_auth_conn.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

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
          color: Theme.of(context).colorScheme.surface,
          borderRadius: BorderRadius.circular(20.r),
          boxShadow: [
            BoxShadow(
              color: Theme.of(context).colorScheme.onSurface.withAlpha(25),
              spreadRadius: 2.r,
              blurRadius: 5.r,
              offset: Offset(0, 3.h),
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
              style: Theme.of(context).textTheme.titleMedium,
            ),
            4.verticalSpace,
            Text(
              foodItem.category,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(
                context,
              ).textTheme.bodySmall!.copyWith(color: Colors.grey),
            ),
            12.verticalSpace,
            Row(
              children: [
                Text(
                  'PKR ${foodItem.price.toInt()}',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const Spacer(),
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
                      showTopSnackBar(
                        Overlay.of(context),
                        CustomSnackBar.success(
                          message: '${foodItem.name} added to cart!',
                        ),
                      );
                    } else if (state is CartItemUpdated) {
                      showTopSnackBar(
                        Overlay.of(context),
                        CustomSnackBar.info(
                          message: '${foodItem.name} quantity updated!',
                        ),
                      );
                    } else if (state is CartError) {
                      showTopSnackBar(
                        Overlay.of(context),
                        const CustomSnackBar.error(
                          message: "Failed to update cart. Please try again.",
                        ),
                      );
                    }
                  },
                  child: SizedBox(
                    height: 34.r,
                    width: 34.r,
                    child: IconButton(
                      onPressed: () {
                        context.read<CartCubit>().addToCart(
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
                        backgroundColor: Theme.of(context).colorScheme.primary,
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
