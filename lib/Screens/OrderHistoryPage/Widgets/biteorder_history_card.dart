import 'package:bite_food_delivery/Cubits/OrderCubit/order_cubit.dart';
import 'package:bite_food_delivery/Cubits/RestaurantsCubit/restaurants_cubit.dart';
import 'package:bite_food_delivery/Models/order_model.dart';
import 'package:bite_food_delivery/Screens/TrackOrderPage/Page/track_order_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class BiteOrderHistoryCard extends StatelessWidget {
  final OrderModel order;
  final bool isCompleted;
  const BiteOrderHistoryCard({
    super.key,
    required this.order,
    this.isCompleted = false,
  });

  @override
  Widget build(BuildContext context) {
    final statusLabel =
        order.orderStatus.name[0].toUpperCase() +
        order.orderStatus.name.substring(1);
    final dateStr = DateFormat(
      'dd MMM yyyy, hh:mm a',
    ).format(order.orderPlacedAt);
    final restaurantName = context
        .read<RestaurantsCubit>()
        .getRestaurantNameById(order.restaurantId);

    return Padding(
      padding: EdgeInsets.all(10.r),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            dateStr,
            style: Theme.of(context).textTheme.bodySmall!.copyWith(color: Colors.grey),
          ),
          10.verticalSpace,
          Divider(thickness: 1.h),
          10.verticalSpace,
          Column(
            children: [
              Row(
                spacing: 10.w,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 75.h,
                    width: 75.w,
                    decoration: BoxDecoration(
                      color: Colors.deepOrange,
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    child: Icon(
                      Icons.restaurant,
                      color: Colors.white,
                      size: 32.r,
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      spacing: 2.h,
                      children: [
                        Text(
                          restaurantName,
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        Text(
                          statusLabel,
                          style: Theme.of(context).textTheme.bodyMedium!
                              .copyWith(
                                fontWeight: FontWeight.bold,
                                color: isCompleted
                                    ? Colors.green
                                    : Colors.deepOrange,
                              ),
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          spacing: 5.w,
                          children: [
                            Text(
                              'PKR ${order.totalPrice.toStringAsFixed(0)}',
                              style: Theme.of(context).textTheme.bodyMedium!
                                  .copyWith(fontWeight: FontWeight.bold),
                            ),
                            Text(
                              '|',
                              style: Theme.of(context).textTheme.titleLarge!
                                  .copyWith(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.normal,
                                  ),
                            ),
                            Text(
                              order.paymentMethod.name.toUpperCase(),
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Text(
                    '#${order.orderId.substring(0, 8)}',
                    style: Theme.of(context).textTheme.labelLarge!.copyWith(
                      color: Colors.grey,
                      decoration: TextDecoration.underline,
                      decorationColor: Colors.grey,
                    ),
                  ),
                ],
              ),
              20.verticalSpace,
              Row(
                children: [
                  Expanded(
                    child: !isCompleted
                        ? ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => const TrackOrderScreen(),
                                ),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              foregroundColor: Colors.white,
                              backgroundColor: Colors.deepOrange,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.r),
                              ),
                            ),
                            child: Text('Track Order'),
                          )
                        : ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              foregroundColor: Colors.deepOrange,
                              backgroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.r),
                                side: BorderSide(color: Colors.deepOrange),
                              ),
                            ),
                            child: Text('Rate'),
                          ),
                  ),
                  30.horizontalSpace,
                  Expanded(
                    child: !isCompleted
                        ? ElevatedButton(
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (ctx) => AlertDialog(
                                  title: Text(
                                    'Cancel Order',
                                    style: GoogleFonts.sen(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  content: Text(
                                    'Are you sure you want to cancel this order?',
                                    style: GoogleFonts.sen(),
                                  ),
                                  actions: [
                                    TextButton(
                                      onPressed: () => Navigator.pop(ctx),
                                      child: Text(
                                        'No',
                                        style: GoogleFonts.sen(
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        Navigator.pop(ctx);
                                        context.read<OrderCubit>().cancelOrder(
                                          order.orderId,
                                        );
                                      },
                                      child: Text(
                                        'Yes, Cancel',
                                        style: GoogleFonts.sen(
                                          color: Colors.red,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              foregroundColor: Colors.deepOrange,
                              backgroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.r),
                                side: BorderSide(color: Colors.deepOrange),
                              ),
                            ),
                            child: Text('Cancel'),
                          )
                        : ElevatedButton(
                            onPressed: () {
                              context.read<OrderCubit>().reorderFromHistory(
                                order.orderId,
                                order.userId,
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              foregroundColor: Colors.white,
                              backgroundColor: Colors.deepOrange,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.r),
                              ),
                            ),
                            child: Text('Reorder'),
                          ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
