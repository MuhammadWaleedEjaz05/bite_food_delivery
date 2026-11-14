import 'package:material_ui/material_ui.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Raw palette values are confined to the theme definition.
abstract final class AppTheme {
  static const accents = [
    Color(0xFFFF5222), // Vibrant Modern Food Delivery Coral-Orange
    Color(0xFF245DB2),
    Color(0xFF277344),
    Color(0xFF7746A5),
    Color(0xFFAF376D),
    Color(0xFF007C78),
    Color(0xFF4A51AA),
  ];

  static ThemeData lightTheme({int accentIndex = 0}) =>
      build(brightness: Brightness.light, accentIndex: accentIndex);

  static ThemeData darkTheme({int accentIndex = 0}) =>
      build(brightness: Brightness.dark, accentIndex: accentIndex);

  static ThemeData build({
    required Brightness brightness,
    int accentIndex = 0,
  }) {
    final index = accentIndex >= 0 && accentIndex < accents.length
        ? accentIndex
        : 0;
    final dark = brightness == Brightness.dark;
    final scheme =
        ColorScheme.fromSeed(
          seedColor: accents[index],
          brightness: brightness,
        ).copyWith(
          surface: dark ? const Color(0xFF111114) : const Color(0xFFFAFAFC),
          surfaceContainerLow: dark
              ? const Color(0xFF1B1B22)
              : const Color(0xFFFFFFFF),
          surfaceContainerHighest: dark
              ? const Color(0xFF282834)
              : const Color(0xFFF0F1F5),
        );
    final base = ThemeData(
      brightness: brightness,
      colorScheme: scheme,
      useMaterial3: true,
      fontFamily: 'Sen',
    );
    final text = base.textTheme
        .copyWith(
          headlineLarge: TextStyle(
            fontFamily: 'Sen',
            fontSize: 28.sp,
            height: 1.15,
            fontWeight: FontWeight.w800,
          ),
          headlineMedium: TextStyle(
            fontFamily: 'Sen',
            fontSize: 28.sp,
            height: 1.2,
            fontWeight: FontWeight.w700,
          ),
          titleLarge: TextStyle(
            fontFamily: 'Sen',
            fontSize: 19.sp,
            height: 1.3,
            fontWeight: FontWeight.w700,
          ),
          titleMedium: TextStyle(
            fontFamily: 'Sen',
            fontSize: 15.5.sp,
            height: 1.35,
            fontWeight: FontWeight.w700,
          ),
          bodyLarge: TextStyle(fontFamily: 'Sen', fontSize: 15.sp, height: 1.5),
          bodyMedium: TextStyle(
            fontFamily: 'Sen',
            fontSize: 13.5.sp,
            height: 1.45,
          ),
          labelLarge: TextStyle(
            fontFamily: 'Sen',
            fontSize: 13.sp,
            height: 1.3,
            fontWeight: FontWeight.w700,
          ),
          labelMedium: TextStyle(
            fontFamily: 'Sen',
            fontSize: 12.sp,
            height: 1.3,
            fontWeight: FontWeight.w600,
          ),
          labelSmall: TextStyle(
            fontFamily: 'Sen',
            fontSize: 11.sp,
            height: 1.3,
            fontWeight: FontWeight.w600,
          ),
        )
        .apply(bodyColor: scheme.onSurface, displayColor: scheme.onSurface);
    return base.copyWith(
      textTheme: text,
      scaffoldBackgroundColor: scheme.surface,
    );
  }
}
