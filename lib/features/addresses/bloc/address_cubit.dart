import 'package:bite_food_delivery/features/addresses/models/address_model.dart';
import 'package:bite_food_delivery/core/services/firebase/firebase_auth_conn.dart';
import 'package:bite_food_delivery/core/services/firebase/firebase_db_conn.dart';
import 'package:bloc/bloc.dart';
import 'package:material_ui/material_ui.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'address_state.dart';

class AddressCubit extends Cubit<AddressState> {
  AddressCubit() : super(AddressInitial());

  Future<void> loadAddresses() async {
    try {
      emit(AddressLoading());
      final user = getCurrentUser();
      if (user == null) {
        emit(AddressError(message: 'User not authenticated'));
        return;
      }

      final db = getCollection('UsersDB');

      final addressesSnapshot = await db
          .doc(user.uid)
          .collection('addresses')
          .get();

      final addresses = <AddressModel>[];
      for (var doc in addressesSnapshot.docs) {
        try {
          final data = doc.data();

          if (!data.containsKey('id')) {
            data['id'] = doc.id;
          }
          addresses.add(AddressModel.fromJson(data));
        } catch (e) {
          debugPrint('Error parsing address: $e, Address data: ${doc.data()}');
        }
      }

      final prefs = await SharedPreferences.getInstance();
      final selectedAddressId = prefs.getString('selected_address_id');

      AddressModel? selectedAddress;
      if (selectedAddressId != null) {
        try {
          selectedAddress = addresses.firstWhere(
            (addr) => addr.addressID == selectedAddressId,
          );
        } catch (e) {
          selectedAddress = addresses.isNotEmpty ? addresses.first : null;
        }
      } else if (addresses.isNotEmpty) {
        selectedAddress = addresses.first;
      }
      emit(
        AddressesLoaded(addresses: addresses, selectedAddress: selectedAddress),
      );
    } catch (e) {
      debugPrint('Error in loadAddresses: $e');
      emit(AddressError(message: 'Failed to load addresses: ${e.toString()}'));
    }
  }

  Future<void> selectAddress(AddressModel address) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('selected_address_id', address.addressID);
      emit(AddressSelected(selectedAddress: address));

      await loadAddresses();
    } catch (e) {
      debugPrint('Error in selectAddress: $e');
      emit(AddressError(message: 'Failed to select address: ${e.toString()}'));
    }
  }

  Future<void> addAddress(AddressModel address) async {
    try {
      final user = getCurrentUser();
      if (user == null) {
        emit(AddressError(message: 'User not authenticated'));
        return;
      }

      final db = getCollection('UsersDB');

      await db
          .doc(user.uid)
          .collection('addresses')
          .doc(address.addressID)
          .set(address.toJson());

      await loadAddresses();
    } catch (e) {
      emit(AddressError(message: 'Failed to add address: ${e.toString()}'));
    }
  }

  Future<void> updateAddress(AddressModel address) async {
    try {
      final user = getCurrentUser();
      if (user == null) {
        emit(AddressError(message: 'User not authenticated'));
        return;
      }

      final db = getCollection('UsersDB');

      await db
          .doc(user.uid)
          .collection('addresses')
          .doc(address.addressID)
          .set(address.toJson());

      await loadAddresses();
    } catch (e) {
      emit(AddressError(message: 'Failed to update address: ${e.toString()}'));
    }
  }

  Future<void> deleteAddress(String addressID) async {
    try {
      final user = getCurrentUser();
      if (user == null) {
        emit(AddressError(message: 'User not authenticated'));
        return;
      }

      final db = getCollection('UsersDB');

      await db.doc(user.uid).collection('addresses').doc(addressID).delete();

      await loadAddresses();
    } catch (e) {
      emit(AddressError(message: 'Failed to delete address: ${e.toString()}'));
    }
  }
}
