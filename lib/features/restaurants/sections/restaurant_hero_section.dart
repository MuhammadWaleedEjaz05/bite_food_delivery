import 'package:material_ui/material_ui.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bite_food_delivery/core/extensions/responsive_extensions.dart';
import 'package:bite_food_delivery/features/restaurants/bloc/restaurant_menu_cubit.dart';
import 'package:bite_food_delivery/features/restaurants/widgets/restaurant_hero_banner.dart';

class RestaurantHeroSection extends StatelessWidget {
  const RestaurantHeroSection({super.key});
  @override
  Widget build(BuildContext context) {
    final cubit = context.read<RestaurantMenuCubit>();
    final item = cubit.restaurant;
    return SliverPadding(
      padding: context.contentInsets(bottom: 24),
      sliver: SliverToBoxAdapter(
        child: RestaurantHeroBanner(restaurant: item),
      ),
    );
  }
}
