import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

final TextTheme biteTextStyles = TextTheme(
  displayLarge: GoogleFonts.sen(
    fontSize: 40.sp,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  ),
  displayMedium: GoogleFonts.sen(fontSize: 34.sp, fontWeight: FontWeight.bold),
  displaySmall: GoogleFonts.sen(fontSize: 30.sp, fontWeight: FontWeight.bold),
  headlineLarge: GoogleFonts.sen(fontSize: 25.sp, fontWeight: FontWeight.bold),
  headlineMedium: GoogleFonts.sen(fontSize: 24.sp, fontWeight: FontWeight.bold),
  headlineSmall: GoogleFonts.sen(
    fontSize: 22.5.sp,
    fontWeight: FontWeight.bold,
  ),
  titleLarge: GoogleFonts.sen(fontSize: 20.sp, fontWeight: FontWeight.bold),
  titleMedium: GoogleFonts.sen(fontSize: 18.sp, fontWeight: FontWeight.bold),
  titleSmall: GoogleFonts.sen(fontSize: 16.sp, fontWeight: FontWeight.bold),
  bodyMedium: GoogleFonts.sen(fontSize: 15.sp),
  bodySmall: GoogleFonts.sen(fontSize: 14.sp),
  labelLarge: GoogleFonts.sen(fontSize: 13.sp),
  labelMedium: GoogleFonts.sen(fontSize: 12.sp),
  labelSmall: GoogleFonts.sen(fontSize: 17.5.sp),
);
