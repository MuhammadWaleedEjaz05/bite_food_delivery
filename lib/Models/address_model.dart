import 'package:equatable/equatable.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class AddressModel extends Equatable {
  final String addressID;
  final String userID;
  final String label;
  final String street;
  final String city;
  final String zipCode;
  final String country;
  final LatLng? location;

  const AddressModel({
    required this.addressID,
    required this.userID,
    required this.label,
    required this.street,
    required this.city,
    required this.zipCode,
    required this.country,
    this.location,
  });

  factory AddressModel.fromJson(Map<String, dynamic> json) {
    return AddressModel(
      addressID: json['id'] as String,
      userID: json['userID'] as String,
      label: json['label'] as String? ?? 'Other',
      street: json['street'] as String,
      city: json['city'] as String,
      zipCode: json['zipCode'] as String,
      country: json['country'] as String,
      location: json['location'] != null
          ? LatLng(
              (json['location']['latitude'] as num).toDouble(),
              (json['location']['longitude'] as num).toDouble(),
            )
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': addressID,
      'userID': userID,
      'label': label,
      'street': street,
      'city': city,
      'zipCode': zipCode,
      'country': country,
      'location': location != null
          ? {'latitude': location!.latitude, 'longitude': location!.longitude}
          : null,
    };
  }

  @override
  List<Object?> get props => [
    addressID,
    userID,
    label,
    street,
    city,
    zipCode,
    country,
    location,
  ];
}
