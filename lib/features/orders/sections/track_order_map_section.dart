import 'package:bite_food_delivery/core/extensions/responsive_extensions.dart';
import 'package:bite_food_delivery/core/extensions/theme_extensions.dart';
import 'package:bite_food_delivery/features/orders/bloc/order_cubit.dart';
import 'package:bite_food_delivery/features/orders/widgets/track_order_radar_pill.dart';
import 'package:bite_food_delivery/features/restaurants/bloc/restaurants_cubit.dart';
import 'package:material_ui/material_ui.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class TrackOrderMapSection extends StatefulWidget {
  const TrackOrderMapSection({super.key});

  @override
  State<TrackOrderMapSection> createState() => _TrackOrderMapSectionState();
}

class _TrackOrderMapSectionState extends State<TrackOrderMapSection> {
  GoogleMapController? _controller;

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.appColors;
    final order = context.watch<OrderCubit>().activeOrder;

    if (order == null) {
      return const SliverToBoxAdapter(child: SizedBox.shrink());
    }

    final restaurantsState = context.watch<RestaurantsCubit>().state;
    LatLng restaurantLocation = const LatLng(31.5204, 74.3587);

    if (restaurantsState is RestaurantsLoaded) {
      final r = restaurantsState.restaurants
          .where((x) => x.id == order.restaurantId)
          .firstOrNull;
      if (r != null) {
        restaurantLocation = LatLng(
          r.geoLocation.latitude,
          r.geoLocation.longitude,
        );
      }
    }

    final markers = {
      Marker(
        markerId: const MarkerId('restaurant'),
        position: restaurantLocation,
        infoWindow: const InfoWindow(title: 'Restaurant'),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueOrange),
      ),
    };

    return SliverPadding(
      padding: context.contentInsets(bottom: 20),
      sliver: SliverToBoxAdapter(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(24).r,
          child: Container(
            height: 220.r,
            decoration: BoxDecoration(
              color: colors.surfaceContainerHighest,
              borderRadius: BorderRadius.circular(24).r,
              border: Border.all(color: colors.outlineVariant, width: 1),
            ),
            child: Stack(
              children: [
                GoogleMap(
                  initialCameraPosition: CameraPosition(
                    target: restaurantLocation,
                    zoom: 14,
                  ),
                  onMapCreated: (c) => _controller = c,
                  markers: markers,
                  myLocationEnabled: false,
                  myLocationButtonEnabled: false,
                  zoomControlsEnabled: false,
                  compassEnabled: false,
                ),
                Positioned(
                  top: 10.r,
                  left: 10.r,
                  right: 10.r,
                  child: const TrackOrderRadarPill(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
