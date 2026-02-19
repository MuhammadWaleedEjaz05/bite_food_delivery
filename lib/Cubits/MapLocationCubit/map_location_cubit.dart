import 'package:bloc/bloc.dart';
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
      // Check if location service is enabled
      final serviceEnabled = await _location.serviceEnabled();
      if (!serviceEnabled) {
        final result = await _location.requestService();
        if (!result) {
          emit(MapLocationError(message: 'Location service is disabled'));
          return;
        }
      }

      // Check permission status
      PermissionStatus permissionStatus = await _location.hasPermission();
      if (permissionStatus == PermissionStatus.denied) {
        permissionStatus = await _location.requestPermission();
        if (permissionStatus != PermissionStatus.granted) {
          emit(MapLocationPermissionDenied());
          return;
        }
      }

      // Get current location
      final locationData = await _location.getLocation();
      emit(
        MapLocationLoaded(
          latitude: locationData.latitude ?? 37.7749,
          longitude: locationData.longitude ?? -122.4194,
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
            latitude: locationData.latitude ?? 37.7749,
            longitude: locationData.longitude ?? -122.4194,
          ),
        );
      },
      onError: (error) {
        emit(MapLocationError(message: error.toString()));
      },
    );
  }
}
