import 'package:bite_food_delivery/features/categories/models/category_model.dart';
import 'package:bite_food_delivery/features/food_items/models/food_item_model.dart';
import 'package:bite_food_delivery/features/restaurants/models/restaurants_model.dart';
import 'package:bite_food_delivery/src/shared/widgets/bite_category_card.dart';
import 'package:bite_food_delivery/src/shared/widgets/bite_restaurant_card.dart';
import 'package:bite_food_delivery/src/shared/widgets/bite_food_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';

const String _staticImageUrl =
    'https://img.freepik.com/free-photo/abstract-luxury-plain-blur-grey-black-gradient-used-as-background-studio-wall-display-your-products_1258-101806.jpg?semt=ais_hybrid&w=740&q=80';
const CategoryModel _staticCategory = CategoryModel(
  categoryID: '',
  categoryName: '',
  categoryImage: _staticImageUrl,
);

const RestaurantModel _staticRestaurant = RestaurantModel(
  id: '',
  name: '',
  logoUrl: _staticImageUrl,
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
  restaurantId: '',
  price: 0.0,
  images: [_staticImageUrl],
  sizes: [],
  flavors: {},
);

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
