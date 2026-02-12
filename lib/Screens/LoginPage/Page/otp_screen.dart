import 'package:bite_food_delivery/GlobalWidgets/bite_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/otp_field_style.dart';
import 'package:otp_text_field/style.dart';

class OTPScreen extends StatelessWidget {
  const OTPScreen({super.key});

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
                    OTPTextField(
                      outlineBorderRadius: 5.r,
                      fieldWidth: 40.w,
                      length: 6,
                      style: GoogleFonts.sen(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.deepOrange,
                      ),

                      fieldStyle: FieldStyle.box,
                      otpFieldStyle: OtpFieldStyle(
                        focusBorderColor: Colors.deepOrange,
                        disabledBorderColor: Colors.deepOrange,
                        enabledBorderColor: Colors.deepOrange,
                        backgroundColor: Colors.white,
                        borderColor: Colors.grey,
                      ),
                      onCompleted: (value) =>
                          Navigator.pushNamed(context, '/new_password_screen'),

                      textFieldAlignment: MainAxisAlignment.spaceEvenly,
                    ),
                    20.verticalSpace,
                    // Row(
                    //   children: [
                    //     Expanded(
                    //       child: ElevatedButton(
                    //         onPressed: () {},
                    //         style: TextButton.styleFrom(
                    //           padding: EdgeInsets.symmetric(
                    //             horizontal: 20.w,
                    //             vertical: 10.h,
                    //           ),
                    //           backgroundColor: Colors.deepOrange,
                    //           foregroundColor: Colors.white,
                    //           shape: RoundedRectangleBorder(
                    //             borderRadius: BorderRadius.circular(10.r),
                    //           ),
                    //           textStyle: GoogleFonts.sen(
                    //             fontSize: 20.sp,
                    //             fontWeight: FontWeight.bold,
                    //           ),
                    //         ),
                    //         child: Text('Verify'),
                    //       ),
                    //     ),
                    //   ],
                    // ),
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
          'Verification',
          style: GoogleFonts.sen(
            fontSize: 40.sp,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),

        Text(
          'Please enter the verification code sent to your email address.',
          style: GoogleFonts.sen(fontSize: 15.sp, color: Colors.white),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
