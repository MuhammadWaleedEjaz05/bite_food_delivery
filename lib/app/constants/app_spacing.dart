import 'package:material_ui/material_ui.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Centralized design-system spacing tokens for Bite food delivery.
/// All values scale responsively through `flutter_screenutil`.
abstract final class AppSpacing {
  /// 2.r - Micro spacing
  static double get xxs => 2.r;

  /// 4.r - Extra small spacing
  static double get xs => 4.r;

  /// 6.r - Small compact spacing
  static double get s => 6.r;

  /// 8.r - Standard compact spacing
  static double get sm => 8.r;

  /// 10.r - Moderate spacing
  static double get md => 10.r;

  /// 12.r - Base standard spacing
  static double get base => 12.r;

  /// 14.r - Mid spacing
  static double get mid => 14.r;

  /// 16.r - Large spacing (standard container/card padding)
  static double get lg => 16.r;

  /// 20.r - Extra large spacing (screen horizontal gutters)
  static double get xl => 20.r;

  /// 24.r - Double extra large spacing (section margins)
  static double get xxl => 24.r;

  /// 32.r - Triple extra large spacing (major divides)
  static double get xxxl => 32.r;

  /// 40.r - Hero / page top spacing
  static double get huge => 40.r;

  // ---------------------------------------------------------------------------
  // Vertical gap widgets (SizedBox with verticalSpace)
  // ---------------------------------------------------------------------------
  static Widget get gapV2 => 2.verticalSpace;
  static Widget get gapV4 => 4.verticalSpace;
  static Widget get gapV6 => 6.verticalSpace;
  static Widget get gapV8 => 8.verticalSpace;
  static Widget get gapV10 => 10.verticalSpace;
  static Widget get gapV12 => 12.verticalSpace;
  static Widget get gapV14 => 14.verticalSpace;
  static Widget get gapV16 => 16.verticalSpace;
  static Widget get gapV20 => 20.verticalSpace;
  static Widget get gapV24 => 24.verticalSpace;
  static Widget get gapV32 => 32.verticalSpace;
  static Widget get gapV40 => 40.verticalSpace;

  // ---------------------------------------------------------------------------
  // Horizontal gap widgets (SizedBox with horizontalSpace)
  // ---------------------------------------------------------------------------
  static Widget get gapH2 => 2.horizontalSpace;
  static Widget get gapH4 => 4.horizontalSpace;
  static Widget get gapH6 => 6.horizontalSpace;
  static Widget get gapH8 => 8.horizontalSpace;
  static Widget get gapH10 => 10.horizontalSpace;
  static Widget get gapH12 => 12.horizontalSpace;
  static Widget get gapH14 => 14.horizontalSpace;
  static Widget get gapH16 => 16.horizontalSpace;
  static Widget get gapH20 => 20.horizontalSpace;
  static Widget get gapH24 => 24.horizontalSpace;
}

/// Standardized `EdgeInsets` helpers for unified padding across all components and screens.
abstract final class AppPadding {
  // Uniform all-sides padding
  static EdgeInsets get allXS => EdgeInsets.all(AppSpacing.xs);
  static EdgeInsets get allSM => EdgeInsets.all(AppSpacing.sm);
  static EdgeInsets get allMD => EdgeInsets.all(AppSpacing.md);
  static EdgeInsets get allBase => EdgeInsets.all(AppSpacing.base);
  static EdgeInsets get allLG => EdgeInsets.all(AppSpacing.lg);
  static EdgeInsets get allXL => EdgeInsets.all(AppSpacing.xl);
  static EdgeInsets get allXXL => EdgeInsets.all(AppSpacing.xxl);

  // Symmetric padding
  static EdgeInsets horizontal(double value) =>
      EdgeInsets.symmetric(horizontal: value.w);
  static EdgeInsets vertical(double value) =>
      EdgeInsets.symmetric(vertical: value.h);
  static EdgeInsets symmetric({double horizontal = 0, double vertical = 0}) =>
      EdgeInsets.symmetric(horizontal: horizontal.w, vertical: vertical.h);

  // Asymmetric padding
  static EdgeInsets only({
    double left = 0,
    double top = 0,
    double right = 0,
    double bottom = 0,
  }) => EdgeInsets.only(
    left: left.w,
    top: top.h,
    right: right.w,
    bottom: bottom.h,
  );

  // Semantic layout padding presets
  /// Screen gutters: horizontal 20.w, vertical 12.h
  static EdgeInsets get screen => EdgeInsets.symmetric(
    horizontal: AppSpacing.xl,
    vertical: AppSpacing.base,
  );

  /// Section padding: horizontal 20.w, vertical 12.h
  static EdgeInsets get section => screen;

  /// Card body padding: 16.r all around
  static EdgeInsets get card => EdgeInsets.all(AppSpacing.lg);

  /// Compact card padding: 12.r all around
  static EdgeInsets get cardCompact => EdgeInsets.all(AppSpacing.base);

  /// Chip / Filter Pill padding: 14.w horizontal, 8.h vertical
  static EdgeInsets get chip =>
      EdgeInsets.symmetric(horizontal: AppSpacing.mid, vertical: AppSpacing.sm);

  /// Badge / Status tag padding: 8.w horizontal, 4.h vertical
  static EdgeInsets get badge =>
      EdgeInsets.symmetric(horizontal: AppSpacing.sm, vertical: AppSpacing.xs);

  /// Text field input content padding: 16.w horizontal, 14.h vertical
  static EdgeInsets get input =>
      EdgeInsets.symmetric(horizontal: AppSpacing.lg, vertical: AppSpacing.mid);

  /// Button padding: 20.w horizontal, 14.h vertical
  static EdgeInsets get button =>
      EdgeInsets.symmetric(horizontal: AppSpacing.xl, vertical: AppSpacing.mid);

  /// List tile padding: 16.w horizontal, 12.h vertical
  static EdgeInsets get tile => EdgeInsets.symmetric(
    horizontal: AppSpacing.lg,
    vertical: AppSpacing.base,
  );
}

/// Standardized `BorderRadius` helpers for consistent curvature and squircle styling.
abstract final class AppRadius {
  static BorderRadius get xs => BorderRadius.circular(6.r);
  static BorderRadius get sm => BorderRadius.circular(10.r);
  static BorderRadius get md => BorderRadius.circular(14.r);
  static BorderRadius get lg => BorderRadius.circular(18.r);
  static BorderRadius get xl => BorderRadius.circular(24.r);
  static BorderRadius get full => BorderRadius.circular(999.r);

  static BorderRadius circular(double radius) =>
      BorderRadius.circular(radius.r);
}
