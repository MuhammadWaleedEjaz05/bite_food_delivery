import 'package:bite_food_delivery/Cubits/UserAuthCubit/user_auth_cubit.dart';
import 'package:bite_food_delivery/GlobalWidgets/bite_app_bar.dart';
import 'package:bite_food_delivery/GlobalWidgets/bite_user_auth_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

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
              decoration: BoxDecoration(color: Colors.blueGrey),
              child: _HeadTitleSection(),
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
                decoration: BoxDecoration(color: Colors.white),
                child: ListView(
                  padding: EdgeInsets.symmetric(
                    horizontal: 15.r,
                    vertical: 20.h,
                  ),
                  children: [
                    10.verticalSpace,
                    _LoginCredentialSection(),

                    10.verticalSpace,
                    _LoginOptionalSelectionSection(),
                    20.verticalSpace,
                    _LoginActionButton(),
                    _NoAccountSection(),
                    5.verticalSpace,
                    _OtherLoginOptionSection(),
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
              'Or',
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
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Successfully signed in with Google!'),
                      backgroundColor: Colors.green,
                    ),
                  );
                } else if (state is UserAuthError) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(state.message),
                      backgroundColor: Colors.red,
                    ),
                  );
                  debugPrint('Google Sign-In Error: ${state.message}');
                }
              },
              builder: (context, state) {
                final isLoading = state is UserLoading;
                return GestureDetector(
                  onTap: isLoading
                      ? null
                      : () {
                          BlocProvider.of<UserAuthCubit>(
                            context,
                          ).signInWithGoogle();
                        },
                  child: CircleAvatar(
                    backgroundColor: Colors.grey.shade200,
                    radius: 30.r,
                    child: isLoading
                        ? CircularProgressIndicator()
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
          'Don\'t have an account? ',
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        TextButton(
          onPressed: () => Navigator.pushNamed(context, '/signup_screen'),
          style: TextButton.styleFrom(
            padding: EdgeInsets.all(10.r),
            foregroundColor: Colors.deepOrange,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.r),
            ),
            textStyle: Theme.of(
              context,
            ).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.bold),
          ),
          child: Text('Sign Up'),
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
                BlocProvider.of<UserAuthCubit>(context)
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
              backgroundColor: Colors.deepOrange,
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.r),
              ),
              textStyle: Theme.of(context).textTheme.titleLarge,
            ),
            child: Text('Login'),
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
    return Row(
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Checkbox(value: false, onChanged: (value) {}),
            Text('Remember me', style: Theme.of(context).textTheme.bodyMedium),
          ],
        ),
        Spacer(),
        TextButton(
          onPressed: () =>
              Navigator.pushNamed(context, '/forgot_password_screen'),
          style: TextButton.styleFrom(
            padding: EdgeInsets.all(10.r),
            foregroundColor: Colors.deepOrange,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.r),
            ),
            textStyle: Theme.of(
              context,
            ).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.bold),
          ),
          child: Text('Forgot Password?'),
        ),
      ],
    );
  }
}

class _LoginCredentialSection extends StatelessWidget {
  const _LoginCredentialSection();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          BiteUserAuthTextField(
            title: 'Email',
            isEmail: true,
            controller: _emailController,
          ),
          20.verticalSpace,
          BiteUserAuthTextField(
            isPassword: true,
            title: 'Password',
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
        BiteAppBar(
          backButton: true,
          isDarkMode: true,
          title: SizedBox.shrink(),
          actions: [],
        ),
        Text('Log In', style: Theme.of(context).textTheme.displayLarge),

        Text(
          'Please Sign In to Continue',
          style: Theme.of(
            context,
          ).textTheme.titleLarge!.copyWith(color: Colors.white),
        ),
      ],
    );
  }
}
