import 'package:bite_food_delivery/features/authentication/bloc/signup_form_cubit.dart';
import 'package:bite_food_delivery/features/authentication/sections/signup_actions_section.dart';
import 'package:bite_food_delivery/features/authentication/sections/signup_form_section.dart';
import 'package:bite_food_delivery/features/authentication/sections/signup_header_section.dart';
import 'package:material_ui/material_ui.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SignupFormCubit(),
      child: const Scaffold(
        body: SafeArea(
          child: CustomScrollView(
            key: PageStorageKey('signup_screen'),
            physics: BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics(),
            ),
            slivers: [
              SignupHeaderSection(),
              SignupFormSection(),
              SignupActionsSection(),
            ],
          ),
        ),
      ),
    );
  }
}
