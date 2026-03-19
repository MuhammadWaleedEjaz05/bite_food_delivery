part of 'address_cubit.dart';

@immutable
sealed class AddressState {}

final class AddressInitial extends AddressState {}

final class AddressLoading extends AddressState {}

final class AddressesLoaded extends AddressState {
  final List<AddressModel> addresses;
  final AddressModel? selectedAddress;

  AddressesLoaded({required this.addresses, this.selectedAddress});
}

final class AddressSelected extends AddressState {
  final AddressModel selectedAddress;

  AddressSelected({required this.selectedAddress});
}

final class AddressError extends AddressState {
  final String message;

  AddressError({required this.message});
}
