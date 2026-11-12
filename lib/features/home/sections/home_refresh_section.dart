import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bite_food_delivery/features/categories/bloc/categories_cubit.dart';
import 'package:bite_food_delivery/features/restaurants/bloc/restaurants_cubit.dart';

class HomeRefreshSection extends StatelessWidget {
  const HomeRefreshSection({super.key});
  @override
  Widget build(BuildContext context) => CupertinoSliverRefreshControl(
    onRefresh: () async {
      await Future.wait([
        context.read<CategoriesCubit>().loadCategories(),
        context.read<RestaurantsCubit>().loadRestaurants(),
      ]);
    },
  );
}
