import 'package:flutter/material.dart';

abstract final class AppTextStyles {
  static TextStyle headlineLarge(BuildContext c) =>
      Theme.of(c).textTheme.headlineLarge!;
  static TextStyle headlineMedium(BuildContext c) =>
      Theme.of(c).textTheme.headlineMedium!;
  static TextStyle headlineSmall(BuildContext c) =>
      Theme.of(c).textTheme.headlineSmall ??
      Theme.of(c).textTheme.headlineMedium!;

  static TextStyle titleLarge(BuildContext c) =>
      Theme.of(c).textTheme.titleLarge!;
  static TextStyle titleMedium(BuildContext c) =>
      Theme.of(c).textTheme.titleMedium!;
  static TextStyle titleSmall(BuildContext c) =>
      Theme.of(c).textTheme.titleSmall ?? Theme.of(c).textTheme.titleMedium!;

  static TextStyle bodyLarge(BuildContext c) =>
      Theme.of(c).textTheme.bodyLarge!;
  static TextStyle bodyMedium(BuildContext c) =>
      Theme.of(c).textTheme.bodyMedium!;
  static TextStyle bodySmall(BuildContext c) =>
      Theme.of(c).textTheme.bodySmall ?? Theme.of(c).textTheme.bodyMedium!;

  static TextStyle labelLarge(BuildContext c) =>
      Theme.of(c).textTheme.labelLarge!;
  static TextStyle labelMedium(BuildContext c) =>
      Theme.of(c).textTheme.labelMedium ?? Theme.of(c).textTheme.labelLarge!;
  static TextStyle labelSmall(BuildContext c) =>
      Theme.of(c).textTheme.labelSmall!;
}
