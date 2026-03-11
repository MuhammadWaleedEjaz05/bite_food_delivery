import 'package:bite_food_delivery/Models/cart_item_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BiteCheckoutItemTile extends StatelessWidget {
  final CartItemModel item;
  const BiteCheckoutItemTile({required this.item, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10.r),
            child: CachedNetworkImage(
              imageUrl: item.product.images.isNotEmpty
                  ? item.product.images[0]
                  : '',
              width: 55.r,
              height: 55.r,
              fit: BoxFit.cover,
              placeholder: (context, url) => Container(
                width: 55.r,
                height: 55.r,
                color: Colors.grey.shade300,
              ),
              errorWidget: (context, url, error) => Container(
                width: 55.r,
                height: 55.r,
                color: Colors.grey.shade300,
                child: const Icon(Icons.fastfood, color: Colors.grey),
              ),
            ),
          ),
          12.horizontalSpace,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.product.name,
                  style: Theme.of(
                    context,
                  ).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.bold),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                4.verticalSpace,
                Text(
                  'x${item.quantity}',
                  style: Theme.of(context).textTheme.labelLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onSecondary,
                  ),
                ),
              ],
            ),
          ),
          Text(
            'PKR ${item.totalPrice.toStringAsFixed(2)}',
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
        ],
      ),
    );
  }
}
