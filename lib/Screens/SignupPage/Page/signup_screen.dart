import 'package:bite_food_delivery/GlobalWidgets/bite_app_bar.dart';
import 'package:bite_food_delivery/GlobalWidgets/bite_user_auth_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

final _formKey = GlobalKey<FormState>();

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
                    _SignupCredentialsSection(),

                    20.verticalSpace,
                    _SignupActionSection(),
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
                // Perform signup action
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
            child: Text('Sign Up'),
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
          BiteUserAuthTextField(title: 'Full Name'),
          20.verticalSpace,
          BiteUserAuthTextField(title: 'Email', isEmail: true),
          20.verticalSpace,
          BiteUserAuthTextField(title: 'Phone Number', isPhone: true),
          20.verticalSpace,
          BiteUserAuthTextField(isPassword: true, title: 'Password'),
          20.verticalSpace,
          BiteUserAuthTextField(isPassword: true, title: 'Confirm Password'),
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
          'Sign Up',
          style: GoogleFonts.sen(
            fontSize: 40.sp,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),

        Text(
          'Please Sign Up to get started',
          style: GoogleFonts.sen(fontSize: 20.sp, color: Colors.white),
        ),
      ],
    );
  }
}
