import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class BiteAddressTextField extends StatelessWidget {
  final String title;
  const BiteAddressTextField({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: GoogleFonts.sen(fontSize: 20.sp)),
        5.verticalSpace,
        TextFormField(
          decoration: InputDecoration(
            hintText: 'Enter $title',
            hintStyle: GoogleFonts.sen(fontSize: 20.sp),
            labelText: title,
            labelStyle: GoogleFonts.sen(fontSize: 20.sp),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.r),
              borderSide: BorderSide.none,
            ),
            filled: true,
            fillColor: Colors.grey.shade200,
          ),
        ),
      ],
    );
  }
}
