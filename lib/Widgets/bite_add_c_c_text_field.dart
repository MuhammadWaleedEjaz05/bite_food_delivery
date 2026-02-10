import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class BiteAddCCTextField extends StatelessWidget {
  final String title;
  const BiteAddCCTextField({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: GoogleFonts.sen(
            fontSize: 20.sp,
            fontWeight: FontWeight.bold,
            color: Theme.of(context).primaryColor,
          ),
        ),
        5.verticalSpace,
        TextFormField(
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.grey.shade200,

            hintText: 'Enter $title',
            hintStyle: GoogleFonts.sen(
              fontSize: 20.sp,
              fontWeight: FontWeight.bold,
              color: Colors.grey,
            ),

            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.r),
            ),
          ),
        ),
      ],
    );
  }
}
