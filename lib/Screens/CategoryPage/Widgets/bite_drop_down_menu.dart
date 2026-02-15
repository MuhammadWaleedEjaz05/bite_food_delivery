import 'package:bite_food_delivery/Cubits/CategoriesCubit/categories_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class BiteDropDownMenu extends StatelessWidget {
  final String title;
  const BiteDropDownMenu({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoriesCubit, CategoriesState>(
      builder: (context, state) {
        return DropdownMenu(
          menuStyle: MenuStyle(
            backgroundColor: WidgetStatePropertyAll(Colors.white),
            shape: WidgetStatePropertyAll(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.r)),
            ),
          ),
          width: 150.w,
          textStyle: GoogleFonts.sen(
            fontSize: 15.sp,
            fontWeight: FontWeight.bold,
          ),
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
            color: Theme.of(context).primaryColor,
            size: 30.sp,
          ),
          selectedTrailingIcon: Icon(
            Icons.arrow_drop_up,
            color: Theme.of(context).primaryColor,
            size: 30.sp,
          ),
          initialSelection: title,
          dropdownMenuEntries: state is CategoriesLoaded
              ? state.categories
                    .map(
                      (category) => DropdownMenuEntry(
                        value: category.categoryName,
                        label: category.categoryName.toUpperCase(),
                      ),
                    )
                    .toList()
              : [],
        );
      },
    );
  }
}
