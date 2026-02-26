import 'package:bite_food_delivery/Models/cart_item_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

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
                child: Icon(Icons.fastfood, color: Colors.grey),
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
                  style: GoogleFonts.sen(
                    fontSize: 15.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                4.verticalSpace,
                Text(
                  'x${item.quantity}',
                  style: GoogleFonts.sen(
                    fontSize: 13.sp,
                    color: Colors.grey.shade600,
                  ),
                ),
              ],
            ),
          ),
          Text(
            'PKR ${item.totalPrice.toStringAsFixed(2)}',
            style: GoogleFonts.sen(
              fontSize: 15.sp,
              fontWeight: FontWeight.bold,
              color: Colors.deepOrange,
            ),
          ),
        ],
      ),
    );
  }
}
