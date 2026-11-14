import 'package:bite_food_delivery/app/theme/app_text_styles.dart';
import 'package:bite_food_delivery/core/extensions/theme_extensions.dart';
import 'package:bite_food_delivery/widgets/app_text.dart';
import 'package:material_ui/material_ui.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OnboardingSlide extends StatelessWidget {
  final String assetName;
  final String title;
  final String description;

  const OnboardingSlide({
    super.key,
    required this.assetName,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.appColors;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 170.r,
            width: 170.r,
            padding: const EdgeInsets.all(20).r,
            decoration: BoxDecoration(
              color: colors.primary.withValues(alpha: 0.08),
              shape: BoxShape.circle,
            ),
            child: Center(
              child: assetName.endsWith('.svg')
                  ? SvgPicture.asset(
                      assetName,
                      height: 100.r,
                      width: 100.r,
                      fit: BoxFit.contain,
                    )
                  : Image.asset(
                      assetName,
                      height: 100.r,
                      width: 100.r,
                      fit: BoxFit.contain,
                    ),
            ),
          ),
          24.verticalSpace,
          AppText(
            title,
            style: AppTextStyles.headlineSmall(
              context,
            ).copyWith(fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          12.verticalSpace,
          AppText(
            description,
            style: AppTextStyles.bodyMedium(
              context,
            ).copyWith(color: colors.onSurfaceVariant),
            textAlign: TextAlign.center,
            maxLines: 3,
          ),
        ],
      ),
    );
  }
}
