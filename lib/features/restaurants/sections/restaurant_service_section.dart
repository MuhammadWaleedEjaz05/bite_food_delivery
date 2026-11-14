import 'package:material_ui/material_ui.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bite_food_delivery/l10n/app_localizations.dart';
import 'package:bite_food_delivery/core/extensions/responsive_extensions.dart';
import 'package:bite_food_delivery/core/extensions/price_format.dart';
import 'package:bite_food_delivery/features/restaurants/bloc/restaurant_menu_cubit.dart';

import 'package:bite_food_delivery/features/restaurants/widgets/restaurant_service_info.dart';

class RestaurantServiceSection extends StatelessWidget {
  const RestaurantServiceSection({super.key});
  @override
  Widget build(BuildContext context) {
    final item = context.read<RestaurantMenuCubit>().restaurant;
    final strings = AppLocalizations.of(context)!;
    return SliverPadding(
      padding: context.contentInsets(),
      sliver: SliverToBoxAdapter(
        child: RestaurantServiceInfo(
          rating: item.rating.toStringAsFixed(1),
          time: strings.deliveryMinutes(item.deliveryTime.round()),
          fee: context.priceLabel(item.deliveryFee),
          status: item.isOpen
              ? strings.restaurantOpen
              : strings.restaurantClosed,
        ),
      ),
    );
  }
}
