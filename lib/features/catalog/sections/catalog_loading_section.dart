import 'package:material_ui/material_ui.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/catalog_route_cubit.dart';
import 'package:bite_food_delivery/core/extensions/responsive_extensions.dart';
import 'package:bite_food_delivery/widgets/app_feedback.dart';
import 'package:bite_food_delivery/l10n/app_localizations.dart';

class CatalogLoadingSection extends StatelessWidget {
  const CatalogLoadingSection({
    super.key,
    required this.id,
    required this.food,
  });
  final String id;
  final bool food;
  @override
  Widget build(BuildContext context) => SliverPadding(
    padding: context.contentInsets(),
    sliver: SliverToBoxAdapter(
      child: BlocBuilder<CatalogRouteCubit, CatalogRouteState>(
        builder: (context, state) {
          final text = AppLocalizations.of(context)!;
          if (state.status == CatalogRouteStatus.loading) {
            return const AppLoadingCard();
          }
          return AppFeedback(
            message: state.status == CatalogRouteStatus.failed
                ? text.catalogLoadFailure
                : text.catalogMissing,
            actionLabel: text.retryAction,
            onAction: () =>
                context.read<CatalogRouteCubit>().load(id, food: food),
          );
        },
      ),
    ),
  );
}
