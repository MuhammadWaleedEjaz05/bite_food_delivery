import 'package:bite_food_delivery/core/extensions/theme_extensions.dart';
import 'package:bite_food_delivery/widgets/app_bouncing_tap.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AuthSocialButton extends StatelessWidget {
  final String svgAsset;
  final VoidCallback? onTap;
  final bool isLoading;

  const AuthSocialButton({
    super.key,
    required this.svgAsset,
    required this.onTap,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.appColors;

    return AppBouncingTap(
      onTap: isLoading ? null : onTap,
      pressedScale: 0.92,
      child: Container(
        height: 54.r,
        width: 54.r,
        decoration: BoxDecoration(
          color: colors.surfaceContainerHighest.withValues(alpha: 0.4),
          borderRadius: BorderRadius.circular(16.r),
          border: Border.all(
            color: colors.outlineVariant.withValues(alpha: 0.4),
            width: 1,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.03),
              blurRadius: 6.r,
              offset: Offset(0, 2.r),
            ),
          ],
        ),
        child: Center(
          child: isLoading
              ? SizedBox(
                  height: 22.r,
                  width: 22.r,
                  child: CircularProgressIndicator(
                    strokeWidth: 2.r,
                    color: colors.primary,
                  ),
                )
              : SvgPicture.asset(svgAsset, height: 26.r, width: 26.r),
        ),
      ),
    );
  }
}
