import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bite_food_delivery/features/discovery/bloc/discovery_cubit.dart';
import 'package:bite_food_delivery/l10n/app_localizations.dart';
import 'package:bite_food_delivery/core/extensions/responsive_extensions.dart';
import 'package:bite_food_delivery/features/favourites/bloc/favourite_cubit.dart';
import 'package:bite_food_delivery/widgets/app_feedback.dart';
import 'package:bite_food_delivery/app/routes/app_navigation.dart';

class DiscoveryStatusSection extends StatelessWidget {
  const DiscoveryStatusSection({super.key, this.savedOnly = false});
  final bool savedOnly;

  @override
  Widget build(BuildContext context) {
    final state = context.watch<DiscoveryCubit>().state;
    final favourites = context.watch<FavouriteCubit>().state;
    final c = context.read<DiscoveryCubit>();
    final t = AppLocalizations.of(context)!;
    final saved = savedOnly ? favourites.keys : null;

    final Widget? feedbackWidget = savedOnly && favourites.userId == null
        ? AppFeedback(
            message: t.pleaseSignInToContinue,
            actionLabel: t.login,
            onAction: () => AppNavigation.push(context, '/login_screen'),
          )
        : savedOnly && favourites.failed
        ? AppFeedback(
            message: t.catalogLoadFailure,
            actionLabel: t.retryAction,
            onAction: () => context.read<FavouriteCubit>().bindUser(
              favourites.userId,
              retry: true,
            ),
          )
        : (state.loading && !state.loaded) || (savedOnly && favourites.loading)
        ? const AppLoadingCard()
        : state.failed
        ? AppFeedback(
            message: state.loaded
                ? t.catalogRefreshFailure
                : t.catalogLoadFailure,
            actionLabel: t.retryAction,
            onAction: c.load,
          )
        : state.restaurantResults(saved: saved).isEmpty &&
              state.foodResults(saved: saved).isEmpty
        ? AppFeedback(
            message: t.discoveryEmpty,
            actionLabel: t.discoveryReset,
            onAction: c.reset,
          )
        : null;

    if (feedbackWidget == null) {
      return const SliverToBoxAdapter();
    }

    return SliverPadding(
      padding: context.contentInsets(bottom: 16),
      sliver: SliverToBoxAdapter(child: feedbackWidget),
    );
  }
}
