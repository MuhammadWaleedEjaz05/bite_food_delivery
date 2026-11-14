import 'package:material_ui/material_ui.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bite_food_delivery/l10n/app_localizations.dart';
import 'package:bite_food_delivery/core/extensions/responsive_extensions.dart';
import 'package:bite_food_delivery/features/food_items/bloc/food_details_cubit.dart';

import 'package:bite_food_delivery/widgets/app_quantity_control.dart';

class FoodQuantitySection extends StatelessWidget {
  const FoodQuantitySection({super.key});
  @override
  Widget build(BuildContext context) =>
      BlocBuilder<FoodDetailsCubit, FoodDetailsState>(
        builder: (context, state) {
          final cubit = context.read<FoodDetailsCubit>();
          final strings = AppLocalizations.of(context)!;
          return SliverPadding(
            padding: context.contentInsets(),
            sliver: SliverToBoxAdapter(
              child: AppQuantityControl(
                value: state.quantity,
                label: strings.quantityLabel,
                increaseLabel: strings.increaseQuantity,
                decreaseLabel: strings.decreaseQuantity,
                onIncrease: state.submitting || state.quantity >= 99
                    ? null
                    : () => cubit.setQuantity(state.quantity + 1),
                onDecrease: state.submitting || state.quantity <= 1
                    ? null
                    : () => cubit.setQuantity(state.quantity - 1),
              ),
            ),
          );
        },
      );
}
