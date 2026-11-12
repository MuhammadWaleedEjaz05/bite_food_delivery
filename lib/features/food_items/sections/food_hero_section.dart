import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:bite_food_delivery/core/extensions/responsive_extensions.dart';
import 'package:bite_food_delivery/features/food_items/bloc/food_details_cubit.dart';

import 'package:bite_food_delivery/widgets/app_network_image.dart';

class FoodHeroSection extends StatelessWidget {
  const FoodHeroSection({super.key});
  @override
  Widget build(BuildContext context) {
    final cubit = context.read<FoodDetailsCubit>();
    final item = cubit.arguments.item;
    return SliverPadding(
      padding: context.contentInsets(bottom: 24),
      sliver: SliverToBoxAdapter(
        child: AppNetworkImage(
          url: item.images.firstOrNull ?? "",
          height: 220.r,
          width: double.infinity,
          radius: 24,
        ),
      ),
    );
  }
}
