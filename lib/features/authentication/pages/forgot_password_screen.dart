import 'package:bite_food_delivery/features/authentication/bloc/forgot_password_form_cubit.dart';
import 'package:bite_food_delivery/features/authentication/sections/forgot_password_actions_section.dart';
import 'package:bite_food_delivery/features/authentication/sections/forgot_password_form_section.dart';
import 'package:bite_food_delivery/features/authentication/sections/forgot_password_header_section.dart';
import 'package:material_ui/material_ui.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ForgotPasswordFormCubit(),
      child: const Scaffold(
        body: SafeArea(
          child: CustomScrollView(
            key: PageStorageKey('forgot_password_screen'),
            physics: BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics(),
            ),
            slivers: [
              ForgotPasswordHeaderSection(),
              ForgotPasswordFormSection(),
              ForgotPasswordActionsSection(),
            ],
          ),
        ),
      ),
    );
  }
}
