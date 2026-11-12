import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

extension ContentInsets on BuildContext {
  EdgeInsets contentInsets({double top = 0, double bottom = 28}) {
    final gutter = math.max(20.r, (MediaQuery.sizeOf(this).width - 760.r) / 2);
    return EdgeInsets.fromLTRB(gutter, top.r, gutter, bottom.r);
  }
}
