import 'package:bite_food_delivery/app/routes/app_navigation.dart';
import 'package:bite_food_delivery/core/extensions/price_format.dart';
import 'package:bite_food_delivery/core/extensions/responsive_extensions.dart';
import 'package:bite_food_delivery/features/restaurants/bloc/restaurants_cubit.dart';
import 'package:bite_food_delivery/l10n/app_localizations.dart';
import 'package:bite_food_delivery/widgets/app_feedback.dart';
import 'package:bite_food_delivery/widgets/app_restaurant_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AllRestaurantListSection extends StatelessWidget {
  const AllRestaurantListSection({super.key});

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context)!;
    final cubit = context.read<RestaurantsCubit>();

    return SliverPadding(
      padding: context.contentInsets(bottom: 24),
      sliver: BlocBuilder<RestaurantsCubit, RestaurantsState>(
        builder: (context, state) {
          if (state is RestaurantsLoading) {
            return const SliverToBoxAdapter(child: AppLoadingCard());
          }
          if (state is RestaurantsError) {
            return SliverToBoxAdapter(
              child: AppFeedback(
                message: t.errorStatemessage(state.message),
                actionLabel: t.retryAction,
                onAction: cubit.loadRestaurants,
              ),
            );
          }
          if (state is RestaurantsLoaded) {
            final restaurants = state.restaurants;
            if (restaurants.isEmpty) {
              return SliverToBoxAdapter(
                child: AppFeedback(
                  message: t.noRestaurantsFound,
                  icon: Icons.restaurant_outlined,
                ),
              );
            }

            return SliverList.separated(
              itemCount: restaurants.length,
              separatorBuilder: (_, _) => 16.verticalSpace,
              itemBuilder: (context, index) {
                final r = restaurants[index];
                return AppRestaurantCard(
                  name: r.name,
                  imageUrl: r.logoUrl,
                  category: r.isOpen
                      ? r.category
                      : '${r.category} · ${t.itemUnavailable}',
                  rating: r.rating.toStringAsFixed(1),
                  deliveryTime: t.deliveryMinutes(r.deliveryTime.round()),
                  deliveryFee: context.priceLabel(r.deliveryFee),
                  onTap: () => AppNavigation.push(
                    context,
                    '/restaurant_screen',
                    arguments: r,
                  ),
                );
              },
            );
          }
          return const SliverToBoxAdapter(child: SizedBox.shrink());
        },
      ),
    );
  }
}
