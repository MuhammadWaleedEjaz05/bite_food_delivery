import 'package:bite_food_delivery/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

List<Tab> getTabsList(BuildContext context) => [
  Tab(text: AppLocalizations.of(context)!.ongoing),
  Tab(text: AppLocalizations.of(context)!.history),
];
