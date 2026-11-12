import 'package:bite_food_delivery/core/extensions/theme_extensions.dart';
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

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: isLoading ? null : onTap,
        borderRadius: BorderRadius.circular(16.r),
        child: Container(
          height: 54.r,
          width: 54.r,
          decoration: BoxDecoration(
            color: colors.surfaceContainerHighest.withValues(alpha: 0.4),
            borderRadius: BorderRadius.circular(16.r),
            border: Border.all(
              color: colors.outlineVariant.withValues(alpha: 0.3),
            ),
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
      ),
    );
  }
}
