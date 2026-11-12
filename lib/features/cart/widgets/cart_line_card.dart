import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:bite_food_delivery/widgets/app_text.dart';
import 'package:bite_food_delivery/widgets/app_network_image.dart';
import 'package:bite_food_delivery/widgets/app_quantity_control.dart';
import 'package:bite_food_delivery/app/theme/app_text_styles.dart';

class CartLineCard extends StatelessWidget {
  const CartLineCard({
    super.key,
    required this.name,
    required this.options,
    required this.imageUrl,
    required this.price,
    required this.quantity,
    required this.quantityLabel,
    required this.increaseLabel,
    required this.decreaseLabel,
    required this.onIncrease,
    required this.onDecrease,
  });
  final String name,
      options,
      imageUrl,
      price,
      quantityLabel,
      increaseLabel,
      decreaseLabel;
  final int quantity;
  final VoidCallback? onIncrease, onDecrease;
  @override
  Widget build(BuildContext context) => Material(
    color: Theme.of(context).colorScheme.surfaceContainerLow,
    borderRadius: BorderRadius.circular(20).r,
    child: Padding(
      padding: const EdgeInsets.all(16).r,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppNetworkImage(
                url: imageUrl,
                width: 70.r,
                height: 80.r,
                radius: 12,
              ),
              12.horizontalSpace,
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppText(name, style: AppTextStyles.titleMedium(context)),
                    if (options.isNotEmpty) ...[
                      6.verticalSpace,
                      AppText(
                        options,
                        style: AppTextStyles.bodyMedium(context),
                      ),
                    ],
                    8.verticalSpace,
                    AppText(price, style: AppTextStyles.labelLarge(context)),
                  ],
                ),
              ),
            ],
          ),
          12.verticalSpace,
          AppQuantityControl(
            value: quantity,
            label: quantityLabel,
            increaseLabel: increaseLabel,
            decreaseLabel: decreaseLabel,
            onIncrease: onIncrease,
            onDecrease: onDecrease,
          ),
        ],
      ),
    ),
  );
}
