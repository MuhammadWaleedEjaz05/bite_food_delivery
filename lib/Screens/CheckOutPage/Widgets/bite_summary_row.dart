import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class BiteSummaryRow extends StatelessWidget {
  final String label;
  final String value;
  const BiteSummaryRow({required this.label, required this.value,super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: GoogleFonts.sen(fontSize: 15.sp, color: Colors.grey.shade600),
        ),
        Text(
          value,
          style: GoogleFonts.sen(
            fontSize: 15.sp,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
      ],
    );
  }
}
