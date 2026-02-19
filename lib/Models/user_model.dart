import 'package:bite_food_delivery/Models/address_model.dart';
import 'package:equatable/equatable.dart';

class UserModel extends Equatable {
  final String? id;
  final String fullName;
  final String email;
  final String? password;
  final String? phoneNumber;
  final String? photoUrl;
  final String? bio;
  final List<AddressModel>? addresses;

  const UserModel({
    this.id,
    required this.fullName,
    required this.email,
    this.password,
    this.phoneNumber,
    this.photoUrl,
    this.bio,
    this.addresses,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'] as String?,
      fullName: json['fullName'] as String,
      email: json['email'] as String,
      password: json['password'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
      photoUrl: json['photoUrl'] as String?,
      bio: json['bio'] as String?,
      addresses: (json['addresses'] as List<dynamic>?)
          ?.map(
            (addressJson) =>
                AddressModel.fromJson(addressJson as Map<String, dynamic>),
          )
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'fullName': fullName,
      'email': email,
      'password': password,
      'phoneNumber': phoneNumber,
      'photoUrl': photoUrl,
      'bio': bio,
      'addresses': addresses?.map((address) => address.toJson()).toList(),
    };
  }

  UserModel copyWith({
    String? id,
    String? fullName,
    String? email,
    String? password,
    String? phoneNumber,
    String? photoUrl,
    String? bio,
    List<AddressModel>? addresses,
  }) {
    return UserModel(
      id: id ?? this.id,
      fullName: fullName ?? this.fullName,
      email: email ?? this.email,
      password: password ?? this.password,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      photoUrl: photoUrl ?? this.photoUrl,
      bio: bio ?? this.bio,
      addresses: addresses ?? this.addresses,
    );
  }

  @override
  List<Object?> get props => [
    id,
    fullName,
    email,
    password,
    phoneNumber,
    photoUrl,
    bio,
    addresses,
  ];
}
