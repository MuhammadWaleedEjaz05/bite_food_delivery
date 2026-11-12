import 'package:bite_food_delivery/app/constants/app_spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Context extensions providing ergonomic access to consistent spacing,
/// paddings, and responsive screen gutters.
extension SpacingContextExtensions on BuildContext {
  /// Standard horizontal screen gutter for this device (20.w clamped)
  EdgeInsets get screenGutter =>
      EdgeInsets.symmetric(horizontal: AppSpacing.xl);

  /// Screen gutter with customized vertical padding
  EdgeInsets gutterWith({double top = 0, double bottom = 0}) => EdgeInsets.only(
    left: AppSpacing.xl,
    right: AppSpacing.xl,
    top: top.h,
    bottom: bottom.h,
  );

  /// Standard section padding (20.w horizontal, 12.h vertical)
  EdgeInsets get sectionPadding => AppPadding.section;

  /// Card content padding (16.r all sides)
  EdgeInsets get cardPadding => AppPadding.card;

  /// Compact card padding (12.r all sides)
  EdgeInsets get cardCompactPadding => AppPadding.cardCompact;
}

