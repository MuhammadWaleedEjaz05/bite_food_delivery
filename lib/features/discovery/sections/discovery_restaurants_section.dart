import 'package:material_ui/material_ui.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:bite_food_delivery/features/discovery/bloc/discovery_cubit.dart';
import 'package:bite_food_delivery/l10n/app_localizations.dart';
import 'package:bite_food_delivery/core/extensions/responsive_extensions.dart';
import 'package:bite_food_delivery/features/favourites/bloc/favourite_cubit.dart';
import 'package:bite_food_delivery/widgets/app_section_heading.dart';
import 'package:bite_food_delivery/widgets/app_restaurant_card.dart';
import 'package:bite_food_delivery/widgets/app_staggered_entrance.dart';
import 'package:bite_food_delivery/features/favourites/sections/catalog_favourite_section.dart';
import 'package:bite_food_delivery/app/routes/app_navigation.dart';
import 'package:bite_food_delivery/core/extensions/price_format.dart';

class DiscoveryRestaurantsSection extends StatelessWidget {
  const DiscoveryRestaurantsSection({super.key, this.savedOnly = false});
  final bool savedOnly;
  @override
  Widget build(BuildContext context) {
    final state = context.watch<DiscoveryCubit>().state;
    final favourites = context.watch<FavouriteCubit>().state;
    final items = state.restaurantResults(
      saved: savedOnly ? favourites.keys : null,
    );
    final t = AppLocalizations.of(context)!;
    if (items.isEmpty || (savedOnly && favourites.userId == null)) {
      return const SliverToBoxAdapter();
    }
    return SliverPadding(
      padding: context.contentInsets(bottom: 24),
      sliver: SliverMainAxisGroup(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppSectionHeading(title: t.restaurants),
                16.verticalSpace,
              ],
            ),
          ),
          SliverList.separated(
            itemCount: items.length.clamp(0, state.limit),
            separatorBuilder: (_, _) => 16.verticalSpace,
            itemBuilder: (context, index) {
              final item = items[index];

              return AppStaggeredEntrance(
                index: index,
                child: AppRestaurantCard(
                  name: item.name,
                  imageUrl: item.logoUrl,
                  category: item.isOpen
                      ? item.category
                      : '${item.category} · ${t.itemUnavailable}',
                  rating: item.rating.toStringAsFixed(1),
                  deliveryTime: t.deliveryMinutes(item.deliveryTime.round()),
                  deliveryFee: context.priceLabel(item.deliveryFee),
                  favouriteButton: CatalogFavouriteSection(
                    id: item.id,
                    food: false,
                    initialValue: false,
                  ),
                  onTap: () => AppNavigation.push(
                    context,
                    '/restaurant_screen',
                    arguments: item,
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
