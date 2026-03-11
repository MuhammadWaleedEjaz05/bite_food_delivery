import 'package:bite_food_delivery/Cubits/CategoriesCubit/categories_cubit.dart';
import 'package:bite_food_delivery/GlobalWidgets/bite_app_bar.dart';
import 'package:bite_food_delivery/GlobalWidgets/bite_category_card.dart';
import 'package:bite_food_delivery/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AllCategoryScreen extends StatelessWidget {
  const AllCategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BiteAppBar(
        backButton: true,
        title: Text(
          S.of(context).allCategories,
          style: Theme.of(context).textTheme.displaySmall!.copyWith(
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
        actions: const [],
      ),
      body: BlocBuilder<CategoriesCubit, CategoriesState>(
        builder: (context, state) {
          if (state is CategoriesLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is CategoriesError) {
            return Center(
              child: Text(S.of(context).errorStatemessage(state.error)),
            );
          } else if (state is CategoriesLoaded) {
            return GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 10.h,
              ),
              itemCount: state.categories.length,
              itemBuilder: (context, index) =>
                  BiteCategoryCard(category: state.categories[index]),
            );
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }
}
