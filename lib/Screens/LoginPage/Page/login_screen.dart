import 'package:bite_food_delivery/Cubits/RememberMeCubit/remember_me_cubit.dart';
import 'package:bite_food_delivery/Cubits/UserAuthCubit/user_auth_cubit.dart';
import 'package:bite_food_delivery/GlobalWidgets/bite_app_bar.dart';
import 'package:bite_food_delivery/GlobalWidgets/bite_user_auth_text_field.dart';
import 'package:bite_food_delivery/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

final _formKey = GlobalKey<FormState>();

final _emailController = TextEditingController();
final _passwordController = TextEditingController();

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

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
                    const _LoginCredentialSection(),

                    10.verticalSpace,
                    const _LoginOptionalSelectionSection(),
                    20.verticalSpace,
                    const _LoginActionButton(),
                    const _NoAccountSection(),
                    5.verticalSpace,
                    const _OtherLoginOptionSection(),
                    10.verticalSpace,
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

class _OtherLoginOptionSection extends StatelessWidget {
  const _OtherLoginOptionSection();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              S.of(context).or,
              style: Theme.of(
                context,
              ).textTheme.titleLarge!.copyWith(fontWeight: FontWeight.normal),
            ),
          ],
        ),
        20.verticalSpace,
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 10.w,
          children: [
            BlocConsumer<UserAuthCubit, UserAuthState>(
              listener: (context, state) {
                if (state is UserLoggedIn) {
                  Navigator.pop(context);
                  showTopSnackBar(
                    Overlay.of(context),
                    CustomSnackBar.success(
                      message: S.of(context).successfullySignedInWithGoogle,
                    ),
                  );
                } else if (state is UserAuthError) {
                  showTopSnackBar(
                    Overlay.of(context),
                    CustomSnackBar.error(message: state.message),
                  );
                  debugPrint(
                    S.of(context).googleSigninErrorStatemessage(state.message),
                  );
                }
              },
              builder: (context, state) {
                final isLoading = state is UserLoading;
                return GestureDetector(
                  onTap: isLoading
                      ? null
                      : () {
                          context.read<UserAuthCubit>().signInWithGoogle();
                        },
                  child: CircleAvatar(
                    backgroundColor: Colors.grey.shade200,
                    radius: 30.r,
                    child: isLoading
                        ? const CircularProgressIndicator()
                        : SvgPicture.asset(
                            'assets/svgs/google.svg',
                            height: 30.h,
                            width: 30.w,
                          ),
                  ),
                );
              },
            ),
          ],
        ),
      ],
    );
  }
}

class _NoAccountSection extends StatelessWidget {
  const _NoAccountSection();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          S.of(context).dontHaveAnAccount,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        TextButton(
          onPressed: () => Navigator.pushNamed(context, '/signup_screen'),
          style: TextButton.styleFrom(
            padding: EdgeInsets.all(10.r),
            foregroundColor: Theme.of(context).colorScheme.primary,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.r),
            ),
            textStyle: Theme.of(
              context,
            ).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.bold),
          ),
          child: Text(S.of(context).signUp),
        ),
      ],
    );
  }
}

class _LoginActionButton extends StatelessWidget {
  const _LoginActionButton();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ElevatedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                context
                    .read<UserAuthCubit>()
                    .login(
                      _emailController.text.trim(),
                      _passwordController.text.trim(),
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
            child: Text(S.of(context).login),
          ),
        ),
      ],
    );
  }
}

class _LoginOptionalSelectionSection extends StatelessWidget {
  const _LoginOptionalSelectionSection();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RememberMeCubit, RememberMeState>(
      builder: (context, state) {
        return Row(
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Checkbox(
                  value: state.isRememberMe,
                  onChanged: (value) {
                    context.read<RememberMeCubit>().toggleRememberMe(
                      value ?? false,
                      email: _emailController.text.trim(),
                      password: _passwordController.text.trim(),
                    );
                  },
                ),
                Text(
                  S.of(context).rememberMe,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ],
            ),
            const Spacer(),
            TextButton(
              onPressed: () =>
                  Navigator.pushNamed(context, '/forgot_password_screen'),
              style: TextButton.styleFrom(
                padding: EdgeInsets.all(10.r),
                foregroundColor: Theme.of(context).colorScheme.primary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.r),
                ),
                textStyle: Theme.of(
                  context,
                ).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.bold),
              ),
              child: Text(S.of(context).forgotPassword),
            ),
          ],
        );
      },
    );
  }
}

class _LoginCredentialSection extends StatelessWidget {
  const _LoginCredentialSection();

  @override
  Widget build(BuildContext context) {
    _emailController.text = context.watch<RememberMeCubit>().state.email ?? '';
    _passwordController.text =
        context.watch<RememberMeCubit>().state.password ?? '';
    return Form(
      key: _formKey,
      child: Column(
        children: [
          BiteUserAuthTextField(
            title: S.of(context).email,
            isEmail: true,
            controller: _emailController,
          ),
          20.verticalSpace,
          BiteUserAuthTextField(
            isPassword: true,
            title: S.of(context).password,
            controller: _passwordController,
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
        Text(
          S.of(context).logIn,
          style: Theme.of(context).textTheme.displayLarge,
        ),

        Text(
          S.of(context).pleaseSignInToContinue,
          style: Theme.of(
            context,
          ).textTheme.titleLarge!.copyWith(color: Colors.white),
        ),
      ],
    );
  }
}
