import 'package:bite_food_delivery/Models/restaurants_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BiteRestaurantCard extends StatelessWidget {
  final RestaurantModel restaurant;
  const BiteRestaurantCard({super.key, required this.restaurant});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          '/restaurant_screen',
          arguments: restaurant,
        );
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 120.h,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: CachedNetworkImageProvider(restaurant.logoUrl),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(20.r),
            ),
          ),
          Text(
            restaurant.name,
            style: Theme.of(
              context,
            ).textTheme.headlineLarge!.copyWith(fontWeight: FontWeight.normal),
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
              Icon(Icons.star_outline, color: Colors.deepOrange, size: 18.sp),
              4.horizontalSpace,
              Text(
                restaurant.rating.toString(),
                style: Theme.of(context).textTheme.titleSmall!.copyWith(color: Colors.black,fontWeight: FontWeight.normal),
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
                style: Theme.of(context).textTheme.titleSmall!.copyWith(color: Colors.black,fontWeight: FontWeight.normal),
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
                style: Theme.of(context).textTheme.titleSmall!.copyWith(color: Colors.black,fontWeight: FontWeight.normal),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
