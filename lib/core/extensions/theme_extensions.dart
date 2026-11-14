import 'package:material_ui/material_ui.dart';

extension AppThemeContext on BuildContext {
  ColorScheme get appColors => Theme.of(this).colorScheme;
}
