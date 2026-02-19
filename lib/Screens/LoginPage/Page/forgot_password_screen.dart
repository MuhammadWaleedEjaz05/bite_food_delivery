import 'package:bite_food_delivery/Cubits/UserAuthCubit/user_auth_cubit.dart';
import 'package:bite_food_delivery/GlobalWidgets/bite_app_bar.dart';
import 'package:bite_food_delivery/GlobalWidgets/bite_user_auth_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

final _forgotPasswordFormKey = GlobalKey<FormState>();
final _forgotPasswordEmailController = TextEditingController();

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  @override
  void dispose() {
    _forgotPasswordEmailController.dispose();
    super.dispose();
  }

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
                    Form(
                      key: _forgotPasswordFormKey,
                      child: BiteUserAuthTextField(
                        title: 'Email',
                        isEmail: true,
                        controller: _forgotPasswordEmailController,
                      ),
                    ),
                    20.verticalSpace,
                    BlocConsumer<UserAuthCubit, UserAuthState>(
                      listener: (context, state) {
                        if (state is UserAuthInitial) {
                          // Show confirmation dialog
                          showDialog(
                            context: context,
                            barrierDismissible: false,
                            builder: (BuildContext dialogContext) {
                              return AlertDialog(
                                title: Text(
                                  'Password Reset Link Sent',
                                  style: GoogleFonts.sen(
                                    fontSize: 20.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                content: Text(
                                  'Check your email for a password reset link. Click the link to reset your password on our website.',
                                  style: GoogleFonts.sen(fontSize: 16.sp),
                                ),
                                actions: [
                                  ElevatedButton(
                                    onPressed: () {
                                      Navigator.pop(dialogContext);
                                      Navigator.pop(context);
                                      ScaffoldMessenger.of(
                                        context,
                                      ).clearSnackBars();
                                      ScaffoldMessenger.of(
                                        context,
                                      ).showSnackBar(
                                        const SnackBar(
                                          content: Text(
                                            'Password reset successfully! Please login with your new password.',
                                          ),
                                          backgroundColor: Colors.green,
                                          duration: Duration(seconds: 3),
                                        ),
                                      );
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.deepOrange,
                                      foregroundColor: Colors.white,
                                    ),
                                    child: Text(
                                      'Done',
                                      style: GoogleFonts.sen(
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            },
                          );
                        } else if (state is UserAuthError) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(state.message),
                              backgroundColor: Colors.red,
                            ),
                          );
                        }
                      },
                      builder: (context, state) {
                        final isLoading = state is UserLoading;
                        return Row(
                          children: [
                            Expanded(
                              child: ElevatedButton(
                                onPressed: isLoading
                                    ? null
                                    : () {
                                        if (_forgotPasswordFormKey.currentState!
                                            .validate()) {
                                          BlocProvider.of<UserAuthCubit>(
                                            context,
                                          ).resetPassword(
                                            _forgotPasswordEmailController.text
                                                .trim(),
                                          );
                                        }
                                      },
                                style: TextButton.styleFrom(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 20.w,
                                    vertical: 10.h,
                                  ),
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
                                child: isLoading
                                    ? const SizedBox(
                                        height: 24,
                                        width: 24,
                                        child: CircularProgressIndicator(
                                          strokeWidth: 2,
                                          valueColor:
                                              AlwaysStoppedAnimation<Color>(
                                                Colors.white,
                                              ),
                                        ),
                                      )
                                    : Text('Send Reset Link'),
                              ),
                            ),
                          ],
                        );
                      },
                    ),
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
          'Forgot Password',
          style: GoogleFonts.sen(
            fontSize: 40.sp,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),

        Text(
          'Please enter your email address to receive a password reset link.',
          style: GoogleFonts.sen(fontSize: 15.sp, color: Colors.white),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
