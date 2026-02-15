import 'package:bite_food_delivery/Cubits/CategorySelectionCubit/category_selection_cubit.dart';
import 'package:bite_food_delivery/Models/category_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class BiteCategoryCard extends StatelessWidget {
  final CategoryModel category;
  const BiteCategoryCard({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            BlocProvider.of<CategorySelectionCubit>(
              context,
            ).selectCategory(category.categoryName);
            Navigator.pushNamed(
              context,
              '/category_screen',
              arguments: category.categoryName,
            );
          },
          child: Card(
            elevation: 4,
            margin: EdgeInsets.symmetric(vertical: 15.h, horizontal: 5.w),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.r),
              side: BorderSide(color: Colors.white),
            ),
            color: Colors.white,
            child: Container(
              height: 90.h,
              width: 110.w,
              margin: EdgeInsets.all(15.r),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: CachedNetworkImageProvider(category.categoryImage),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(20.r),
              ),
            ),
          ),
        ),
        Text(category.categoryName, style: GoogleFonts.sen(fontSize: 15.sp)),
      ],
    );
  }
}
