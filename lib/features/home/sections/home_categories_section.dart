import 'package:bite_food_delivery/app/routes/app_navigation.dart';
import 'package:bite_food_delivery/core/extensions/responsive_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:bite_food_delivery/l10n/app_localizations.dart';
import 'package:bite_food_delivery/features/categories/bloc/categories_cubit.dart';
import 'package:bite_food_delivery/widgets/app_section_heading.dart';
import 'package:bite_food_delivery/widgets/app_feedback.dart';
import 'package:bite_food_delivery/widgets/app_staggered_entrance.dart';
import 'package:bite_food_delivery/features/categories/widgets/category_card.dart';

class HomeCategoriesSection extends StatelessWidget {
  const HomeCategoriesSection({super.key});
  @override
  Widget build(BuildContext context) => SliverPadding(
    padding: context.contentInsets(bottom: 22),
    sliver: SliverToBoxAdapter(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppSectionHeading(
            title: AppLocalizations.of(context)!.allCategories,
            actionLabel: AppLocalizations.of(context)!.seeAll,
            onAction: () =>
                AppNavigation.push(context, '/all_categories_screen'),
          ),
          12.verticalSpace,
          BlocBuilder<CategoriesCubit, CategoriesState>(
            builder: (context, state) {
              final strings = AppLocalizations.of(context)!;
              if (state is CategoriesLoaded) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (state.refreshFailed)
                      AppFeedback(
                        message: strings.catalogRefreshFailure,
                        actionLabel: strings.retryAction,
                        onAction: context
                            .read<CategoriesCubit>()
                            .loadCategories,
                      ),
                    if (state.categories.isEmpty)
                      AppFeedback(message: strings.noCategoriesAvailable)
                    else
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        physics: const BouncingScrollPhysics(
                          parent: AlwaysScrollableScrollPhysics(),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            for (
                              var i = 0;
                              i < state.categories.length;
                              i++
                            ) ...[
                              AppStaggeredEntrance(
                                index: i,
                                offset: const Offset(0.12, 0),
                                child: BiteCategoryCard(
                                  category: state.categories[i],
                                ),
                              ),
                              12.horizontalSpace,
                            ],
                          ],
                        ),
                      ),
                  ],
                );
              }
              if (state is CategoriesError) {
                return AppFeedback(
                  message: strings.catalogLoadFailure,
                  actionLabel: strings.retryAction,
                  onAction: context.read<CategoriesCubit>().loadCategories,
                );
              }
              return const AppLoadingCard();
            },
          ),
        ],
      ),
    ),
  );
}
