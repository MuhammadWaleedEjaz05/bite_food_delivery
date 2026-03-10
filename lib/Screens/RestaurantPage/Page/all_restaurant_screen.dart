import 'package:bite_food_delivery/Cubits/RestaurantsCubit/restaurants_cubit.dart';
import 'package:bite_food_delivery/GlobalWidgets/bite_app_bar.dart';
import 'package:bite_food_delivery/GlobalWidgets/bite_restaurant_card.dart';
import 'package:bite_food_delivery/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AllRestaurantScreen extends StatelessWidget {
  const AllRestaurantScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BiteAppBar(
        backButton: true,
        title: Text(
          S.of(context).allRestaurants,
          style: Theme.of(context).textTheme.displaySmall!.copyWith(
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
        actions: [],
      ),
      body: BlocBuilder<RestaurantsCubit, RestaurantsState>(
        builder: (context, state) {
          if (state is RestaurantsLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is RestaurantsError) {
            return Center(child: Text(S.of(context).errorStatemessage(state.message)));
          } else if (state is RestaurantsLoaded) {
            return ListView.builder(
              padding: EdgeInsets.symmetric(horizontal: 15.w),
              itemBuilder: (context, index) => Padding(
                padding: EdgeInsets.symmetric(vertical: 10.h),
                child: BiteRestaurantCard(restaurant: state.restaurants[index]),
              ),
              itemCount: state.restaurants.length,
            );
          } else {
            return SizedBox();
          }
        },
      ),
    );
  }
}
