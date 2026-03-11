import 'package:bite_food_delivery/Cubits/MapLocationCubit/map_location_cubit.dart';
import 'package:bite_food_delivery/Cubits/OrderCubit/order_cubit.dart';
import 'package:bite_food_delivery/Cubits/PhoneCallCubit/phone_call_cubit.dart';
import 'package:bite_food_delivery/Cubits/RestaurantsCubit/restaurants_cubit.dart';
import 'package:bite_food_delivery/GlobalWidgets/bite_app_bar.dart';
import 'package:bite_food_delivery/Models/order_model.dart';
import 'package:bite_food_delivery/Screens/TrackOrderPage/Widgets/bite_order_info_sheet.dart';
import 'package:bite_food_delivery/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:intl/intl.dart';

class TrackOrderScreen extends StatelessWidget {
  const TrackOrderScreen({super.key});
  static const String _courierPhoneNumber = '+923186384283';

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
        backgroundColor: Theme.of(context).colorScheme.surface,
        appBar: const _AppBarSection(),
        body: Center(
          child: Text(
            S.of(context).noActiveOrder,
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
              color: Theme.of(context).colorScheme.secondary,
              fontWeight: FontWeight.normal,
            ),
          ),
        ),
      );
    }

    final formattedDate = DateFormat(
      'dd MMM, hh:mma',
    ).format(order.orderPlacedAt);

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: const _AppBarSection(),
      body: MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => MapLocationCubit()),
          BlocProvider(create: (_) => PhoneCallCubit()),
        ],
        child: MultiBlocListener(
          listeners: [
            BlocListener<OrderCubit, OrderState>(
              listener: (context, state) {
                if (state is ActiveOrderDelivered) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        S.of(context).yourOrderHasBeenDelivered,
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                      backgroundColor: Colors.green,
                      duration: const Duration(seconds: 3),
                    ),
                  );
                  Navigator.of(
                    context,
                  ).pushReplacementNamed('/review_screen', arguments: order);
                }
              },
            ),
            BlocListener<PhoneCallCubit, PhoneCallState>(
              listener: (context, state) {
                if (state is PhoneCallFailure) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        state.errorMessage,
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                      backgroundColor: Colors.red,
                    ),
                  );
                }
                if (state is PhoneCallSuccess) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        S.of(context).callingphonenumber(state.phoneNumber),
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                      backgroundColor: Colors.green,
                    ),
                  );
                }
              },
            ),
          ],
          child: BlocBuilder<MapLocationCubit, MapLocationState>(
            builder: (context, state) {
              if (state is MapLocationLoading || state is MapLocationInitial) {
                return Center(
                  child: CircularProgressIndicator(
                    color: Theme.of(context).colorScheme.primary,
                  ),
                );
              }

              if (state is MapLocationError) {
                return Center(
                  child: Text(
                    state.message,
                    style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      color: Theme.of(context).colorScheme.secondary,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                );
              }

              if (state is MapLocationPermissionDenied) {
                return Center(
                  child: Text(
                    S.of(context).locationPermissionDenied,
                    style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      color: Theme.of(context).colorScheme.secondary,
                      fontWeight: FontWeight.normal,
                    ),
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
                      markers: {
                        const Marker(
                          markerId: MarkerId('courier'),

                          position: LatLng(30.243319, 71.488739),
                        ),
                      },
                      polylines: {
                        Polyline(
                          polylineId: const PolylineId('route'),
                          points: [
                            const LatLng(30.229120224296313, 71.46704279910028),
                            LatLng(state.latitude, state.longitude),
                          ],
                          color: Theme.of(context).colorScheme.primary,
                          width: 2,
                          startCap: Cap.roundCap,
                          endCap: Cap.roundCap,
                        ),
                      },
                    ),
                  ),
                  DraggableScrollableSheet(
                    initialChildSize: 0.45,
                    minChildSize: 0.08,
                    maxChildSize: 0.75,
                    snap: true,
                    snapSizes: const [0.08, 0.45, 0.75],
                    builder: (context, scrollController) {
                      return BlocBuilder<OrderCubit, OrderState>(
                        builder: (context, orderState) {
                          final currentOrder = orderCubit.activeOrder ?? order;
                          final restaurantName = context
                              .read<RestaurantsCubit>()
                              .getRestaurantNameById(currentOrder.restaurantId);
                          return BiteOrderInfoSheet(
                            scrollController: scrollController,
                            restaurantName: restaurantName,
                            orderDate: formattedDate,
                            items: [
                              'Order #${currentOrder.orderId.substring(0, 8)}',
                              'Total: PKR ${currentOrder.totalPrice.toStringAsFixed(0)}',
                            ],
                            estimatedMinutes: 20,
                            courierName: S.of(context).courier,
                            currentStep: _orderStatusToStep(
                              currentOrder.orderStatus,
                            ),
                            onCallTap: () {
                              context.read<PhoneCallCubit>().makePhoneCall(
                                _courierPhoneNumber,
                              );
                            },
                          );
                        },
                      );
                    },
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
        S.of(context).trackOrder,
        style: GoogleFonts.sen(
          fontSize: Theme.of(context).textTheme.displaySmall!.fontSize,
          fontWeight: Theme.of(context).textTheme.displaySmall!.fontWeight,
          color: Theme.of(context).colorScheme.primary,
        ),
      ),
      actions: const [],
    );
  }
}
