import 'package:material_ui/material_ui.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:bite_food_delivery/l10n/app_localizations.dart';
import 'package:bite_food_delivery/core/extensions/responsive_extensions.dart';
import 'package:bite_food_delivery/features/food_items/bloc/food_details_cubit.dart';

import 'package:bite_food_delivery/features/food_items/widgets/food_options_heading.dart';
import 'package:bite_food_delivery/features/food_items/widgets/bite_flavor_list_tile.dart';

class FoodFlavorSection extends StatelessWidget {
  const FoodFlavorSection({super.key});
  @override
  Widget build(BuildContext context) =>
      BlocBuilder<FoodDetailsCubit, FoodDetailsState>(
        builder: (context, state) {
          final cubit = context.read<FoodDetailsCubit>();
          if (cubit.arguments.item.flavors.isEmpty) {
            return const SliverToBoxAdapter();
          }
          return SliverPadding(
            padding: context.contentInsets(),
            sliver: SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FoodOptionsHeading(
                    label: AppLocalizations.of(context)!.chooseYourFlavor,
                    subtitle: AppLocalizations.of(context)!.optionalChoices,
                  ),
                  12.verticalSpace,
                  Column(
                    children: [
                      for (final entry
                          in cubit.arguments.item.flavors.entries) ...[
                        BiteFlavorListTile(
                          title: entry.key,
                          imageUrl: entry.value,
                          isSelected: state.flavors.contains(entry.key),
                          onChanged: state.submitting
                              ? null
                              : (_) => cubit.toggleFlavor(entry.key),
                        ),
                        10.verticalSpace,
                      ],
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      );
}
