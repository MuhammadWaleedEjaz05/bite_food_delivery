import 'package:bite_food_delivery/app/theme/app_text_styles.dart';
import 'package:bite_food_delivery/core/extensions/theme_extensions.dart';
import 'package:bite_food_delivery/features/addresses/models/address_model.dart';
import 'package:bite_food_delivery/widgets/app_text.dart';
import 'package:material_ui/material_ui.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddressSelectionCard extends StatelessWidget {
  final AddressModel address;
  final bool isSelected;
  final VoidCallback onSelect;

  const AddressSelectionCard({
    super.key,
    required this.address,
    required this.isSelected,
    required this.onSelect,
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
      borderRadius: BorderRadius.circular(16).r,
      child: InkWell(
        onTap: onSelect,
        borderRadius: BorderRadius.circular(16).r,
        child: Container(
          padding: const EdgeInsets.all(14).r,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16).r,
            border: Border.all(
              color: isSelected ? colors.primary : colors.outlineVariant,
              width: isSelected ? 2 : 1,
            ),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
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
                  color: isSelected ? colors.primary : colors.onSurfaceVariant,
                  size: 20.r,
                ),
              ),
              12.horizontalSpace,
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppText(
                      address.label,
                      style: AppTextStyles.titleMedium(context).copyWith(
                        color: isSelected ? colors.primary : colors.onSurface,
                      ),
                    ),
                    4.verticalSpace,
                    AppText(
                      _formatAddress(),
                      style: AppTextStyles.bodyMedium(
                        context,
                      ).copyWith(color: colors.onSurfaceVariant),
                      maxLines: 2,
                    ),
                  ],
                ),
              ),
              if (isSelected)
                Icon(
                  Icons.check_circle_rounded,
                  color: colors.primary,
                  size: 22.r,
                ),
            ],
          ),
        ),
      ),
    );
  }
}

// Backward-compatibility alias
typedef BiteAddressSelectionCard = AddressSelectionCard;

