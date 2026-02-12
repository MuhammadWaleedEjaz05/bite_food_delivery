import 'package:bite_food_delivery/GlobalWidgets/bite_address_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class BitePasswordTextField extends StatelessWidget {
  const BitePasswordTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.r)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Expanded(child: BiteAddressTextField(title: 'Password')),
          SizedBox(width: 10.w),
          SizedBox(
            height: 56.h,
            child: IconButton(
              onPressed: () {},
              style: TextButton.styleFrom(
                padding: EdgeInsets.all(10.r),
                backgroundColor: Colors.grey.shade200,
                foregroundColor: Colors.deepOrange,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.r),
                ),
                textStyle: GoogleFonts.sen(
                  fontSize: 25.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              icon: Icon(Icons.visibility),
            ),
          ),
        ],
      ),
    );
  }
}
