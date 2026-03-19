import 'package:bite_food_delivery/l10n/app_localizations.dart';
import 'package:bite_food_delivery/src/features/categories/cubits/categories_cubit/categories_cubit.dart';
import 'package:bite_food_delivery/src/shared/widgets/bite_app_bar.dart';
import 'package:bite_food_delivery/src/shared/widgets/bite_category_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

class AllCategoryScreen extends StatelessWidget {
  const AllCategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BiteAppBar(
        backButton: true,
        title: Text(
          AppLocalizations.of(context)!.allCategories,
          style: Theme.of(context).textTheme.displaySmall!.copyWith(
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
        actions: const [],
      ),
      body: BlocBuilder<CategoriesCubit, CategoriesState>(
        builder: (context, state) {
          if (state is CategoriesLoading) {
            return Center(
              child: Lottie.asset(
                'assets/animations/loading.json',
                height: 75.h,
                width: 75.w,
              ),
            );
          } else if (state is CategoriesError) {
            return Center(
              child: Text(
                AppLocalizations.of(context)!.errorStatemessage(state.error),
              ),
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
