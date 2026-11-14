import 'dart:io';
import 'package:flutter/widgets.dart';

abstract final class EnvironmentUtils {
  static bool get isTest =>
      WidgetsBinding.instance.runtimeType.toString().contains('Test') ||
      Platform.environment.containsKey('FLUTTER_TEST');
}

