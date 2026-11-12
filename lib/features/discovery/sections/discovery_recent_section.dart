import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:bite_food_delivery/features/discovery/bloc/discovery_cubit.dart';
import 'package:bite_food_delivery/l10n/app_localizations.dart';
import 'package:bite_food_delivery/core/extensions/responsive_extensions.dart';
import 'package:bite_food_delivery/widgets/app_choice_chip.dart';
import 'package:bite_food_delivery/widgets/app_section_heading.dart';

class DiscoveryRecentSection extends StatelessWidget {
  const DiscoveryRecentSection({super.key});
  @override
  Widget build(BuildContext context) =>
      BlocBuilder<DiscoveryCubit, DiscoveryState>(
        builder: (context, state) {
          if (state.recent.isEmpty) return const SliverToBoxAdapter();
          final t = AppLocalizations.of(context)!;
          final c = context.read<DiscoveryCubit>();
          return SliverPadding(
            padding: context.contentInsets(),
            sliver: SliverToBoxAdapter(
              child: Column(
                children: [
                  AppSectionHeading(
                    title: t.recentKeywords,
                    actionLabel: t.clearAll,
                    onAction: c.clearRecent,
                  ),
                  8.verticalSpace,
                  Wrap(
                    spacing: 8.r,
                    runSpacing: 8.r,
                    children: [
                      for (final term in state.recent)
                        AppChoiceChip(
                          label: term,
                          selected: state.query == term,
                          onTap: () => c.submit(term),
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
