import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bite_food_delivery/features/discovery/bloc/discovery_cubit.dart';
import 'package:bite_food_delivery/l10n/app_localizations.dart';
import 'package:bite_food_delivery/core/extensions/responsive_extensions.dart';
import 'package:bite_food_delivery/widgets/app_search_field.dart';

class DiscoverySearchSection extends StatelessWidget {
  const DiscoverySearchSection({super.key});
  @override
  Widget build(BuildContext context) => SliverPadding(
    padding: context.contentInsets(),
    sliver: SliverToBoxAdapter(
      child: BlocBuilder<DiscoveryCubit, DiscoveryState>(
        builder: (context, state) {
          final cubit = context.read<DiscoveryCubit>();
          final text = AppLocalizations.of(context)!;
          return AppSearchField(
            value: state.query,
            hint: text.searchForRestaurantsOrDishes,
            clearLabel: text.clearAll,
            onChanged: cubit.query,
            onSubmitted: cubit.submit,
          );
        },
      ),
    ),
  );
}
