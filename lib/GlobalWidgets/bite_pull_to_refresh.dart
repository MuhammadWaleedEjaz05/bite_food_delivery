import 'package:bite_food_delivery/Cubits/CategoriesCubit/categories_cubit.dart';
import 'package:bite_food_delivery/Cubits/RestaurantsCubit/restaurants_cubit.dart';
import 'package:custom_refresh_indicator/custom_refresh_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

class BitePullToRefresh extends StatelessWidget {
  const BitePullToRefresh({
    super.key,
    required this.offsetToArmed,
    required this.child,
  });

  final double offsetToArmed;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return CustomRefreshIndicator(
      offsetToArmed: offsetToArmed,
      onRefresh: () async {
        await Future.wait([
          context.read<CategoriesCubit>().loadCategories(),
          context.read<RestaurantsCubit>().loadRestaurants(),
        ]);
        await Future.delayed(const Duration(seconds: 1));
      },
      builder: (context, child, controller) => AnimatedBuilder(
        animation: controller,
        builder: (context, child) => Stack(
          children: [
            Container(
              color: Theme.of(context).colorScheme.primary.withAlpha(100),
              height: offsetToArmed * controller.value,
              alignment: Alignment.center,
              child: Center(
                child: Lottie.asset(
                  'assets/animations/pull_to_refresh_animation.json',
                  fit: BoxFit.cover,
                  repeat: true,
                  animate: controller.isLoading,
                ),
              ),
            ),
            Transform.translate(
              offset: Offset(0, offsetToArmed * controller.value),
              child: child,
            ),
          ],
        ),
        child: child,
      ),
      child: child,
    );
  }
}
