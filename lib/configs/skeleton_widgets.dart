import 'package:bite_food_delivery/Models/category_model.dart';
import 'package:bite_food_delivery/Models/food_item_model.dart';
import 'package:bite_food_delivery/Models/restaurants_model.dart';
import 'package:bite_food_delivery/GlobalWidgets/bite_category_card.dart';
import 'package:bite_food_delivery/GlobalWidgets/bite_restaurant_card.dart';
import 'package:bite_food_delivery/Screens/RestaurantPage/Widgets/bite_food_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';

// Static models for skeleton loading
const CategoryModel _staticCategory = CategoryModel(
  categoryID: '',
  categoryName: '',
  categoryImage: '',
);

const RestaurantModel _staticRestaurant = RestaurantModel(
  id: '',
  name: '',
  logoUrl: '',
  description: '',
  address: '',
  rating: 0.0,
  reviewsCount: 0,
  deliveryFee: 0.0,
  deliveryTime: 0.0,
  isOpen: false,
  category: '',
  isFavorite: false,
);

const FoodItemModel _staticFoodItem = FoodItemModel(
  id: '',
  name: '',
  category: '',
  description: '',
  RestuarantId: '',
  price: 0.0,
  images: [],
  sizes: [],
  flavors: {},
);

// Custom skeletonized widgets
class SkeletonizedCategoryCard extends StatelessWidget {
  const SkeletonizedCategoryCard({super.key});

  @override
  Widget build(BuildContext context) {
    return const Skeletonizer(
      child: BiteCategoryCard(category: _staticCategory),
    );
  }
}

class SkeletonizedRestaurantCard extends StatelessWidget {
  const SkeletonizedRestaurantCard({super.key});

  @override
  Widget build(BuildContext context) {
    return const Skeletonizer(
      child: BiteRestaurantCard(restaurant: _staticRestaurant),
    );
  }
}

class SkeletonizedFoodCard extends StatelessWidget {
  final String restaurantName;

  const SkeletonizedFoodCard({super.key, required this.restaurantName});

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      child: BiteFoodCard(
        foodItem: _staticFoodItem,
        restaurantName: restaurantName,
      ),
    );
  }
}

// Skeleton lists
class SkeletonizedCategoryList extends StatelessWidget {
  final int itemCount;

  const SkeletonizedCategoryList({super.key, this.itemCount = 3});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 179.h,
      child: ListView.builder(
        itemBuilder: (context, index) => const SkeletonizedCategoryCard(),
        itemCount: itemCount,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}

class SkeletonizedRestaurantList extends StatelessWidget {
  final int itemCount;

  const SkeletonizedRestaurantList({super.key, this.itemCount = 3});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) => Padding(
        padding: EdgeInsets.symmetric(vertical: 10.h),
        child: const SkeletonizedRestaurantCard(),
      ),
      itemCount: itemCount,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
    );
  }
}

class SkeletonizedFoodGrid extends StatelessWidget {
  final String restaurantName;
  final int itemCount;

  const SkeletonizedFoodGrid({
    super.key,
    required this.restaurantName,
    this.itemCount = 6,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10.w,
        mainAxisSpacing: 10.h,
        childAspectRatio: .63,
      ),
      itemBuilder: (context, index) =>
          SkeletonizedFoodCard(restaurantName: restaurantName),
      itemCount: itemCount,
    );
  }
}
