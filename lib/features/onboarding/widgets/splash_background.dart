import 'package:bite_food_delivery/core/extensions/theme_extensions.dart';
import 'package:material_ui/material_ui.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashBackground extends StatelessWidget {
  final Animation<double> scaleAnimation;

  const SplashBackground({super.key, required this.scaleAnimation});

  @override
  Widget build(BuildContext context) {
    final colors = context.appColors;
    final dark = Theme.of(context).brightness == Brightness.dark;

    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            gradient: RadialGradient(
              center: Alignment.center,
              radius: 1.1,
              colors: [
                dark
                    ? colors.surfaceContainer
                    : context.pastelButter.withValues(alpha: 0.35),
                colors.surface,
              ],
            ),
          ),
        ),
        Positioned(
          left: -100.w,
          top: -100.h,
          child: ScaleTransition(
            scale: scaleAnimation,
            child: SvgPicture.asset(
              'assets/svgs/circle.svg',
              height: 200.h,
              colorFilter: ColorFilter.mode(
                colors.primary.withValues(alpha: 0.12),
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
              colorFilter: ColorFilter.mode(
                colors.primary.withValues(alpha: 0.85),
                BlendMode.srcIn,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
