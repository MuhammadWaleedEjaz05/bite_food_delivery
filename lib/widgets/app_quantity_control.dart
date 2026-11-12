import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:bite_food_delivery/widgets/app_text.dart';
import 'package:bite_food_delivery/app/theme/app_text_styles.dart';

class AppQuantityControl extends StatelessWidget {
  const AppQuantityControl({
    super.key,
    required this.value,
    required this.label,
    required this.increaseLabel,
    required this.decreaseLabel,
    required this.onIncrease,
    required this.onDecrease,
  });
  final int value;
  final String label, increaseLabel, decreaseLabel;
  final VoidCallback? onIncrease, onDecrease;
  @override
  Widget build(BuildContext context) => Wrap(
    alignment: WrapAlignment.spaceBetween,
    crossAxisAlignment: WrapCrossAlignment.center,
    spacing: 16.r,
    runSpacing: 12.r,
    children: [
      AppText(label, style: AppTextStyles.titleMedium(context)),
      Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton.filledTonal(
            onPressed: onDecrease,
            tooltip: decreaseLabel,
            icon: const Icon(Icons.remove),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16).r,
            child: AppText('$value', style: AppTextStyles.titleMedium(context)),
          ),
          IconButton.filledTonal(
            onPressed: onIncrease,
            tooltip: increaseLabel,
            icon: const Icon(Icons.add),
          ),
        ],
      ),
    ],
  );
}
