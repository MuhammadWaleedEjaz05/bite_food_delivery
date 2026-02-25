import 'package:bite_food_delivery/Cubits/MapLocationCubit/map_location_cubit.dart';
import 'package:bite_food_delivery/Cubits/OrderCubit/order_cubit.dart';
import 'package:bite_food_delivery/Cubits/RestaurantsCubit/restaurants_cubit.dart';
import 'package:bite_food_delivery/GlobalWidgets/bite_app_bar.dart';
import 'package:bite_food_delivery/Models/order_model.dart';
import 'package:bite_food_delivery/Screens/TrackOrderPage/Widgets/bite_order_info_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:intl/intl.dart';

class TrackOrderScreen extends StatelessWidget {
  const TrackOrderScreen({super.key});

  int _orderStatusToStep(OrderStatus status) {
    switch (status) {
      case OrderStatus.received:
        return 0;
      case OrderStatus.preparing:
        return 1;
      case OrderStatus.dispatched:
        return 2;
      case OrderStatus.delivered:
        return 3;
      case OrderStatus.cancelled:
        throw UnimplementedError();
    }
  }

  @override
  Widget build(BuildContext context) {
    final orderCubit = context.read<OrderCubit>();
    final order = orderCubit.activeOrder;

    if (order == null) {
      return Scaffold(
        backgroundColor: const Color(0xFFEEF0F5),
        appBar: _AppBarSection(),
        body: Center(
          child: Text(
            'No active order',
            style: GoogleFonts.sen(fontSize: 18.sp, color: Colors.grey),
          ),
        ),
      );
    }

    final formattedDate = DateFormat(
      'dd MMM, hh:mma',
    ).format(order.orderPlacedAt);

    return Scaffold(
      backgroundColor: const Color(0xFFEEF0F5),
      appBar: _AppBarSection(),
      body: BlocProvider(
        create: (_) => MapLocationCubit(),
        child: BlocListener<OrderCubit, OrderState>(
          listener: (context, state) {
            if (state is ActiveOrderDelivered) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    'Your order has been delivered!',
                    style: GoogleFonts.sen(fontSize: 14.sp),
                  ),
                  backgroundColor: Colors.green,
                  duration: const Duration(seconds: 3),
                ),
              );
              Navigator.of(context).pop();
            }
          },
          child: BlocBuilder<MapLocationCubit, MapLocationState>(
            builder: (context, state) {
              if (state is MapLocationLoading || state is MapLocationInitial) {
                return Center(
                  child: CircularProgressIndicator(
                    color: Theme.of(context).primaryColor,
                  ),
                );
              }

              if (state is MapLocationError) {
                return Center(
                  child: Text(
                    state.message,
                    style: GoogleFonts.sen(fontSize: 16.sp, color: Colors.grey),
                  ),
                );
              }

              if (state is MapLocationPermissionDenied) {
                return Center(
                  child: Text(
                    'Location permission denied',
                    style: GoogleFonts.sen(fontSize: 16.sp, color: Colors.grey),
                  ),
                );
              }

              final loadedState = state as MapLocationLoaded;

              return Stack(
                children: [
                  Positioned.fill(
                    child: GoogleMap(
                      initialCameraPosition: CameraPosition(
                        target: LatLng(
                          loadedState.latitude,
                          loadedState.longitude,
                        ),
                        zoom: 15,
                      ),
                      myLocationEnabled: true,
                      myLocationButtonEnabled: true,
                      zoomControlsEnabled: false,
                      mapToolbarEnabled: false,
                    ),
                  ),
                  Positioned(
                    left: 0,
                    right: 0,
                    bottom: 0,
                    child: BlocBuilder<OrderCubit, OrderState>(
                      builder: (context, orderState) {
                        final currentOrder = orderCubit.activeOrder ?? order;
                        final restaurantName = context
                            .read<RestaurantsCubit>()
                            .getRestaurantNameById(currentOrder.restaurantId);
                        return BiteOrderInfoSheet(
                          restaurantName: restaurantName,
                          orderDate: formattedDate,
                          items: [
                            'Order #${currentOrder.orderId.substring(0, 8)}',
                            'Total: PKR ${currentOrder.totalPrice.toStringAsFixed(0)}',
                          ],
                          estimatedMinutes: 20,
                          courierName: 'Courier',
                          currentStep: _orderStatusToStep(
                            currentOrder.orderStatus,
                          ),
                        );
                      },
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

class _AppBarSection extends StatelessWidget implements PreferredSizeWidget {
  const _AppBarSection();

  @override
  Size get preferredSize => Size.fromHeight(100.h);

  @override
  Widget build(BuildContext context) {
    return BiteAppBar(
      backButton: true,
      title: Text(
        'Track Order',
        style: GoogleFonts.sen(
          fontSize: 30.sp,
          fontWeight: FontWeight.bold,
          color: Theme.of(context).primaryColor,
        ),
      ),
      actions: const [],
    );
  }
}
