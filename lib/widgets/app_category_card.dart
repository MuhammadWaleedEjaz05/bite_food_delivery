import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:bite_food_delivery/widgets/app_text.dart';
import 'package:bite_food_delivery/widgets/app_network_image.dart';
import 'package:bite_food_delivery/app/theme/app_text_styles.dart';
import 'package:bite_food_delivery/core/extensions/theme_extensions.dart';

class AppCategoryCard extends StatelessWidget {
  const AppCategoryCard({
    super.key,
    required this.name,
    required this.imageUrl,
    required this.onTap,
  });
  final String name, imageUrl;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) => SizedBox(
    width: 100.r,
    child: Material(
      color: context.appColors.surfaceContainerLow,
      borderRadius: BorderRadius.circular(20).r,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(20).r,
        child: Padding(
          padding: const EdgeInsets.all(10).r,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              AppNetworkImage(
                url: imageUrl,
                height: 64.r,
                width: 80.r,
                radius: 14,
              ),
              10.verticalSpace,
              AppText(
                name,
                style: AppTextStyles.labelLarge(context),
                maxLines: 2,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
