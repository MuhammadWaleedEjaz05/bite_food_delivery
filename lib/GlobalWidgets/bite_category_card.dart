import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class BiteCategoryCard extends StatelessWidget {
  const BiteCategoryCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () => Navigator.pushNamed(context, '/category_screen'),
          child: Card(
            elevation: 4,
            margin: EdgeInsets.symmetric(vertical: 15.h, horizontal: 5.w),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.r),
              side: BorderSide(color: Colors.white),
            ),
            color: Colors.white,
            child: Container(
              height: 90.h,
              width: 110.w,
              margin: EdgeInsets.all(15.r),
              decoration: BoxDecoration(
                color: Colors.blueGrey,
                borderRadius: BorderRadius.circular(20.r),
              ),
            ),
          ),
        ),
        Text('Category Name', style: GoogleFonts.sen(fontSize: 15.sp)),
      ],
    );
  }
}
