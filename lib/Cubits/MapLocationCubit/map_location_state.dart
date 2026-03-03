part of 'map_location_cubit.dart';

@immutable
sealed class MapLocationState {}

final class MapLocationInitial extends MapLocationState {}

final class MapLocationLoading extends MapLocationState {}

final class MapLocationLoaded extends MapLocationState {
  final double latitude;
  final double longitude;

  MapLocationLoaded({required this.latitude, required this.longitude});
}

final class MapLocationPermissionDenied extends MapLocationState {}

final class MapLocationPicked extends MapLocationState {
  final double latitude;
  final double longitude;
  final String? address;
  final String? street;
  final String? city;
  final String? zipCode;
  final String? country;

  MapLocationPicked({
    required this.latitude,
    required this.longitude,
    this.address,
    this.street,
    this.city,
    this.zipCode,
    this.country,
  });
}

final class MapLocationError extends MapLocationState {
  final String message;

  MapLocationError({required this.message});
}
