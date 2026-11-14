import 'package:bite_food_delivery/app/theme/app_text_styles.dart';
import 'package:bite_food_delivery/core/extensions/theme_extensions.dart';
import 'package:bite_food_delivery/widgets/app_text.dart';
import 'package:material_ui/material_ui.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddressLabelChip extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onSelected;

  const AddressLabelChip({
    super.key,
    required this.label,
    required this.isSelected,
    required this.onSelected,
  });

  IconData _iconForLabel(String label) {
    switch (label.toLowerCase()) {
      case 'home':
        return Icons.home_outlined;
      case 'work':
        return Icons.work_outline;
      default:
        return Icons.location_on_outlined;
    }
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.appColors;
    return Material(
      color: isSelected
          ? colors.primary.withValues(alpha: 0.12)
          : colors.surfaceContainerLow,
      borderRadius: BorderRadius.circular(16).r,
      child: InkWell(
        onTap: onSelected,
        borderRadius: BorderRadius.circular(16).r,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10).r,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16).r,
            border: Border.all(
              color: isSelected ? colors.primary : colors.outlineVariant,
              width: isSelected ? 1.5 : 1,
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                _iconForLabel(label),
                size: 18.r,
                color: isSelected ? colors.primary : colors.onSurfaceVariant,
              ),
              8.horizontalSpace,
              AppText(
                label,
                style: AppTextStyles.labelLarge(context).copyWith(
                  color: isSelected ? colors.primary : colors.onSurface,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
