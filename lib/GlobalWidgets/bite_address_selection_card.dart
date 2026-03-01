import 'package:bite_food_delivery/Models/address_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BiteAddressSelectionCard extends StatelessWidget {
  final AddressModel address;
  final bool isSelected;
  final VoidCallback onSelect;

  const BiteAddressSelectionCard({
    super.key,
    required this.address,
    required this.isSelected,
    required this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onSelect,
      child: Container(
        padding: EdgeInsets.all(12.r),
        decoration: BoxDecoration(
          border: Border.all(
            color: isSelected ? Colors.deepOrange : Colors.grey.shade300,
            width: isSelected ? 2 : 1,
          ),
          borderRadius: BorderRadius.circular(12.r),
          color: isSelected ? Colors.deepOrange.withAlpha(25) : Colors.white,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(
              Icons.location_on,
              color: isSelected ? Colors.deepOrange : Colors.grey,
              size: 20.r,
            ),
            SizedBox(width: 10.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    address.label,
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      fontWeight: FontWeight.bold,
                      color: isSelected ? Colors.deepOrange : Colors.black,
                    ),
                  ),
                  5.verticalSpace,
                  Text(
                    '${address.street}, ${address.city}',
                    style: Theme.of(context).textTheme.labelLarge!.copyWith(
                      color: Colors.grey.shade600,
                    ),
                  ),
                ],
              ),
            ),
            if (isSelected)
              Icon(Icons.check_circle, color: Colors.deepOrange, size: 24.r),
          ],
        ),
      ),
    );
  }
}
