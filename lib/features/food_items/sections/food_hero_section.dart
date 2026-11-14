import 'package:material_ui/material_ui.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bite_food_delivery/core/extensions/responsive_extensions.dart';
import 'package:bite_food_delivery/features/food_items/bloc/food_details_cubit.dart';
import 'package:bite_food_delivery/features/food_items/widgets/food_turntable_display.dart';

class FoodHeroSection extends StatelessWidget {
  const FoodHeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<FoodDetailsCubit>();
    final item = cubit.arguments.item;

    return SliverPadding(
      padding: context.contentInsets(bottom: 20),
      sliver: SliverToBoxAdapter(
        child: FoodTurntableDisplay(
          imageUrl: item.images.firstOrNull ?? '',
        ),
      ),
    );
  }
}
