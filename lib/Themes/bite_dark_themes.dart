import 'package:bite_food_delivery/Themes/bite_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData _theme(Color primaryColor) {
  return ThemeData(
    colorScheme: ColorScheme.dark(
      brightness: Brightness.dark,
      primary: Colors.deepOrange,
      secondary: Colors.grey.shade600,
      onSecondary: Colors.grey.shade400,
      secondaryFixed: Colors.grey.shade200,
      onSecondaryFixed: Colors.grey.shade100.withAlpha(50),
      surface: const Color.fromARGB(255, 0, 18, 27),
      onSurface: Colors.white,
      onSurfaceVariant: Colors.white70,
    ),
    useMaterial3: true,

    textTheme: biteTextStyles,
    appBarTheme: AppBarTheme(
      titleTextStyle: GoogleFonts.sen(
        fontSize: 30.sp,
        fontWeight: FontWeight.bold,
        color: Colors.deepOrange,
      ),
    ),
  );
}

class BiteDarkThemes {
  static final themeOrange = _theme(Colors.deepOrange);
  static final themeBlue = _theme(Colors.blue);
  static final themeGreen = _theme(Colors.green);
  static final themePurple = _theme(Colors.purple);
  static final themePink = _theme(Colors.pink);
  static final themeTeal = _theme(Colors.teal);
  static final themeIndigo = _theme(Colors.indigo);
}
