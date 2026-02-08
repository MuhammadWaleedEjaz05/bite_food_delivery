import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class BiteDropDownMenu extends StatelessWidget {
  const BiteDropDownMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return DropdownMenu(
      menuStyle: MenuStyle(
        backgroundColor: WidgetStatePropertyAll(Colors.white),
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.r)),
        ),
      ),
      width: 150.w,
      textStyle: GoogleFonts.sen(fontSize: 15.sp, fontWeight: FontWeight.bold),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: Colors.white,
        contentPadding: EdgeInsets.symmetric(horizontal: 20.w),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.r),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.r),
          borderSide: BorderSide(color: Colors.grey.shade200, width: 1.w),
        ),
      ),
      trailingIcon: Icon(
        Icons.arrow_drop_down,
        color: Colors.deepOrange,
        size: 30.sp,
      ),
      selectedTrailingIcon: Icon(
        Icons.arrow_drop_up,
        color: Colors.deepOrange,
        size: 30.sp,
      ),
      initialSelection: 'Pizza',
      dropdownMenuEntries: [
        DropdownMenuEntry(value: 'Pizza', label: 'PIZZA'),
        DropdownMenuEntry(value: 'Burger', label: 'BURGER'),
        DropdownMenuEntry(value: 'Pasta', label: 'PASTA'),
        DropdownMenuEntry(value: 'Biryani', label: 'BIRYANI'),
      ],
    );
  }
}
