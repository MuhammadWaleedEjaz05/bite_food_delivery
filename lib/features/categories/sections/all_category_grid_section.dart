import 'package:bite_food_delivery/app/routes/app_navigation.dart';
import 'package:bite_food_delivery/core/extensions/responsive_extensions.dart';
import 'package:bite_food_delivery/features/categories/bloc/categories_cubit.dart';
import 'package:bite_food_delivery/l10n/app_localizations.dart';
import 'package:bite_food_delivery/widgets/app_category_card.dart';
import 'package:bite_food_delivery/widgets/app_feedback.dart';
import 'package:material_ui/material_ui.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AllCategoryGridSection extends StatelessWidget {
  const AllCategoryGridSection({super.key});

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context)!;
    final cubit = context.read<CategoriesCubit>();

    return SliverPadding(
      padding: context.contentInsets(bottom: 24),
      sliver: BlocBuilder<CategoriesCubit, CategoriesState>(
        builder: (context, state) {
          if (state is CategoriesLoading) {
            return const SliverToBoxAdapter(child: AppLoadingCard());
          }
          if (state is CategoriesError) {
            return SliverToBoxAdapter(
              child: AppFeedback(
                message: t.errorStatemessage(state.error),
                actionLabel: t.retryAction,
                onAction: cubit.loadCategories,
              ),
            );
          }
          if (state is CategoriesLoaded) {
            final categories = state.categories;
            if (categories.isEmpty) {
              return SliverToBoxAdapter(
                child: AppFeedback(
                  message: t.noRestaurantsFound,
                  icon: Icons.category_outlined,
                ),
              );
            }

            return SliverGrid(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 12.r,
                mainAxisSpacing: 12.r,
                childAspectRatio: 0.85,
              ),
              delegate: SliverChildBuilderDelegate((context, index) {
                final cat = categories[index];
                return AppCategoryCard(
                  name: cat.categoryName,
                  imageUrl: cat.categoryImage,
                  onTap: () => AppNavigation.push(
                    context,
                    '/discovery_screen',
                    arguments: cat.categoryID,
                  ),
                );
              }, childCount: categories.length),
            );
          }
          return const SliverToBoxAdapter(child: SizedBox.shrink());
        },
      ),
    );
  }
}
