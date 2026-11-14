import 'package:bite_food_delivery/app/routes/app_navigation.dart';
import 'package:material_ui/material_ui.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bite_food_delivery/l10n/app_localizations.dart';
import 'package:bite_food_delivery/widgets/app_text.dart';
import 'package:bite_food_delivery/app/theme/app_text_styles.dart';

import 'package:bite_food_delivery/features/favourites/bloc/favourite_cubit.dart';
import 'package:bite_food_delivery/widgets/app_favorite_button.dart';

class CatalogFavouriteSection extends StatelessWidget {
  const CatalogFavouriteSection({
    super.key,
    required this.id,
    required this.food,
    required this.initialValue,
  });
  final String id;
  final bool food, initialValue;
  @override
  Widget build(BuildContext context) =>
      BlocBuilder<FavouriteCubit, FavouriteState>(
        builder: (context, state) {
          final cubit = context.read<FavouriteCubit>();
          final type = food ? FavouriteType.foodItem : FavouriteType.restaurant;
          final selected = cubit.selection(id, type, initialValue);
          return AppFavoriteButton(
            selected: selected,
            label: AppLocalizations.of(context)!.favorites,
            onTap:
                state.loading ||
                    state.failed ||
                    state.pending.contains('${type.name}:$id')
                ? null
                : () async {
                    if (state.userId == null) {
                      AppNavigation.push(context, '/login_screen');
                      return;
                    }
                    try {
                      await cubit.setSelection(id, type, !selected);
                    } catch (_) {
                      if (!context.mounted) return;
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: AppText(
                            AppLocalizations.of(context)!.catalogLoadFailure,
                            style: AppTextStyles.bodyMedium(context),
                          ),
                        ),
                      );
                    }
                  },
          );
        },
      );
}
