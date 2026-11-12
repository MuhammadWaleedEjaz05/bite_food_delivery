import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:bite_food_delivery/widgets/app_text.dart';
import 'package:bite_food_delivery/app/theme/app_text_styles.dart';

class HomeCartButton extends StatelessWidget {
  const HomeCartButton({
    super.key,
    required this.count,
    required this.label,
    required this.onTap,
  });
  final int count;
  final String label;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) => Padding(
    padding: EdgeInsetsDirectional.only(end: 16.r),
    child: IconButton.filledTonal(
      tooltip: label,
      onPressed: onTap,
      icon: Badge(
        isLabelVisible: count > 0,
        label: AppText(
          '$count',
          style: AppTextStyles.labelSmall(
            context,
          ).copyWith(color: Theme.of(context).colorScheme.onError),
        ),
        child: Icon(Icons.shopping_bag_outlined, size: 24.r),
      ),
    ),
  );
}
