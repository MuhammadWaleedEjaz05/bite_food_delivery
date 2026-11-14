import 'package:bite_food_delivery/app/theme/app_theme.dart';
import 'package:material_ui/material_ui.dart';

extension AppThemeContext on BuildContext {
  ColorScheme get appColors => Theme.of(this).colorScheme;

  Color get pastelMint => Theme.of(this).brightness == Brightness.dark
      ? const Color(0xFF192A20)
      : AppPastelColors.mint;

  Color get pastelSkyBlue => Theme.of(this).brightness == Brightness.dark
      ? const Color(0xFF162534)
      : AppPastelColors.skyBlue;

  Color get pastelButter => Theme.of(this).brightness == Brightness.dark
      ? const Color(0xFF2C2818)
      : AppPastelColors.butter;

  Color get pastelPeach => Theme.of(this).brightness == Brightness.dark
      ? const Color(0xFF2E1F1A)
      : AppPastelColors.peach;
}
