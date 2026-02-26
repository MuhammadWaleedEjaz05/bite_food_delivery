import 'package:bite_food_delivery/Screens/OnboardingPage/Page/onboarding_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class BiteCarouselSliderPage extends StatelessWidget {
  final String title;
  final String description;
  final int index;
  const BiteCarouselSliderPage({
    super.key,
    required this.title,
    required this.description,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Flexible(
          child: Container(
            width: 250.w,
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(10.r),
            ),
          ),
        ),
        20.verticalSpace,
        Text(
          title,
          style: GoogleFonts.sen(fontSize: 20.sp, fontWeight: FontWeight.bold),
        ),
        10.verticalSpace,
        Text(
          description,
          style: GoogleFonts.sen(fontSize: 15.sp, color: Colors.grey),
        ),
        5.verticalSpace,
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            carouselPages.length,
            (carouselCurrentPage) => Container(
              height: 10.h,
              width: 10.w,
              margin: EdgeInsets.symmetric(horizontal: 5.w),
              decoration: BoxDecoration(
                color: carouselCurrentPage == index
                    ? Colors.deepOrange
                    : Colors.grey,
                borderRadius: BorderRadius.circular(5.r),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
