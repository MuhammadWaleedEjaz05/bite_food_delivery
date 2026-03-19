import 'package:bite_food_delivery/src/core/themes/bite_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData _theme(Color primaryColor) {
  return ThemeData(
    colorScheme: ColorScheme.light(
      brightness: Brightness.light,
      primary: primaryColor,
      secondary: Colors.grey,
      onSecondary: Colors.grey.shade500,
      secondaryFixed: Colors.grey.shade300,
      onSecondaryFixed: Colors.grey.shade200,
      surface: Colors.white,
      onSurface: Colors.black,
      onSurfaceVariant: Colors.black54,
    ),
    useMaterial3: true,

    textTheme: biteTextStyles,
    appBarTheme: AppBarTheme(
      titleTextStyle: GoogleFonts.sen(
        fontSize: 30.sp,
        fontWeight: FontWeight.bold,
        color: primaryColor,
      ),
    ),
  );
}

class BiteLightThemes {
  static final themeOrange = _theme(Colors.deepOrange);
  static final themeBlue = _theme(Colors.blue);
  static final themeGreen = _theme(Colors.green);
  static final themePurple = _theme(Colors.purple);
  static final themePink = _theme(Colors.pink);
  static final themeTeal = _theme(Colors.teal);
  static final themeIndigo = _theme(Colors.indigo);
}
