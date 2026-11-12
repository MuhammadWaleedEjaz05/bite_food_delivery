import 'package:equatable/equatable.dart';

/// Domain coordinates, independent of map and persistence SDKs.
class Coordinates extends Equatable {
  const Coordinates(this.latitude, this.longitude);
  final double latitude, longitude;
  @override
  List<Object> get props => [latitude, longitude];
}
