import 'package:bite_food_delivery/Cubits/UserAuthCubit/user_auth_cubit.dart';
import 'package:bite_food_delivery/GlobalWidgets/bite_app_bar.dart';
import 'package:bite_food_delivery/GlobalWidgets/bite_user_auth_text_field.dart';
import 'package:bite_food_delivery/Models/user_model.dart';
import 'package:bite_food_delivery/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

final _formKey = GlobalKey<FormState>();
final _emailController = TextEditingController();
final _passwordController = TextEditingController();
final _confirmPasswordController = TextEditingController();
final _fullNameController = TextEditingController();
final _phoneController = TextEditingController();

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: Column(
        children: [
          Expanded(
            child: Container(
              decoration: const BoxDecoration(color: Colors.blueGrey),
              child: const _HeadTitleSection(),
            ),
          ),
          Expanded(
            flex: 2,
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(32.r),
                topRight: Radius.circular(32.r),
              ),
              child: Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.surface,
                ),
                child: ListView(
                  padding: EdgeInsets.symmetric(
                    horizontal: 15.r,
                    vertical: 20.h,
                  ),
                  children: [
                    10.verticalSpace,
                    const _SignupCredentialsSection(),

                    20.verticalSpace,
                    const _SignupActionSection(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _SignupActionSection extends StatelessWidget {
  const _SignupActionSection();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ElevatedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                BlocProvider.of<UserAuthCubit>(context)
                    .register(
                      UserModel(
                        fullName: _fullNameController.text.trim(),
                        email: _emailController.text.trim(),
                        password: _passwordController.text.trim(),
                        phoneNumber: _phoneController.text.trim(),
                      ),
                    )
                    .then((_) {
                      Navigator.pop(context);
                    });
              }
            },
            style: TextButton.styleFrom(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
              backgroundColor: Theme.of(context).colorScheme.primary,
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.r),
              ),
              textStyle: Theme.of(context).textTheme.titleLarge,
            ),
            child: Text(S.of(context).signUp),
          ),
        ),
      ],
    );
  }
}

class _SignupCredentialsSection extends StatelessWidget {
  const _SignupCredentialsSection();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          BiteUserAuthTextField(
            title: S.of(context).fullName,
            controller: _fullNameController,
          ),
          20.verticalSpace,
          BiteUserAuthTextField(
            title: S.of(context).email,
            isEmail: true,
            controller: _emailController,
          ),
          20.verticalSpace,
          BiteUserAuthTextField(
            title: S.of(context).phoneNumber,
            isPhone: true,
            controller: _phoneController,
          ),
          20.verticalSpace,
          BiteUserAuthTextField(
            isPassword: true,
            title: S.of(context).password,
            controller: _passwordController,
          ),
          20.verticalSpace,
          BiteUserAuthTextField(
            isPassword: true,
            title: S.of(context).confirmPassword,
            controller: _confirmPasswordController,
          ),
        ],
      ),
    );
  }
}

class _HeadTitleSection extends StatelessWidget {
  const _HeadTitleSection();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const BiteAppBar(
          backButton: true,
          isDarkMode: true,
          title: SizedBox.shrink(),
          actions: [],
        ),
        Text(S.of(context).signUp, style: Theme.of(context).textTheme.displayLarge),

        Text(
          S.of(context).pleaseSignUpToGetStarted,
          style: Theme.of(
            context,
          ).textTheme.titleLarge!.copyWith(color: Colors.white),
        ),
      ],
    );
  }
}
