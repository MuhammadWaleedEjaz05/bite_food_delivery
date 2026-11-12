import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:bite_food_delivery/widgets/app_text.dart';
import 'package:bite_food_delivery/app/theme/app_text_styles.dart';
import 'package:bite_food_delivery/core/extensions/theme_extensions.dart';
import 'package:bite_food_delivery/widgets/app_bouncing_tap.dart';
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
  Widget build(BuildContext context) {
    final colors = context.appColors;
    return AppBouncingTap(
      onTap: onChanged != null ? () => onChanged!(!isSelected) : null,
      pressedScale: 0.98,
      child: Material(
        color: isSelected
            ? colors.primaryContainer.withValues(alpha: 0.8)
            : colors.surfaceContainerLow,
        borderRadius: BorderRadius.circular(16).r,
        clipBehavior: Clip.antiAlias,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16).r,
            border: Border.all(
              color: isSelected
                  ? colors.primary
                  : colors.outlineVariant.withValues(alpha: 0.6),
              width: isSelected ? 1.5 : 1,
            ),
          ),
          child: CheckboxListTile(
            value: isSelected,
            onChanged: onChanged,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16).r,
            ),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 14,
              vertical: 4,
            ).r,
            title: AppText(
              title,
              style: AppTextStyles.bodyLarge(context).copyWith(
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
              ),
            ),
            secondary: AppNetworkImage(
              url: imageUrl,
              width: 44.r,
              height: 44.r,
              radius: 10,
            ),
          ),
        ),
      ),
    );
  }
}
