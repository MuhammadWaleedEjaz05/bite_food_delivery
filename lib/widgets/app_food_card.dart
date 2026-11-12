import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:bite_food_delivery/widgets/app_text.dart';
import 'package:bite_food_delivery/app/theme/app_text_styles.dart';
import 'package:bite_food_delivery/core/extensions/theme_extensions.dart';

import 'package:bite_food_delivery/widgets/app_network_image.dart';

class AppFoodCard extends StatelessWidget {
  const AppFoodCard({
    super.key,
    required this.name,
    required this.subtitle,
    required this.price,
    required this.imageUrl,
    required this.onTap,
    required this.availabilityLabel,
    this.available = true,
    this.compact = false,
  });
  final String name, subtitle, price, imageUrl, availabilityLabel;
  final bool available, compact;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) => Material(
    color: context.appColors.surfaceContainerLow,
    borderRadius: BorderRadius.circular(20).r,
    clipBehavior: Clip.antiAlias,
    child: InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(12).r,
        child: compact
            ? Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: _FoodCardCopy(
                      name: name,
                      subtitle: subtitle,
                      price: price,
                      available: available,
                      availabilityLabel: availabilityLabel,
                    ),
                  ),
                  12.horizontalSpace,
                  AppNetworkImage(
                    url: imageUrl,
                    width: 90.r,
                    height: 100.r,
                    radius: 14,
                  ),
                ],
              )
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AspectRatio(
                    aspectRatio: 4 / 3,
                    child: AppNetworkImage(
                      url: imageUrl,
                      width: double.infinity,
                      radius: 14,
                    ),
                  ),
                  12.verticalSpace,
                  _FoodCardCopy(
                    name: name,
                    subtitle: subtitle,
                    price: price,
                    available: available,
                    availabilityLabel: availabilityLabel,
                  ),
                ],
              ),
      ),
    ),
  );
}

class _FoodCardCopy extends StatelessWidget {
  const _FoodCardCopy({
    required this.name,
    required this.subtitle,
    required this.price,
    required this.available,
    required this.availabilityLabel,
  });
  final String name, subtitle, price, availabilityLabel;
  final bool available;
  @override
  Widget build(BuildContext context) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      AppText(name, style: AppTextStyles.titleMedium(context), maxLines: 2),
      6.verticalSpace,
      AppText(
        subtitle,
        style: AppTextStyles.bodyMedium(
          context,
        ).copyWith(color: context.appColors.onSurfaceVariant),
        maxLines: 2,
      ),
      12.verticalSpace,
      AppText(
        price,
        style: AppTextStyles.labelLarge(
          context,
        ).copyWith(color: context.appColors.primary),
      ),
      if (!available) ...[
        6.verticalSpace,
        AppText(availabilityLabel, style: AppTextStyles.labelSmall(context)),
      ],
    ],
  );
}
