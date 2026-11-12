import 'package:bite_food_delivery/features/authentication/bloc/forgot_password_form_state.dart';
import 'package:bite_food_delivery/features/authentication/bloc/user_auth_cubit.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ForgotPasswordFormCubit extends Cubit<ForgotPasswordFormState> {
  ForgotPasswordFormCubit() : super(const ForgotPasswordFormState());

  void setEmail(String email) {
    emit(state.copyWith(email: email, emailError: () => null));
  }

  bool validate() {
    String? emailErr;

    if (state.email.trim().isEmpty) {
      emailErr = 'Please enter your email';
    } else if (!state.email.contains('@') || !state.email.contains('.')) {
      emailErr = 'Please enter a valid email address';
    }

    emit(state.copyWith(emailError: () => emailErr));
    return emailErr == null;
  }

  Future<void> submit(BuildContext context) async {
    if (!validate()) return;
    emit(state.copyWith(isSubmitted: true));
    await context.read<UserAuthCubit>().resetPassword(state.email.trim());
  }
}
