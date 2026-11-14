import 'package:bite_food_delivery/core/extensions/responsive_extensions.dart';
import 'package:material_ui/material_ui.dart';
import 'package:bite_food_delivery/l10n/app_localizations.dart';
import 'package:bite_food_delivery/features/home/widgets/home_search_button.dart';
import 'package:go_router/go_router.dart';

class HomeSearchSection extends StatelessWidget {
  const HomeSearchSection({super.key});
  @override
  Widget build(BuildContext context) => SliverPadding(
    padding: context.contentInsets(bottom: 16),
    sliver: SliverToBoxAdapter(
      child: HomeSearchButton(
        label: AppLocalizations.of(context)!.searchForRestaurantsOrDishes,
        onTap: () => context.go('/discover'),
      ),
    ),
  );
}
