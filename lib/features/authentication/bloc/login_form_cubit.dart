import 'package:bite_food_delivery/features/authentication/bloc/login_form_state.dart';
import 'package:bite_food_delivery/features/authentication/bloc/remember_me_cubit.dart';
import 'package:bite_food_delivery/features/authentication/bloc/user_auth_cubit.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginFormCubit extends Cubit<LoginFormState> {
  LoginFormCubit({String initialEmail = ''})
    : super(LoginFormState(email: initialEmail));

  void setEmail(String email) {
    emit(state.copyWith(email: email, emailError: () => null));
  }

  void setPassword(String password) {
    emit(state.copyWith(password: password, passwordError: () => null));
  }

  void togglePasswordVisibility() {
    emit(state.copyWith(isPasswordVisible: !state.isPasswordVisible));
  }

  bool validate() {
    String? emailErr;
    String? passwordErr;

    if (state.email.trim().isEmpty) {
      emailErr = 'Please enter your email';
    } else if (!state.email.contains('@') || !state.email.contains('.')) {
      emailErr = 'Please enter a valid email address';
    }

    if (state.password.trim().isEmpty) {
      passwordErr = 'Please enter your password';
    } else if (state.password.trim().length < 6) {
      passwordErr = 'Password must be at least 6 characters';
    }

    emit(
      state.copyWith(
        emailError: () => emailErr,
        passwordError: () => passwordErr,
      ),
    );

    return emailErr == null && passwordErr == null;
  }

  Future<void> submit(BuildContext context) async {
    if (!validate()) return;

    final rememberCubit = context.read<RememberMeCubit>();
    rememberCubit.toggleRememberMe(
      rememberCubit.state.isRememberMe,
      email: state.email.trim(),
    );

    await context.read<UserAuthCubit>().login(
      state.email.trim(),
      state.password.trim(),
    );
  }
}
