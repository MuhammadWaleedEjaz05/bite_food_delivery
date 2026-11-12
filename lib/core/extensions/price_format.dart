import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

extension PriceFormat on BuildContext {
  String priceLabel(double amount) => NumberFormat.simpleCurrency(
    locale: Localizations.localeOf(this).toString(),
    name: 'PKR',
    decimalDigits: 2,
  ).format(amount);
}
