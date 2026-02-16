import 'package:bite_food_delivery/GlobalWidgets/bite_app_bar.dart';
import 'package:bite_food_delivery/Models/restaurants_model.dart';
import 'package:bite_food_delivery/Screens/RestaurantPage/Widgets/bite_food_card.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class RestaurantScreen extends StatelessWidget {
  const RestaurantScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final restaurant =
        ModalRoute.of(context)!.settings.arguments as RestaurantModel;
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(32.r),
                bottomRight: Radius.circular(32.r),
              ),
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: CachedNetworkImageProvider(restaurant.logoUrl),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Column(
                  children: [_AppBarSection(restaurant.isFavorite)],
                ),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              decoration: BoxDecoration(color: Colors.white),
              child: ListView(
                padding: EdgeInsets.symmetric(horizontal: 15.w),
                shrinkWrap: true,
                children: [
                  20.verticalSpace,
                  _RatingAndTimeSection(restaurant),
                  10.verticalSpace,
                  _FoodNameAndDescSection(restaurant),
                  20.verticalSpace,
                  _CategorySelectionSection(),
                  20.verticalSpace,
                  _FoodItemSection(),

                  20.verticalSpace,
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _FoodItemSection extends StatelessWidget {
  const _FoodItemSection();

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      children: [
        Text(
          'Burger',
          style: GoogleFonts.sen(fontSize: 25.sp, fontWeight: FontWeight.bold),
        ),
        GridView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10.w,
            mainAxisSpacing: 10.h,
            childAspectRatio: .63,
          ),
          itemBuilder: (context, index) => BiteFoodCard(),
          itemCount: 10,
        ),
      ],
    );
  }
}

class _CategorySelectionSection extends StatelessWidget {
  const _CategorySelectionSection();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40.h,
      child: ListView.separated(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => TextButton(
          onPressed: () {},
          style: TextButton.styleFrom(
            foregroundColor: Colors.black45,
            backgroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.r),
              side: BorderSide(color: Colors.grey.shade200),
            ),
            textStyle: GoogleFonts.sen(
              fontSize: 16.sp,
              fontWeight: FontWeight.bold,
            ),
            padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 5.h),
          ),
          child: Text('Burger'),
        ),
        separatorBuilder: (context, index) => 5.horizontalSpace,
        itemCount: 5,
      ),
    );
  }
}

class _FoodNameAndDescSection extends StatelessWidget {
  const _FoodNameAndDescSection(this.restaurant);

  final RestaurantModel restaurant;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          restaurant.name,
          style: GoogleFonts.sen(fontSize: 30.sp, fontWeight: FontWeight.bold),
        ),
        Text(
          restaurant.description,
          style: GoogleFonts.sen(fontSize: 16.sp, color: Colors.grey),
        ),
      ],
    );
  }
}

class _RatingAndTimeSection extends StatelessWidget {
  final RestaurantModel restaurant;
  const _RatingAndTimeSection(this.restaurant);

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 20.w,
      children: [
        Row(
          spacing: 5.w,
          children: [
            Icon(Icons.star_outlined, color: Colors.deepOrange, size: 20.r),
            Text(
              restaurant.rating.toString(),
              style: GoogleFonts.sen(
                fontSize: 16.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        Row(
          spacing: 5.w,
          children: [
            Icon(
              Icons.delivery_dining_outlined,
              color: Colors.deepOrange,
              size: 20.r,
            ),
            Text(
              restaurant.deliveryFee == 0
                  ? 'Free'
                  : '\$${restaurant.deliveryFee}',
              style: GoogleFonts.sen(
                fontSize: 16.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        Row(
          spacing: 5.w,
          children: [
            Icon(Icons.timer_outlined, color: Colors.deepOrange, size: 20.r),
            Text(
              '${restaurant.deliveryTime} min',
              style: GoogleFonts.sen(
                fontSize: 16.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _AppBarSection extends StatelessWidget {
  final bool isFavorite;
  const _AppBarSection(this.isFavorite);

  @override
  Widget build(BuildContext context) {
    return BiteAppBar(
      backButton: true,
      isDarkMode: true,
      title: SizedBox.shrink(),
      actions: [
        IconButton(
          onPressed: () {},
          style: IconButton.styleFrom(
            foregroundColor: Colors.red,
            backgroundColor: Colors.grey.shade200,
          ),
          icon: Icon(
            isFavorite ? Icons.favorite : Icons.favorite_outline,
            size: 30.r,
          ),
        ),
        15.horizontalSpace,
      ],
    );
  }
}
