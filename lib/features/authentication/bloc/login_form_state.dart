import 'package:equatable/equatable.dart';

class LoginFormState extends Equatable {
  final String email;
  final String password;
  final bool isPasswordVisible;
  final String? emailError;
  final String? passwordError;

  const LoginFormState({
    this.email = '',
    this.password = '',
    this.isPasswordVisible = false,
    this.emailError,
    this.passwordError,
  });

  bool get isValid =>
      email.trim().isNotEmpty &&
      email.contains('@') &&
      password.trim().length >= 6;

  LoginFormState copyWith({
    String? email,
    String? password,
    bool? isPasswordVisible,
    String? Function()? emailError,
    String? Function()? passwordError,
  }) {
    return LoginFormState(
      email: email ?? this.email,
      password: password ?? this.password,
      isPasswordVisible: isPasswordVisible ?? this.isPasswordVisible,
      emailError: emailError != null ? emailError() : this.emailError,
      passwordError: passwordError != null
          ? passwordError()
          : this.passwordError,
    );
  }

  @override
  List<Object?> get props => [
    email,
    password,
    isPasswordVisible,
    emailError,
    passwordError,
  ];
}
