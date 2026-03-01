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
                Text(
                  restaurant.name,
                  style: GoogleFonts.sen(
                    fontSize: Theme.of(
                      context,
                    ).textTheme.headlineLarge!.fontSize,
                  ),
                ),
                Text(
                  restaurant.category,
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    fontWeight: FontWeight.normal,
                    color: Colors.grey.shade600,
                  ),
                ),
                5.verticalSpace,
                Row(
                  children: [
                    Icon(
                      Icons.star_outline,
                      color: Colors.deepOrange,
                      size: 18.sp,
                    ),
                    4.horizontalSpace,
                    Text(
                      restaurant.rating.toString(),
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                    10.horizontalSpace,
                    Icon(
                      Icons.delivery_dining,
                      color: Colors.deepOrange,
                      size: 18.sp,
                    ),
                    4.horizontalSpace,
                    Text(
                      '${restaurant.deliveryTime.toInt()} min',
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                    10.horizontalSpace,
                    Icon(
                      Icons.timelapse_outlined,
                      color: Colors.deepOrange,
                      size: 18.sp,
                    ),
                    4.horizontalSpace,
                    Text(
                      '\$${restaurant.deliveryFee}',
                      style: Theme.of(context).textTheme.titleSmall,
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
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      content: Text(
                        'Are you sure you want to remove this restaurant from your favourites?',
                        style: Theme.of(context).textTheme.titleSmall!
                                    .copyWith(fontWeight: FontWeight.normal),
                      ),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text(
                            'Cancel',
                            style: Theme.of(context).textTheme.titleSmall!
                                    .copyWith(fontWeight: FontWeight.normal),
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
                            style: Theme.of(context).textTheme.titleSmall!
                                    .copyWith(fontWeight: FontWeight.normal),
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
