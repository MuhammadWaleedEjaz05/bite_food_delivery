import 'package:bite_food_delivery/app/theme/app_text_styles.dart';
import 'package:bite_food_delivery/core/extensions/theme_extensions.dart';
import 'package:bite_food_delivery/features/addresses/models/address_model.dart';
import 'package:bite_food_delivery/widgets/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddressCard extends StatelessWidget {
  final AddressModel address;
  final bool isSelected;
  final VoidCallback onSelect;
  final VoidCallback onEdit;
  final VoidCallback onDelete;

  const AddressCard({
    super.key,
    required this.address,
    required this.isSelected,
    required this.onSelect,
    required this.onEdit,
    required this.onDelete,
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

  String _formatAddress() {
    final parts = [
      address.street,
      address.city,
      address.zipCode,
      address.country,
    ].where((part) => part.trim().isNotEmpty).toList();

    return parts.isEmpty ? 'Address not available' : parts.join(', ');
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.appColors;
    return Material(
      color: colors.surfaceContainerLow,
      borderRadius: BorderRadius.circular(20).r,
      child: InkWell(
        onTap: onSelect,
        borderRadius: BorderRadius.circular(20).r,
        child: Container(
          padding: const EdgeInsets.all(16).r,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20).r,
            border: Border.all(
              color: isSelected ? colors.primary : colors.outlineVariant,
              width: isSelected ? 2 : 1,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    width: 38.r,
                    height: 38.r,
                    decoration: BoxDecoration(
                      color: isSelected
                          ? colors.primary.withValues(alpha: 0.12)
                          : colors.surfaceContainerHighest,
                      borderRadius: BorderRadius.circular(12).r,
                    ),
                    child: Icon(
                      _iconForLabel(address.label),
                      size: 20.r,
                      color: isSelected
                          ? colors.primary
                          : colors.onSurfaceVariant,
                    ),
                  ),
                  10.horizontalSpace,
                  Expanded(
                    child: Wrap(
                      crossAxisAlignment: WrapCrossAlignment.center,
                      spacing: 8.r,
                      runSpacing: 4.r,
                      children: [
                        AppText(
                          address.label,
                          style: AppTextStyles.titleMedium(context).copyWith(
                            color: isSelected
                                ? colors.primary
                                : colors.onSurface,
                          ),
                        ),
                        if (isSelected)
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 2,
                            ).r,
                            decoration: BoxDecoration(
                              color: colors.primary.withValues(alpha: 0.1),
                              borderRadius: BorderRadius.circular(8).r,
                            ),
                            child: AppText(
                              'Default',
                              style: AppTextStyles.labelSmall(
                                context,
                              ).copyWith(color: colors.primary),
                            ),
                          ),
                      ],
                    ),
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.edit_outlined,
                      size: 18.r,
                      color: colors.onSurfaceVariant,
                    ),
                    onPressed: onEdit,
                    tooltip: 'Edit',
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.delete_outline,
                      size: 18.r,
                      color: colors.error,
                    ),
                    onPressed: onDelete,
                    tooltip: 'Delete',
                  ),
                ],
              ),
              8.verticalSpace,
              AppText(
                _formatAddress(),
                style: AppTextStyles.bodyMedium(
                  context,
                ).copyWith(color: colors.onSurfaceVariant),
                maxLines: 3,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
