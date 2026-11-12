import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:bite_food_delivery/widgets/app_text.dart';
import 'package:bite_food_delivery/app/theme/app_text_styles.dart';
import 'package:bite_food_delivery/core/extensions/theme_extensions.dart';

class HomeIntro extends StatelessWidget {
  const HomeIntro({super.key, required this.headline, required this.subtitle});
  final String headline, subtitle;
  @override
  Widget build(BuildContext context) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      AppText(headline, style: AppTextStyles.headlineLarge(context)),
      10.verticalSpace,
      AppText(
        subtitle,
        style: AppTextStyles.bodyMedium(
          context,
        ).copyWith(color: context.appColors.onSurfaceVariant),
      ),
    ],
  );
}
