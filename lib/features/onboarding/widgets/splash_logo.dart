import 'package:bite_food_delivery/app/theme/app_text_styles.dart';
import 'package:bite_food_delivery/core/extensions/theme_extensions.dart';
import 'package:bite_food_delivery/widgets/app_text.dart';
import 'package:material_ui/material_ui.dart';
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
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 100.r,
              height: 100.r,
              padding: EdgeInsets.all(20.r),
              decoration: BoxDecoration(
                color: colors.surface,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: colors.primary.withValues(alpha: 0.25),
                    blurRadius: 28.r,
                    offset: Offset(0, 8.h),
                  ),
                ],
              ),
              child: Center(
                child: SvgPicture.asset(
                  'assets/svgs/logo.svg',
                  height: 60.r,
                  width: 60.r,
                  colorFilter: ColorFilter.mode(
                    colors.primary,
                    BlendMode.srcIn,
                  ),
                ),
              ),
            ),
            20.verticalSpace,
            AppText(
              'BITE',
              style: AppTextStyles.headlineLarge(context).copyWith(
                fontWeight: FontWeight.w900,
                letterSpacing: 3.5,
                color: colors.primary,
              ),
            ),
            6.verticalSpace,
            AppText(
              'DELICIOUS FOOD DELIVERED',
              style: AppTextStyles.labelSmall(context).copyWith(
                letterSpacing: 2.2,
                fontWeight: FontWeight.w700,
                color: colors.onSurfaceVariant,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
