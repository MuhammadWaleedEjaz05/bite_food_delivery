import 'package:bite_food_delivery/Cubits/FavouriteCubit/favourite_cubit.dart';
import 'package:bite_food_delivery/Models/food_item_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BiteFavouriteBlock extends StatelessWidget {
  final FoodItemModel foodItem;
  const BiteFavouriteBlock({super.key, required this.foodItem});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15.r),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10.r,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                height: 100.h,
                width: 100.w,
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(20.r),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20.r),
                  child: CachedNetworkImage(
                    imageUrl: foodItem.images[0],
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              10.horizontalSpace,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    foodItem.name,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  Text(
                    foodItem.category,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: Colors.grey.shade500,
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        'RS ${foodItem.price.toStringAsFixed(2)}',
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: Colors.grey.shade500,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              10.horizontalSpace,
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
                          'Are you sure you want to remove this food item from your favourites?',
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
                              context
                                  .read<FavouriteCubit>()
                                  .removeFoodItemFromFavourite(foodItem.id);
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
                icon: Icon(Icons.delete, color: Colors.red, size: 20.r),
              ),
            ],
          ),
          20.verticalSpace,
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
                  onPressed: () {},
                  child: Text(
                    'Order Again',
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
