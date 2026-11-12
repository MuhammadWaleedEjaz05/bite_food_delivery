import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
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
    LatLng? location;
    try {
      if (json['location'] != null) {
        final locMap = json['location'] as Map<String, dynamic>;
        final latitude = locMap['latitude'];
        final longitude = locMap['longitude'];
        if (latitude != null && longitude != null) {
          location = LatLng(
            (latitude as num).toDouble(),
            (longitude as num).toDouble(),
          );
        }
      }
    } catch (e) {
      debugPrint('Error parsing location: $e');
      location = null;
    }

    return AddressModel(
      addressID: (json['id'] ?? json['addressID'] ?? '') as String,
      userID: (json['userID'] ?? '') as String,
      label: (json['label'] as String?) ?? 'Other',
      street: (json['street'] ?? '') as String,
      city: (json['city'] ?? '') as String,
      zipCode: (json['zipCode'] ?? '') as String,
      country: (json['country'] ?? '') as String,
      location: location,
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

  AddressModel copyWith({
    String? addressID,
    String? userID,
    String? label,
    String? street,
    String? city,
    String? zipCode,
    String? country,
    LatLng? location,
  }) {
    return AddressModel(
      addressID: addressID ?? this.addressID,
      userID: userID ?? this.userID,
      label: label ?? this.label,
      street: street ?? this.street,
      city: city ?? this.city,
      zipCode: zipCode ?? this.zipCode,
      country: country ?? this.country,
      location: location ?? this.location,
    );
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
