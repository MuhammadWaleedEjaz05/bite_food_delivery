import 'package:equatable/equatable.dart';

class ForgotPasswordFormState extends Equatable {
  final String email;
  final String? emailError;
  final bool isSubmitted;

  const ForgotPasswordFormState({
    this.email = '',
    this.emailError,
    this.isSubmitted = false,
  });

  ForgotPasswordFormState copyWith({
    String? email,
    String? Function()? emailError,
    bool? isSubmitted,
  }) {
    return ForgotPasswordFormState(
      email: email ?? this.email,
      emailError: emailError != null ? emailError() : this.emailError,
      isSubmitted: isSubmitted ?? this.isSubmitted,
    );
  }

  @override
  List<Object?> get props => [email, emailError, isSubmitted];
}
