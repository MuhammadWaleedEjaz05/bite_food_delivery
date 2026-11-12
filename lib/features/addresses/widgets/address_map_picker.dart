import 'package:bite_food_delivery/core/extensions/theme_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class AddressMapPicker extends StatelessWidget {
  final LatLng initialPosition;
  final ValueChanged<GoogleMapController>? onMapCreated;
  final ValueChanged<CameraPosition>? onCameraMove;
  final VoidCallback? onCameraIdle;
  final VoidCallback? onMyLocationTap;
  final bool isMoving;

  const AddressMapPicker({
    super.key,
    required this.initialPosition,
    this.onMapCreated,
    this.onCameraMove,
    this.onCameraIdle,
    this.onMyLocationTap,
    this.isMoving = false,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.appColors;
    return ClipRRect(
      borderRadius: BorderRadius.circular(24).r,
      child: Container(
        height: 220.r,
        decoration: BoxDecoration(
          color: colors.surfaceContainerHighest,
          borderRadius: BorderRadius.circular(24).r,
          border: Border.all(color: colors.outlineVariant, width: 1),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            GoogleMap(
              initialCameraPosition: CameraPosition(
                target: initialPosition,
                zoom: 15,
              ),
              onMapCreated: onMapCreated,
              onCameraMove: onCameraMove,
              onCameraIdle: onCameraIdle,
              myLocationEnabled: true,
              myLocationButtonEnabled: false,
              zoomControlsEnabled: false,
              compassEnabled: true,
            ),
            Center(
              child: Padding(
                padding: EdgeInsets.only(bottom: 24.h),
                child: AnimatedScale(
                  scale: isMoving ? 1.2 : 1.0,
                  duration: const Duration(milliseconds: 150),
                  child: Icon(
                    Icons.location_pin,
                    size: 40.r,
                    color: colors.primary,
                  ),
                ),
              ),
            ),
            if (onMyLocationTap != null)
              Positioned(
                bottom: 12.r,
                right: 12.r,
                child: Material(
                  color: colors.surface,
                  shape: const CircleBorder(),
                  elevation: 2,
                  child: InkWell(
                    customBorder: const CircleBorder(),
                    onTap: onMyLocationTap,
                    child: Padding(
                      padding: const EdgeInsets.all(10).r,
                      child: Icon(
                        Icons.my_location,
                        size: 20.r,
                        color: colors.primary,
                      ),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
