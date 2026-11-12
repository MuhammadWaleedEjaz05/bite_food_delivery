import 'package:bite_food_delivery/features/categories/bloc/categories_cubit.dart';
import 'package:bite_food_delivery/features/restaurants/bloc/restaurants_cubit.dart';
import 'package:custom_refresh_indicator/custom_refresh_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
        await Future.delayed(const Duration(seconds: 2));
      },
      builder: (context, child, controller) => AnimatedBuilder(
        animation: controller,
        builder: (context, child) => Stack(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10.h),
              child: SizedBox(
                height: offsetToArmed * controller.value,
                child: Center(
                  child: Lottie.asset(
                    'assets/animations/pull_to_refresh_animation.json',
                    width: double.infinity,
                  ),
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
