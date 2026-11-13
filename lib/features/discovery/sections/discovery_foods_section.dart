import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:bite_food_delivery/features/discovery/bloc/discovery_cubit.dart';
import 'package:bite_food_delivery/l10n/app_localizations.dart';
import 'package:bite_food_delivery/core/extensions/responsive_extensions.dart';
import 'package:bite_food_delivery/features/favourites/bloc/favourite_cubit.dart';
import 'package:bite_food_delivery/widgets/app_section_heading.dart';
import 'package:bite_food_delivery/widgets/app_food_card.dart';
import 'package:bite_food_delivery/widgets/app_staggered_entrance.dart';
import 'package:bite_food_delivery/features/food_items/models/food_detail_arguments.dart';
import 'package:bite_food_delivery/features/favourites/sections/catalog_favourite_section.dart';
import 'package:bite_food_delivery/app/routes/app_navigation.dart';
import 'package:bite_food_delivery/core/extensions/price_format.dart';

class DiscoveryFoodsSection extends StatelessWidget {
  const DiscoveryFoodsSection({super.key, this.savedOnly = false});
  final bool savedOnly;
  @override
  Widget build(BuildContext context) {
    final state = context.watch<DiscoveryCubit>().state;
    final favourites = context.watch<FavouriteCubit>().state;
    final items = state.foodResults(saved: savedOnly ? favourites.keys : null);
    final t = AppLocalizations.of(context)!;
    if (items.isEmpty || (savedOnly && favourites.userId == null)) {
      return const SliverToBoxAdapter();
    }
    return SliverPadding(
      padding: context.contentInsets(),
      sliver: SliverMainAxisGroup(
        slivers: [
          SliverToBoxAdapter(child: AppSectionHeading(title: t.foods)),
          SliverList.separated(
            itemCount: items.length.clamp(0, state.limit),
            separatorBuilder: (_, _) => 16.verticalSpace,
            itemBuilder: (context, index) {
              final item = items[index];
              final parent = state.byRestaurant[item.restaurantId];
              return AppStaggeredEntrance(
                index: index,
                child: AppFoodCard(
                  compact: true,
                  name: item.name,
                  subtitle: parent!.name,
                  price: context.priceLabel(item.price),
                  imageUrl: item.images.firstOrNull ?? '',
                  available: parent.isOpen && item.isAvailable != false,
                  availabilityLabel: t.itemUnavailable,
                  favouriteButton: CatalogFavouriteSection(
                    id: item.id,
                    food: true,
                    initialValue: false,
                  ),
                  onTap: () => AppNavigation.push(
                    context,
                    '/food_item_screen',
                    arguments: FoodDetailArguments(
                      item: item,
                      restaurantName: parent.name,
                      restaurantOpen: parent.isOpen,
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
