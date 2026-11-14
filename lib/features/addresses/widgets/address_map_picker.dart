import 'package:bite_food_delivery/app/theme/app_text_styles.dart';
import 'package:bite_food_delivery/core/extensions/theme_extensions.dart';
import 'package:bite_food_delivery/widgets/app_text.dart';
import 'package:material_ui/material_ui.dart';
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
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Floating "Deliver here" tooltip
                    AnimatedOpacity(
                      opacity: isMoving ? 0.0 : 1.0,
                      duration: const Duration(milliseconds: 180),
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 10.w,
                          vertical: 3.h,
                        ).r,
                        decoration: BoxDecoration(
                          color: const Color(0xFF141416),
                          borderRadius: BorderRadius.circular(12).r,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withValues(alpha: 0.22),
                              blurRadius: 6.r,
                              offset: Offset(0, 2.h),
                            ),
                          ],
                        ),
                        child: AppText(
                          'Deliver here',
                          style: AppTextStyles.labelSmall(context).copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            fontSize: 9.sp,
                          ),
                        ),
                      ),
                    ),
                    3.verticalSpace,
                    // Jumping Pin with Spring Bounce
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      curve: Curves.easeOutBack,
                      transform: Matrix4.translationValues(
                        0,
                        isMoving ? -12.h : 0,
                        0,
                      ),
                      child: Icon(
                        Icons.location_pin,
                        size: 40.r,
                        color: colors.primary,
                      ),
                    ),
                    // Dynamic Ground Shadow
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      curve: Curves.easeOutCubic,
                      width: isMoving ? 10.r : 16.r,
                      height: 4.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.elliptical(isMoving ? 10.r : 16.r, 4.h),
                        ),
                        color: Colors.black.withValues(
                          alpha: isMoving ? 0.16 : 0.42,
                        ),
                      ),
                    ),
                  ],
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
