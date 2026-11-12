import 'package:bite_food_delivery/features/authentication/bloc/signup_form_state.dart';
import 'package:bite_food_delivery/features/authentication/bloc/user_auth_cubit.dart';
import 'package:bite_food_delivery/features/authentication/models/user_model.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignupFormCubit extends Cubit<SignupFormState> {
  SignupFormCubit() : super(const SignupFormState());

  void setFullName(String name) {
    emit(state.copyWith(fullName: name, fullNameError: () => null));
  }

  void setEmail(String email) {
    emit(state.copyWith(email: email, emailError: () => null));
  }

  void setPhoneNumber(String phone) {
    emit(state.copyWith(phoneNumber: phone, phoneError: () => null));
  }

  void setPassword(String password) {
    emit(state.copyWith(password: password, passwordError: () => null));
  }

  void setConfirmPassword(String confirm) {
    emit(
      state.copyWith(
        confirmPassword: confirm,
        confirmPasswordError: () => null,
      ),
    );
  }

  void togglePasswordVisibility() {
    emit(state.copyWith(isPasswordVisible: !state.isPasswordVisible));
  }

  void toggleConfirmPasswordVisibility() {
    emit(
      state.copyWith(isConfirmPasswordVisible: !state.isConfirmPasswordVisible),
    );
  }

  bool validate() {
    String? nameErr;
    String? emailErr;
    String? phoneErr;
    String? passErr;
    String? confirmErr;

    if (state.fullName.trim().isEmpty) {
      nameErr = 'Please enter your full name';
    }

    if (state.email.trim().isEmpty) {
      emailErr = 'Please enter your email';
    } else if (!state.email.contains('@') || !state.email.contains('.')) {
      emailErr = 'Please enter a valid email address';
    }

    if (state.phoneNumber.trim().isEmpty) {
      phoneErr = 'Please enter your phone number';
    }

    if (state.password.trim().isEmpty) {
      passErr = 'Please enter your password';
    } else if (state.password.trim().length < 8) {
      passErr = 'Password must be at least 8 characters long';
    }

    if (state.confirmPassword.trim().isEmpty) {
      confirmErr = 'Please confirm your password';
    } else if (state.confirmPassword != state.password) {
      confirmErr = 'Passwords do not match';
    }

    emit(
      state.copyWith(
        fullNameError: () => nameErr,
        emailError: () => emailErr,
        phoneError: () => phoneErr,
        passwordError: () => passErr,
        confirmPasswordError: () => confirmErr,
      ),
    );

    return nameErr == null &&
        emailErr == null &&
        phoneErr == null &&
        passErr == null &&
        confirmErr == null;
  }

  Future<void> submit(BuildContext context) async {
    if (!validate()) return;

    final user = UserModel(
      fullName: state.fullName.trim(),
      email: state.email.trim(),
      phoneNumber: state.phoneNumber.trim(),
      password: state.password.trim(),
    );

    await context.read<UserAuthCubit>().register(user);
  }
}
