import 'package:bite_food_delivery/Cubits/OrderCubit/order_cubit.dart';
import 'package:bite_food_delivery/Cubits/RestaurantsCubit/restaurants_cubit.dart';
import 'package:bite_food_delivery/Models/order_model.dart';
import 'package:bite_food_delivery/Screens/TrackOrderPage/Page/track_order_screen.dart';
import 'package:bite_food_delivery/generated/l10n.dart';
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
            style: Theme.of(
              context,
            ).textTheme.bodySmall!.copyWith(color: Colors.grey),
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
                      color: Theme.of(context).colorScheme.primary,
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
                                    : Theme.of(context).colorScheme.primary,
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
                                    color: Theme.of(
                                      context,
                                    ).colorScheme.secondary,
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
                      color: Theme.of(context).colorScheme.secondary,
                      decoration: TextDecoration.underline,
                      decorationColor: Theme.of(context).colorScheme.secondary,
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
                              backgroundColor: Theme.of(
                                context,
                              ).colorScheme.primary,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.r),
                              ),
                            ),
                            child: Text(S.of(context).trackOrder),
                          )
                        : ElevatedButton(
                            onPressed: () {
                              Navigator.pushNamed(
                                context,
                                '/review_screen',
                                arguments: order,
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              foregroundColor: Theme.of(
                                context,
                              ).colorScheme.primary,
                              backgroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.r),
                                side: BorderSide(
                                  color: Theme.of(context).colorScheme.primary,
                                ),
                              ),
                            ),
                            child: Text(S.of(context).rate),
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
                                    S.of(context).cancelOrder,
                                    style: GoogleFonts.sen(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  content: Text(
                                    S
                                        .of(context)
                                        .areYouSureYouWantToCancelThisOrder,
                                    style: GoogleFonts.sen(),
                                  ),
                                  actions: [
                                    TextButton(
                                      onPressed: () => Navigator.pop(ctx),
                                      child: Text(
                                        'No',
                                        style: GoogleFonts.sen(
                                          color: Theme.of(
                                            context,
                                          ).colorScheme.secondary,
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
                                        S.of(context).yesCancel,
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
                              foregroundColor: Theme.of(
                                context,
                              ).colorScheme.primary,
                              backgroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.r),
                                side: BorderSide(
                                  color: Theme.of(context).colorScheme.primary,
                                ),
                              ),
                            ),
                            child: Text(S.of(context).cancel),
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
                              backgroundColor: Theme.of(
                                context,
                              ).colorScheme.primary,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.r),
                              ),
                            ),
                            child: Text(S.of(context).reorder),
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
