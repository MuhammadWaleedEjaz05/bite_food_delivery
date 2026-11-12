import 'package:bloc/bloc.dart';
import 'package:geocoding/geocoding.dart' as geocoding;
import 'package:location/location.dart';
import 'package:meta/meta.dart';

part 'map_location_state.dart';

class MapLocationCubit extends Cubit<MapLocationState> {
  MapLocationCubit() : super(MapLocationInitial()) {
    getCurrentLocation();
  }

  final Location _location = Location();

  Future<void> getCurrentLocation() async {
    emit(MapLocationLoading());
    try {
      final serviceEnabled = await _location.serviceEnabled();
      if (!serviceEnabled) {
        final result = await _location.requestService();
        if (!result) {
          emit(MapLocationError(message: 'Location service is disabled'));
          return;
        }
      }

      PermissionStatus permissionStatus = await _location.hasPermission();
      if (permissionStatus == PermissionStatus.denied) {
        permissionStatus = await _location.requestPermission();
        if (permissionStatus != PermissionStatus.granted) {
          emit(MapLocationPermissionDenied());
          return;
        }
      }

      final locationData = await _location.getLocation();
      emit(
        MapLocationLoaded(
          latitude: locationData.latitude,
          longitude: locationData.longitude,
        ),
      );
    } catch (e) {
      emit(MapLocationError(message: e.toString()));
    }
  }

  void listenToLocationChanges() {
    _location.onLocationChanged.listen(
      (LocationData locationData) {
        emit(
          MapLocationLoaded(
            latitude: locationData.latitude,
            longitude: locationData.longitude,
          ),
        );
      },
      onError: (error) {
        emit(MapLocationError(message: error.toString()));
      },
    );
  }

  Future<void> pickLocation(double latitude, double longitude) async {
    try {
      final placemarks = await geocoding.Geocoding().placemarkFromCoordinates(
        latitude,
        longitude,
      );
      if (placemarks.isNotEmpty) {
        final place = placemarks.first;
        emit(
          MapLocationPicked(
            latitude: latitude,
            longitude: longitude,
            address: place.name ?? place.thoroughfare ?? '',
            street: [
              place.subThoroughfare,
              place.thoroughfare,
            ].where((p) => p != null && p.isNotEmpty).join(' '),
            city: place.locality ?? place.subAdministrativeArea ?? '',
            zipCode: place.postalCode ?? '',
            country: place.country ?? '',
          ),
        );
      } else {
        emit(MapLocationPicked(latitude: latitude, longitude: longitude));
      }
    } catch (e) {
      emit(MapLocationPicked(latitude: latitude, longitude: longitude));
    }
  }
}
