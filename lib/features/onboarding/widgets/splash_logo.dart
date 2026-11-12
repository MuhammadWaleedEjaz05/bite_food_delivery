import 'package:bite_food_delivery/core/extensions/theme_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashLogo extends StatelessWidget {
  final Animation<double> opacityAnimation;

  const SplashLogo({super.key, required this.opacityAnimation});

  @override
  Widget build(BuildContext context) {
    final colors = context.appColors;

    return Center(
      child: FadeTransition(
        opacity: opacityAnimation,
        child: SvgPicture.asset(
          'assets/svgs/logo.svg',
          height: 180.h,
          colorFilter: ColorFilter.mode(colors.primary, BlendMode.srcIn),
        ),
      ),
    );
  }
}
