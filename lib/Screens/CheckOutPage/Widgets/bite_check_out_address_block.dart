import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BiteCheckOutAddressBlock extends StatelessWidget {
  const BiteCheckOutAddressBlock({
    super.key,
    required this.addressLabel,
    required this.addressText,
  });

  final String addressLabel;
  final String addressText;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15.r),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(10.r),
            decoration: BoxDecoration(
              color: Colors.deepOrange.withAlpha(25),
              borderRadius: BorderRadius.circular(10.r),
            ),
            child: Icon(
              Icons.location_on,
              color: Colors.deepOrange,
              size: 24.r,
            ),
          ),
          12.horizontalSpace,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (addressLabel.isNotEmpty)
                  Text(
                    addressLabel,
                    style: Theme.of(
                      context,
                    ).textTheme.titleSmall!.copyWith(color: Colors.black87),
                  ),
                if (addressLabel.isNotEmpty) 4.verticalSpace,
                Text(
                  addressText,
                  style: Theme.of(
                    context,
                  ).textTheme.bodySmall!.copyWith(color: Colors.grey.shade600),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
