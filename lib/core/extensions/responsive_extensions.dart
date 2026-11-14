import 'dart:math' as math;
import 'package:material_ui/material_ui.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

export 'package:bite_food_delivery/app/constants/app_spacing.dart';
export 'package:bite_food_delivery/core/extensions/spacing_extensions.dart';

extension ContentInsets on BuildContext {
  EdgeInsets contentInsets({double top = 0, double bottom = 20}) {
    final gutter = math.max(20.r, (MediaQuery.sizeOf(this).width - 760.r) / 2);
    return EdgeInsets.fromLTRB(gutter, top.r, gutter, bottom.r);
  }
}
