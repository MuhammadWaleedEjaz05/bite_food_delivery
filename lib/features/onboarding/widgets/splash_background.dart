import 'package:bite_food_delivery/core/extensions/theme_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashBackground extends StatelessWidget {
  final Animation<double> scaleAnimation;

  const SplashBackground({super.key, required this.scaleAnimation});

  @override
  Widget build(BuildContext context) {
    final colors = context.appColors;

    return Stack(
      children: [
        Positioned(
          left: -100.w,
          top: -100.h,
          child: ScaleTransition(
            scale: scaleAnimation,
            child: SvgPicture.asset(
              'assets/svgs/circle.svg',
              height: 200.h,
              colorFilter: ColorFilter.mode(
                colors.primary.withValues(alpha: 0.15),
                BlendMode.srcIn,
              ),
            ),
          ),
        ),
        Positioned(
          right: -100.w,
          bottom: -100.h,
          child: ScaleTransition(
            scale: scaleAnimation,
            child: SvgPicture.asset(
              'assets/svgs/circle.svg',
              height: 200.h,
              colorFilter: ColorFilter.mode(colors.primary, BlendMode.srcIn),
            ),
          ),
        ),
      ],
    );
  }
}
