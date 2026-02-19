import 'package:bite_food_delivery/Cubits/FavouriteCubit/favourite_cubit.dart';
import 'package:bite_food_delivery/Models/restaurants_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class BiteFavouriteRestaurantCard extends StatelessWidget {
  final RestaurantModel restaurant;
  const BiteFavouriteRestaurantCard({super.key, required this.restaurant});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 120.h,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(restaurant.logoUrl),
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.circular(20.r),
          ),
        ),
        Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(restaurant.name, style: GoogleFonts.sen(fontSize: 25.sp)),
                Text(
                  restaurant.category,
                  style: GoogleFonts.sen(
                    fontSize: 18.sp,
                    color: Colors.grey.shade600,
                  ),
                ),
                5.verticalSpace,
                Row(
                  children: [
                    Icon(
                      Icons.star_outline,
                      color: Theme.of(context).primaryColor,
                      size: 18.sp,
                    ),
                    4.horizontalSpace,
                    Text(
                      restaurant.rating.toString(),
                      style: GoogleFonts.sen(
                        fontSize: 16.sp,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    10.horizontalSpace,
                    Icon(
                      Icons.delivery_dining,
                      color: Theme.of(context).primaryColor,
                      size: 18.sp,
                    ),
                    4.horizontalSpace,
                    Text(
                      '${restaurant.deliveryTime.toInt()} min',
                      style: GoogleFonts.sen(
                        fontSize: 16.sp,
                        color: Colors.black,
                      ),
                    ),
                    10.horizontalSpace,
                    Icon(
                      Icons.timelapse_outlined,
                      color: Theme.of(context).primaryColor,
                      size: 18.sp,
                    ),
                    4.horizontalSpace,
                    Text(
                      '\$${restaurant.deliveryFee}',
                      style: GoogleFonts.sen(
                        fontSize: 16.sp,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Spacer(),
            IconButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text(
                        'Remove from favourites',
                        style: GoogleFonts.sen(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      content: Text(
                        'Are you sure you want to remove this restaurant from your favourites?',
                        style: GoogleFonts.sen(fontSize: 16.sp),
                      ),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text(
                            'Cancel',
                            style: GoogleFonts.sen(fontSize: 16.sp),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                            context.read<FavouriteCubit>().removeFromFavourite(
                              restaurant.id,
                            );
                          },
                          child: Text(
                            'Remove',
                            style: GoogleFonts.sen(fontSize: 16.sp),
                          ),
                        ),
                      ],
                    );
                  },
                );
              },
              icon: Icon(Icons.delete, color: Colors.red, size: 30.r),
            ),
          ],
        ),
      ],
    );
  }
}
