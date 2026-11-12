import 'package:bite_food_delivery/features/addresses/bloc/address_cubit.dart';
import 'package:bite_food_delivery/features/addresses/models/address_model.dart';
import 'package:bloc/bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:uuid/uuid.dart';
import 'address_editor_state.dart';

class AddressEditorCubit extends Cubit<AddressEditorState> {
  AddressEditorCubit({AddressModel? initialAddress})
    : super(
        initialAddress != null
            ? AddressEditorState(
                street: initialAddress.street,
                city: initialAddress.city,
                zipCode: initialAddress.zipCode,
                country: initialAddress.country,
                label: initialAddress.label,
                location: initialAddress.location,
              )
            : const AddressEditorState(),
      );

  void setStreet(String value) => emit(state.copyWith(street: value));
  void setCity(String value) => emit(state.copyWith(city: value));
  void setZipCode(String value) => emit(state.copyWith(zipCode: value));
  void setCountry(String value) => emit(state.copyWith(country: value));
  void setLabel(String value) => emit(state.copyWith(label: value));
  void setLocation(LatLng value) => emit(state.copyWith(location: value));

  void updateFromLocationPick({
    required double latitude,
    required double longitude,
    String? street,
    String? city,
    String? zipCode,
    String? country,
  }) {
    emit(
      state.copyWith(
        location: LatLng(latitude, longitude),
        street: street != null && street.isNotEmpty ? street : state.street,
        city: city != null && city.isNotEmpty ? city : state.city,
        zipCode: zipCode != null && zipCode.isNotEmpty
            ? zipCode
            : state.zipCode,
        country: country != null && country.isNotEmpty
            ? country
            : state.country,
      ),
    );
  }

  Future<void> save({
    required AddressCubit addressCubit,
    required String userId,
    String? addressId,
  }) async {
    if (!state.isValid) {
      emit(state.copyWith(errorMessage: 'Please fill in all required fields'));
      return;
    }

    emit(state.copyWith(isSubmitting: true, errorMessage: null));
    try {
      final model = AddressModel(
        addressID: addressId ?? const Uuid().v4(),
        userID: userId,
        label: state.label,
        street: state.street.trim(),
        city: state.city.trim(),
        zipCode: state.zipCode.trim(),
        country: state.country.trim(),
        location: state.location,
      );

      if (addressId != null) {
        await addressCubit.updateAddress(model);
      } else {
        await addressCubit.addAddress(model);
      }
      if (!isClosed) emit(state.copyWith(isSubmitting: false, isSaved: true));
    } catch (e) {
      if (!isClosed) {
        emit(
          state.copyWith(
            isSubmitting: false,
            errorMessage: 'Failed to save address: $e',
          ),
        );
      }
    }
  }
}
