import 'package:bite_food_delivery/Models/restaurants_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class BiteRestaurantCard extends StatelessWidget {
  final RestaurantModel restaurant;
  const BiteRestaurantCard({super.key, required this.restaurant});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/restaurant_screen');
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
                '35 min',
                style: GoogleFonts.sen(fontSize: 16.sp, color: Colors.black),
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
                style: GoogleFonts.sen(fontSize: 16.sp, color: Colors.black),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
