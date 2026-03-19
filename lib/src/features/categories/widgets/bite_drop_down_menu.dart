import 'package:bite_food_delivery/src/features/categories/cubits/categories_cubit/categories_cubit.dart';
import 'package:bite_food_delivery/src/features/categories/cubits/category_selection_cubit/category_selection_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BiteDropDownMenu extends StatelessWidget {
  const BiteDropDownMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategorySelectionCubit, String>(
      builder: (context, selectedCategory) {
        return BlocBuilder<CategoriesCubit, CategoriesState>(
          builder: (context, state) {
            return DropdownMenu(
              onSelected: (value) {
                context.read<CategorySelectionCubit>().selectCategory(
                  value as String,
                );
              },
              menuStyle: MenuStyle(
                backgroundColor: WidgetStatePropertyAll(
                  Theme.of(context).colorScheme.surface,
                ),
                shape: WidgetStatePropertyAll(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.r),
                  ),
                ),
              ),
              width: 150.w,
              textStyle: Theme.of(
                context,
              ).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.bold),
              inputDecorationTheme: InputDecorationTheme(
                filled: true,
                fillColor: Theme.of(context).colorScheme.surface,
                contentPadding: EdgeInsets.symmetric(horizontal: 20.w),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.r),
                  borderSide: BorderSide.none,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.r),
                  borderSide: BorderSide(
                    color: Theme.of(context).colorScheme.onSecondaryFixed,
                    width: 1.w,
                  ),
                ),
              ),
              trailingIcon: Icon(
                Icons.arrow_drop_down,
                color: Theme.of(context).colorScheme.primary,
                size: 30.sp,
              ),
              selectedTrailingIcon: Icon(
                Icons.arrow_drop_up,
                color: Theme.of(context).colorScheme.primary,
                size: 30.sp,
              ),
              initialSelection: selectedCategory,
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
      },
    );
  }
}
