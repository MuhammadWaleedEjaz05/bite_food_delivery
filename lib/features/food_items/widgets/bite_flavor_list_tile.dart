import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:bite_food_delivery/widgets/app_text.dart';
import 'package:bite_food_delivery/app/theme/app_text_styles.dart';
import 'package:bite_food_delivery/core/extensions/theme_extensions.dart';

import 'package:bite_food_delivery/widgets/app_network_image.dart';

class BiteFlavorListTile extends StatelessWidget {
  const BiteFlavorListTile({
    super.key,
    required this.title,
    required this.imageUrl,
    required this.isSelected,
    required this.onChanged,
  });
  final String title, imageUrl;
  final bool isSelected;
  final ValueChanged<bool?>? onChanged;
  @override
  Widget build(BuildContext context) => Material(
    color: isSelected
        ? context.appColors.primaryContainer
        : context.appColors.surfaceContainerLow,
    borderRadius: BorderRadius.circular(16).r,
    child: CheckboxListTile(
      value: isSelected,
      onChanged: onChanged,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16).r),
      contentPadding: const EdgeInsets.all(12).r,
      title: AppText(title, style: AppTextStyles.bodyLarge(context)),
      secondary: AppNetworkImage(
        url: imageUrl,
        width: 44.r,
        height: 44.r,
        radius: 10,
      ),
    ),
  );
}
