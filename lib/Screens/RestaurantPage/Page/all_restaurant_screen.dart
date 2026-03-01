import 'package:bite_food_delivery/Cubits/RestaurantsCubit/restaurants_cubit.dart';
import 'package:bite_food_delivery/GlobalWidgets/bite_app_bar.dart';
import 'package:bite_food_delivery/GlobalWidgets/bite_restaurant_card.dart';
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
          'All Restaurants',
          style: Theme.of(
            context,
          ).textTheme.displaySmall!.copyWith(color: Colors.deepOrange),
        ),
        actions: [],
      ),
      body: BlocBuilder<RestaurantsCubit, RestaurantsState>(
        builder: (context, state) {
          if (state is RestaurantsLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is RestaurantsError) {
            return Center(child: Text('Error: ${state.message}'));
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
