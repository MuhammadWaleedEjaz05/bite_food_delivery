import 'package:bite_food_delivery/src/features/address_management/cubits/map_location_cubit/map_location_cubit.dart';
import 'package:bite_food_delivery/src/features/order_management_and_history/cubits/order_cubit/order_cubit.dart';
import 'package:bite_food_delivery/src/services/phone_call_cubit/phone_call_cubit.dart';
import 'package:bite_food_delivery/src/features/restaurants/cubits/restaurants_cubit/restaurants_cubit.dart';
import 'package:bite_food_delivery/src/shared/widgets/bite_app_bar.dart';
import 'package:bite_food_delivery/src/features/order_management_and_history/models/order_model.dart';
import 'package:bite_food_delivery/src/features/order_management_and_history/widgets/bite_order_info_sheet.dart';
import 'package:bite_food_delivery/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart' hide Marker;
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
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
            AppLocalizations.of(context)!.noActiveOrder,
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
      body: MultiBlocListener(
        listeners: [
          BlocListener<OrderCubit, OrderState>(
            listener: (context, state) {
              if (state is ActiveOrderDelivered) {
                showTopSnackBar(
                  Overlay.of(context),
                  CustomSnackBar.success(
                    message: AppLocalizations.of(
                      context,
                    )!.yourOrderHasBeenDelivered,
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
                showTopSnackBar(
                  Overlay.of(context),
                  const CustomSnackBar.error(
                    message: "Failed to make the call. Please try again.",
                  ),
                );
              }
              if (state is PhoneCallSuccess) {
                showTopSnackBar(
                  Overlay.of(context),
                  CustomSnackBar.success(
                    message: AppLocalizations.of(
                      context,
                    )!.callingphonenumber(state.phoneNumber),
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
                child: Lottie.asset(
                  'assets/animations/loading.json',
                  height: 75.h,
                  width: 75.w,
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
                  AppLocalizations.of(context)!.locationPermissionDenied,
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    color: Theme.of(context).colorScheme.secondary,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              );
            }

            final loadedState = state as MapLocationLoaded;
            final order = context.read<OrderCubit>().activeOrder;
            if (order == null) return const SizedBox.shrink();
            final customerLocation = LatLng(
              loadedState.latitude,
              loadedState.longitude,
            );
            final restaurant =
                (context.read<RestaurantsCubit>().state as RestaurantsLoaded)
                    .restaurants
                    .firstWhere(
                      (restaurant) => restaurant.id == order.restaurantId,
                    );
            final restuarantLocation = restaurant.geoLocation;

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
                      Marker(
                        markerId: const MarkerId('restaurant'),

                        position: restuarantLocation,
                        icon: BitmapDescriptor.defaultMarkerWithHue(
                          BitmapDescriptor.hueRed,
                        ),
                      ),
                      Marker(
                        markerId: const MarkerId('customer'),

                        position: customerLocation,
                        icon: BitmapDescriptor.defaultMarkerWithHue(
                          BitmapDescriptor.hueGreen,
                        ),
                      ),
                    },
                    polylines: {
                      Polyline(
                        polylineId: const PolylineId('route'),
                        points: [restuarantLocation, customerLocation],
                        color: Theme.of(context).colorScheme.primary,
                        width: 2,
                        startCap: Cap.buttCap,
                        endCap: Cap.buttCap,
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
                          courierName: AppLocalizations.of(context)!.courier,
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
        AppLocalizations.of(context)!.trackOrder,
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
