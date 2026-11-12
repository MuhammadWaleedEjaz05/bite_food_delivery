import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:bite_food_delivery/l10n/app_localizations.dart';
import 'package:bite_food_delivery/core/extensions/responsive_extensions.dart';
import 'package:bite_food_delivery/features/restaurants/bloc/restaurant_menu_cubit.dart';

import 'package:bite_food_delivery/widgets/app_choice_chip.dart';

class RestaurantFilterSection extends StatelessWidget {
  const RestaurantFilterSection({super.key});
  @override
  Widget build(BuildContext context) =>
      BlocBuilder<RestaurantMenuCubit, RestaurantMenuState>(
        builder: (context, state) => SliverPadding(
          padding: context.contentInsets(bottom: 16),
          sliver: SliverToBoxAdapter(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(
                parent: AlwaysScrollableScrollPhysics(),
              ),
              child: Row(
                children: [
                  AppChoiceChip(
                    label: AppLocalizations.of(context)!.menuAllItems,
                    selected: state.selectedCategory.isEmpty,
                    onTap: () =>
                        context.read<RestaurantMenuCubit>().selectCategory(''),
                  ),
                  for (final category in state.categories) ...[
                    8.horizontalSpace,
                    AppChoiceChip(
                      label: category,
                      selected: state.selectedCategory == category,
                      onTap: () => context
                          .read<RestaurantMenuCubit>()
                          .selectCategory(category),
                    ),
                  ],
                ],
              ),
            ),
          ),
        ),
      );
}
