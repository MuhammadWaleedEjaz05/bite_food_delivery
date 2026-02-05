import 'package:flutter/material.dart';

final ThemeData lightTheme = ThemeData(
  scaffoldBackgroundColor: Colors.white,
  brightness: Brightness.light,
  primaryColor: Colors.deepOrange,
  primaryColorLight: Colors.deepOrangeAccent,
  primaryColorDark: Colors.deepOrange.shade900,
  appBarTheme: AppBarTheme(backgroundColor: Colors.white.withAlpha(0)),
);
