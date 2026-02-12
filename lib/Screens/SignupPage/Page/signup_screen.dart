import 'package:bite_food_delivery/GlobalWidgets/bite_address_text_field.dart';
import 'package:bite_food_delivery/GlobalWidgets/bite_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

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
                    BiteAddressTextField(title: 'Full Name'),
                    20.verticalSpace,
                    BiteAddressTextField(title: 'Email'),
                    20.verticalSpace,
                    BiteAddressTextField(title: 'Phone Number'),
                    20.verticalSpace,
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Expanded(
                            child: BiteAddressTextField(title: 'Password'),
                          ),
                          SizedBox(width: 10.w),
                          SizedBox(
                            height: 56.h,
                            child: IconButton(
                              onPressed: () {},
                              style: TextButton.styleFrom(
                                padding: EdgeInsets.all(10.r),
                                backgroundColor: Colors.grey.shade200,
                                foregroundColor: Colors.deepOrange,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.r),
                                ),
                                textStyle: GoogleFonts.sen(
                                  fontSize: 25.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              icon: Icon(Icons.visibility),
                            ),
                          ),
                        ],
                      ),
                    ),
                    20.verticalSpace,
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Expanded(
                            child: BiteAddressTextField(
                              title: 'Confirm Password',
                            ),
                          ),
                          SizedBox(width: 10.w),
                          SizedBox(
                            height: 56.h,
                            child: IconButton(
                              onPressed: () {},
                              style: TextButton.styleFrom(
                                padding: EdgeInsets.all(10.r),
                                backgroundColor: Colors.grey.shade200,
                                foregroundColor: Colors.deepOrange,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.r),
                                ),
                                textStyle: GoogleFonts.sen(
                                  fontSize: 25.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              icon: Icon(Icons.visibility),
                            ),
                          ),
                        ],
                      ),
                    ),
                    20.verticalSpace,
                    Row(
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {},
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
                            child: Text('Sign Up'),
                          ),
                        ),
                      ],
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
