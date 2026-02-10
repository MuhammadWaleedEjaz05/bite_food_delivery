import 'package:bite_food_delivery/Widgets/bite_menu_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class BitePaymentBlock extends StatelessWidget {
  final String svgPath;
  const BitePaymentBlock({super.key, required this.svgPath});

  @override
  Widget build(BuildContext context) {
    return BiteMenuSection(
      menuItems: [SvgPicture.asset(svgPath, height: 60.h, width: 60.w)],
    );
  }
}
