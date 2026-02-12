import 'package:bite_food_delivery/GlobalWidgets/bite_app_bar.dart';
import 'package:bite_food_delivery/GlobalWidgets/bite_category_card.dart';
import 'package:bite_food_delivery/GlobalWidgets/bite_heading.dart';
import 'package:bite_food_delivery/GlobalWidgets/bite_restaurant_card.dart';
import 'package:bite_food_delivery/GlobalWidgets/bite_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _AppBarSection(),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 15.w),
        children: [
          10.verticalSpace,
          _SearchSection(),
          20.verticalSpace,
          _CategorySection(),
          20.verticalSpace,
          _OpenRestaurantsSection(),
        ],
      ),
    );
  }
}

class _CategorySection extends StatelessWidget {
  const _CategorySection();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BiteHeading(
          title: 'All Categories',
          isSeeAll: true,
          onSeeAllPressed: () =>
              Navigator.pushNamed(context, '/all_categories_screen'),
        ),
        20.verticalSpace,
        SizedBox(
          height: 180.h,
          child: ListView.builder(
            itemBuilder: (context, index) {
              return BiteCategoryCard();
            },
            itemCount: 3,
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
          ),
        ),
      ],
    );
  }
}

class _OpenRestaurantsSection extends StatelessWidget {
  const _OpenRestaurantsSection();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BiteHeading(
          title: 'Open Restaurants',
          isSeeAll: true,
          onSeeAllPressed: () =>
              Navigator.pushNamed(context, '/all_restaurants_screen'),
        ),
        20.verticalSpace,
        ListView.builder(
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.symmetric(vertical: 10.h),
              child: BiteRestaurantCard(),
            );
          },
          itemCount: 5,
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
        ),
      ],
    );
  }
}

class _AppBarSection extends StatelessWidget implements PreferredSizeWidget {
  const _AppBarSection();
  @override
  Size get preferredSize => Size.fromHeight(100.h);
  @override
  Widget build(BuildContext context) {
    return BiteAppBar(
      isLogoVisible: true,
      title: Column(
        children: [
          Text(
            'DELIVER TO',
            style: GoogleFonts.sen(
              color: Theme.of(context).primaryColor,
              fontSize: 20.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.location_on, color: Colors.grey.shade600, size: 16.sp),
              SizedBox(width: 4.w),
              Text(
                '123 Main St',
                style: GoogleFonts.sen(
                  color: Colors.grey.shade600,
                  fontSize: 16.sp,
                ),
              ),
              SizedBox(width: 4.w),
              Icon(
                Icons.keyboard_arrow_down,
                color: Colors.grey.shade600,
                size: 16.sp,
              ),
            ],
          ),
        ],
      ),
      actions: [
        IconButton(
          onPressed: () => Navigator.pushNamed(context, '/cart_screen'),
          style: IconButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: Colors.black,
          ),
          icon: Icon(Icons.shopping_bag_outlined, size: 35.r),
        ),
        15.horizontalSpace,
      ],
    );
  }
}

class _SearchSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text('Hey Waleed, ', style: GoogleFonts.sen(fontSize: 15.sp)),
            Text(
              'Good Morning! 👋',
              style: GoogleFonts.sen(
                fontSize: 15.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        20.verticalSpace,
        BiteSearchBar(),
      ],
    );
  }
}
