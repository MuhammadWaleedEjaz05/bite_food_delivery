import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

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
                    style: GoogleFonts.sen(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                if (addressLabel.isNotEmpty) 4.verticalSpace,
                Text(
                  addressText,
                  style: GoogleFonts.sen(
                    fontSize: 14.sp,
                    color: Colors.grey.shade600,
                  ),
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
