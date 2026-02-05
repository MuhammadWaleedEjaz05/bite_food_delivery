import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class BiteRecentSearchButton extends StatelessWidget {
  const BiteRecentSearchButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {},
      style: TextButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.r),
          side: BorderSide(color: Theme.of(context).primaryColor),
        ),
      ),
      child: Text(
        'Recent',
        style: GoogleFonts.sen(
          fontSize: 16.sp,
          color: Theme.of(context).primaryColor,
        ),
      ),
    );
  }
}
