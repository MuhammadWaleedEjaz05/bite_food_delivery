import 'package:flutter/material.dart';

extension AppThemeContext on BuildContext {
  ColorScheme get appColors => Theme.of(this).colorScheme;
}
