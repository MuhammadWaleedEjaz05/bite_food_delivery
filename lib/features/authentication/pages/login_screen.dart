import 'package:bite_food_delivery/app/routes/app_navigation.dart';
import 'package:bite_food_delivery/features/authentication/bloc/login_form_cubit.dart';
import 'package:bite_food_delivery/features/authentication/bloc/remember_me_cubit.dart';
import 'package:bite_food_delivery/features/authentication/bloc/user_auth_cubit.dart';
import 'package:bite_food_delivery/features/authentication/sections/login_actions_section.dart';
import 'package:bite_food_delivery/features/authentication/sections/login_form_section.dart';
import 'package:bite_food_delivery/features/authentication/sections/login_header_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final rememberedEmail = context.read<RememberMeCubit>().state.email ?? '';

    return BlocProvider(
      create: (_) => LoginFormCubit(initialEmail: rememberedEmail),
      child: BlocListener<UserAuthCubit, UserAuthState>(
        listener: (context, state) {
          if (state is UserLoggedIn) {
            AppNavigation.finishSignIn(context);
          }
        },
        child: const Scaffold(
          body: SafeArea(
            child: CustomScrollView(
              key: PageStorageKey('login_screen'),
              physics: BouncingScrollPhysics(
                parent: AlwaysScrollableScrollPhysics(),
              ),
              slivers: [
                LoginHeaderSection(),
                LoginFormSection(),
                LoginActionsSection(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
