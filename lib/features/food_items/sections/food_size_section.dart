import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:bite_food_delivery/l10n/app_localizations.dart';
import 'package:bite_food_delivery/core/extensions/responsive_extensions.dart';
import 'package:bite_food_delivery/features/food_items/bloc/food_details_cubit.dart';

import 'package:bite_food_delivery/widgets/app_choice_chip.dart';
import 'package:bite_food_delivery/features/food_items/widgets/food_options_heading.dart';

class FoodSizeSection extends StatelessWidget {
  const FoodSizeSection({super.key});
  @override
  Widget build(BuildContext context) =>
      BlocBuilder<FoodDetailsCubit, FoodDetailsState>(
        builder: (context, state) {
          final cubit = context.read<FoodDetailsCubit>();
          if (cubit.arguments.item.sizes.isEmpty) {
            return const SliverToBoxAdapter();
          }
          return SliverPadding(
            padding: context.contentInsets(),
            sliver: SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FoodOptionsHeading(
                    label: AppLocalizations.of(context)!.chooseYourSize,
                  ),
                  12.verticalSpace,
                  Wrap(
                    spacing: 10.r,
                    runSpacing: 10.r,
                    children: [
                      for (final size in cubit.arguments.item.sizes)
                        AppChoiceChip(
                          label: size,
                          selected: state.selectedSize == size,
                          onTap: state.submitting
                              ? null
                              : () => cubit.selectSize(size),
                        ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      );
}
