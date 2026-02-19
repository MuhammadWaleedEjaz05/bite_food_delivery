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

final class MapLocationError extends MapLocationState {
  final String message;

  MapLocationError({required this.message});
}
