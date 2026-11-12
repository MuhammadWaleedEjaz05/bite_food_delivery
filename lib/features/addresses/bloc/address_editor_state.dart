import 'package:equatable/equatable.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class AddressEditorState extends Equatable {
  final String street;
  final String city;
  final String zipCode;
  final String country;
  final String label;
  final LatLng? location;
  final bool isSubmitting;
  final String? errorMessage;
  final bool isSaved;

  const AddressEditorState({
    this.street = '',
    this.city = '',
    this.zipCode = '',
    this.country = '',
    this.label = 'Home',
    this.location,
    this.isSubmitting = false,
    this.errorMessage,
    this.isSaved = false,
  });

  bool get isValid =>
      street.trim().isNotEmpty &&
      city.trim().isNotEmpty &&
      country.trim().isNotEmpty;

  AddressEditorState copyWith({
    String? street,
    String? city,
    String? zipCode,
    String? country,
    String? label,
    LatLng? location,
    bool? isSubmitting,
    String? errorMessage,
    bool? isSaved,
  }) {
    return AddressEditorState(
      street: street ?? this.street,
      city: city ?? this.city,
      zipCode: zipCode ?? this.zipCode,
      country: country ?? this.country,
      label: label ?? this.label,
      location: location ?? this.location,
      isSubmitting: isSubmitting ?? this.isSubmitting,
      errorMessage: errorMessage,
      isSaved: isSaved ?? this.isSaved,
    );
  }

  @override
  List<Object?> get props => [
    street,
    city,
    zipCode,
    country,
    label,
    location,
    isSubmitting,
    errorMessage,
    isSaved,
  ];
}
