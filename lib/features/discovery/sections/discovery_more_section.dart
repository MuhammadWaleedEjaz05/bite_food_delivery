import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bite_food_delivery/features/discovery/bloc/discovery_cubit.dart';
import 'package:bite_food_delivery/l10n/app_localizations.dart';
import 'package:bite_food_delivery/core/extensions/responsive_extensions.dart';
import 'package:bite_food_delivery/features/favourites/bloc/favourite_cubit.dart';
import 'package:bite_food_delivery/widgets/app_primary_button.dart';

class DiscoveryMoreSection extends StatelessWidget {
  const DiscoveryMoreSection({super.key, this.savedOnly = false});
  final bool savedOnly;
  @override
  Widget build(BuildContext context) {
    final state = context.watch<DiscoveryCubit>().state;
    final saved = savedOnly ? context.watch<FavouriteCubit>().state.keys : null;
    if (state.restaurantResults(saved: saved).length <= state.limit &&
        state.foodResults(saved: saved).length <= state.limit) {
      return const SliverToBoxAdapter();
    }
    return SliverPadding(
      padding: context.contentInsets(),
      sliver: SliverToBoxAdapter(
        child: AppPrimaryButton(
          label: AppLocalizations.of(context)!.discoveryMore,
          onTap: context.read<DiscoveryCubit>().more,
        ),
      ),
    );
  }
}
