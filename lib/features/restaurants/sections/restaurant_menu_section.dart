import 'package:bite_food_delivery/app/routes/app_navigation.dart';
import 'package:material_ui/material_ui.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:bite_food_delivery/l10n/app_localizations.dart';
import 'package:bite_food_delivery/core/extensions/responsive_extensions.dart';
import 'package:bite_food_delivery/core/extensions/price_format.dart';
import 'package:bite_food_delivery/features/restaurants/bloc/restaurant_menu_cubit.dart';

import 'package:bite_food_delivery/widgets/app_feedback.dart';
import 'package:bite_food_delivery/widgets/app_food_card.dart';
import 'package:bite_food_delivery/widgets/app_staggered_entrance.dart';
import 'package:bite_food_delivery/features/food_items/models/food_detail_arguments.dart';

class RestaurantMenuSection extends StatelessWidget {
  const RestaurantMenuSection({super.key});
  @override
  Widget build(BuildContext context) =>
      BlocBuilder<RestaurantMenuCubit, RestaurantMenuState>(
        builder: (context, state) {
          final cubit = context.read<RestaurantMenuCubit>();
          final strings = AppLocalizations.of(context)!;
          return SliverPadding(
            padding: context.contentInsets(),
            sliver: SliverMainAxisGroup(
              slivers: [
                if (state.failed)
                  SliverToBoxAdapter(
                    child: AppFeedback(
                      message: strings.catalogLoadFailure,
                      actionLabel: strings.retryAction,
                      onAction: cubit.load,
                    ),
                  ),
                if (state.items.isEmpty && state.loading)
                  const SliverToBoxAdapter(child: AppLoadingCard())
                else if (state.visibleItems.isEmpty && !state.failed)
                  SliverToBoxAdapter(
                    child: AppFeedback(
                      message: strings.noFoodItemsAvailableForThisCategory,
                    ),
                  )
                else
                  SliverList.separated(
                    itemCount: state.visibleItems.length,
                    separatorBuilder: (_, _) => 12.verticalSpace,
                    itemBuilder: (context, index) {
                      final item = state.visibleItems[index];
                      return AppStaggeredEntrance(
                        index: index,
                        child: AppFoodCard(
                          compact: true,
                          name: item.name,
                          subtitle: item.description,
                          price: context.priceLabel(item.price),
                          imageUrl: item.images.firstOrNull ?? '',
                          available:
                              item.isAvailable != false &&
                              cubit.restaurant.isOpen,
                          availabilityLabel: strings.itemUnavailable,
                          onTap: () => AppNavigation.push(
                            context,
                            '/food_item_screen',
                            arguments: FoodDetailArguments(
                              item: item,
                              restaurantName: cubit.restaurant.name,
                              restaurantOpen: cubit.restaurant.isOpen,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
              ],
            ),
          );
        },
      );
}
