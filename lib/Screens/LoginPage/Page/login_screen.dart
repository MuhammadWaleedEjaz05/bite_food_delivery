import 'package:bite_food_delivery/GlobalWidgets/bite_app_bar.dart';
import 'package:bite_food_delivery/GlobalWidgets/bite_user_auth_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

final _formKey = GlobalKey<FormState>();

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
          children: [Text('Or', style: GoogleFonts.sen(fontSize: 20.sp))],
        ),
        5.verticalSpace,
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 10.w,
          children: [
            CircleAvatar(
              backgroundColor: Colors.grey.shade200,
              radius: 40.r,
              child: SvgPicture.asset(
                'assets/svgs/google.svg',
                height: 30.h,
                width: 30.w,
              ),
            ),
            CircleAvatar(
              backgroundColor: Colors.grey.shade200,
              radius: 40.r,
              child: SvgPicture.asset(
                'assets/svgs/facebook.svg',
                height: 40.h,
                width: 40.w,
              ),
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
          style: GoogleFonts.sen(fontSize: 15.sp),
        ),
        TextButton(
          onPressed: () => Navigator.pushNamed(context, '/signup_screen'),
          style: TextButton.styleFrom(
            padding: EdgeInsets.all(10.r),
            foregroundColor: Colors.deepOrange,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.r),
            ),
            textStyle: GoogleFonts.sen(
              fontSize: 15.sp,
              fontWeight: FontWeight.bold,
            ),
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
                // Perform login action
              }
            },
            style: TextButton.styleFrom(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
              backgroundColor: Colors.deepOrange,
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.r),
              ),
              textStyle: GoogleFonts.sen(
                fontSize: 20.sp,
                fontWeight: FontWeight.bold,
              ),
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
            Text('Remember me', style: GoogleFonts.sen(fontSize: 15.sp)),
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
            textStyle: GoogleFonts.sen(
              fontSize: 15.sp,
              fontWeight: FontWeight.bold,
            ),
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
          BiteUserAuthTextField(title: 'Email', isEmail: true),
          20.verticalSpace,
          BiteUserAuthTextField(isPassword: true, title: 'Password'),
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
        Text(
          'Log In',
          style: GoogleFonts.sen(
            fontSize: 40.sp,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),

        Text(
          'Please Sign In to Continue',
          style: GoogleFonts.sen(fontSize: 20.sp, color: Colors.white),
        ),
      ],
    );
  }
}
