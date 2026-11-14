import 'package:cupertino_ui/cupertino_ui.dart' as cui;
import 'package:flutter/widgets.dart';
import 'package:material_ui/material_ui.dart' as mui;
import 'package:bite_food_delivery/l10n/app_localizations.dart';

const List<LocalizationsDelegate<dynamic>> appLocalizationsDelegates = [
  ...AppLocalizations.localizationsDelegates,
  mui.GlobalMaterialLocalizations.delegate,
  cui.GlobalCupertinoLocalizations.delegate,
];

