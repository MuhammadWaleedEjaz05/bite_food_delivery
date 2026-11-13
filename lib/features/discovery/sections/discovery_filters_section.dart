import 'package:bite_food_delivery/widgets/app_filter_disclosure.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:bite_food_delivery/features/discovery/bloc/discovery_cubit.dart';
import 'package:bite_food_delivery/l10n/app_localizations.dart';
import 'package:bite_food_delivery/core/extensions/responsive_extensions.dart';
import 'package:bite_food_delivery/widgets/app_choice_chip.dart';

class DiscoveryFiltersSection extends StatelessWidget {
  const DiscoveryFiltersSection({super.key});
  @override
  Widget build(BuildContext context) => SliverPadding(
    padding: context.contentInsets(bottom: 14),
    sliver: SliverToBoxAdapter(
      child: BlocBuilder<DiscoveryCubit, DiscoveryState>(
        builder: (context, state) {
          final c = context.read<DiscoveryCubit>();
          final t = AppLocalizations.of(context)!;
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Wrap(
                spacing: 8.r,
                runSpacing: 8.r,
                children: [
                  AppChoiceChip(
                    label: t.discoveryAll,
                    selected: state.kind == DiscoveryKind.all,
                    onTap: () => c.kind(DiscoveryKind.all),
                  ),
                  AppChoiceChip(
                    label: t.restaurants,
                    selected: state.kind == DiscoveryKind.restaurants,
                    onTap: () => c.kind(DiscoveryKind.restaurants),
                  ),
                  AppChoiceChip(
                    label: t.foods,
                    selected: state.kind == DiscoveryKind.foods,
                    onTap: () => c.kind(DiscoveryKind.foods),
                  ),
                  AppChoiceChip(
                    label: t.discoveryOpen,
                    selected: state.openOnly,
                    onTap: c.toggleOpen,
                  ),
                ],
              ),
              12.verticalSpace,
              AppFilterDisclosure(
                label: state.category.isEmpty
                    ? t.filterYourSearch
                    : state.category,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Wrap(
                      spacing: 8.r,
                      runSpacing: 8.r,
                      children: [
                        AppChoiceChip(
                          label: t.discoveryCategories,
                          selected: state.category.isEmpty,
                          onTap: () => c.category(''),
                        ),
                        for (final category in state.categories)
                          AppChoiceChip(
                            label: category,
                            selected: state.category == category,
                            onTap: () => c.category(category),
                          ),
                      ],
                    ),
                    12.verticalSpace,
                    Wrap(
                      spacing: 8.r,
                      runSpacing: 8.r,
                      children: [
                        AppChoiceChip(
                          label: t.discoveryRated,
                          selected: state.sort == DiscoverySort.recommended,
                          onTap: () => c.sort(DiscoverySort.recommended),
                        ),
                        AppChoiceChip(
                          label: t.discoveryName,
                          selected: state.sort == DiscoverySort.name,
                          onTap: () => c.sort(DiscoverySort.name),
                        ),
                        AppChoiceChip(
                          label: t.discoveryDelivery,
                          selected: state.sort == DiscoverySort.delivery,
                          onTap: () => c.sort(DiscoverySort.delivery),
                        ),
                        AppChoiceChip(
                          label: t.discoveryReset,
                          selected: false,
                          onTap: c.reset,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    ),
  );
}
