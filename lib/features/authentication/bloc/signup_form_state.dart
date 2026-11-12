import 'package:equatable/equatable.dart';

class SignupFormState extends Equatable {
  final String fullName;
  final String email;
  final String phoneNumber;
  final String password;
  final String confirmPassword;
  final bool isPasswordVisible;
  final bool isConfirmPasswordVisible;
  final String? fullNameError;
  final String? emailError;
  final String? phoneError;
  final String? passwordError;
  final String? confirmPasswordError;

  const SignupFormState({
    this.fullName = '',
    this.email = '',
    this.phoneNumber = '',
    this.password = '',
    this.confirmPassword = '',
    this.isPasswordVisible = false,
    this.isConfirmPasswordVisible = false,
    this.fullNameError,
    this.emailError,
    this.phoneError,
    this.passwordError,
    this.confirmPasswordError,
  });

  SignupFormState copyWith({
    String? fullName,
    String? email,
    String? phoneNumber,
    String? password,
    String? confirmPassword,
    bool? isPasswordVisible,
    bool? isConfirmPasswordVisible,
    String? Function()? fullNameError,
    String? Function()? emailError,
    String? Function()? phoneError,
    String? Function()? passwordError,
    String? Function()? confirmPasswordError,
  }) {
    return SignupFormState(
      fullName: fullName ?? this.fullName,
      email: email ?? this.email,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      password: password ?? this.password,
      confirmPassword: confirmPassword ?? this.confirmPassword,
      isPasswordVisible: isPasswordVisible ?? this.isPasswordVisible,
      isConfirmPasswordVisible:
          isConfirmPasswordVisible ?? this.isConfirmPasswordVisible,
      fullNameError: fullNameError != null
          ? fullNameError()
          : this.fullNameError,
      emailError: emailError != null ? emailError() : this.emailError,
      phoneError: phoneError != null ? phoneError() : this.phoneError,
      passwordError: passwordError != null
          ? passwordError()
          : this.passwordError,
      confirmPasswordError: confirmPasswordError != null
          ? confirmPasswordError()
          : this.confirmPasswordError,
    );
  }

  @override
  List<Object?> get props => [
    fullName,
    email,
    phoneNumber,
    password,
    confirmPassword,
    isPasswordVisible,
    isConfirmPasswordVisible,
    fullNameError,
    emailError,
    phoneError,
    passwordError,
    confirmPasswordError,
  ];
}
