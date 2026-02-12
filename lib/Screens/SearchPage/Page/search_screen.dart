import 'package:bite_food_delivery/GlobalWidgets/bite_app_bar.dart';
import 'package:bite_food_delivery/GlobalWidgets/bite_heading.dart';
import 'package:bite_food_delivery/Screens/SearchPage/Widgets/bite_recent_search_button.dart';
import 'package:bite_food_delivery/GlobalWidgets/bite_restaurant_card.dart';
import 'package:bite_food_delivery/GlobalWidgets/bite_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: _AppBarSection(),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 15.w),
        children: [
          10.verticalSpace,
          BiteSearchBar(),
          20.verticalSpace,
          _RecentSearchSection(),
          20.verticalSpace,
          _PopularRestaurantSection(),
        ],
      ),
    );
  }
}

class _PopularRestaurantSection extends StatelessWidget {
  const _PopularRestaurantSection();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BiteHeading(title: 'Popular Restaurants', isSeeAll: false),
        10.verticalSpace,
        ListView.builder(
          shrinkWrap: true,
          itemCount: 5,
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) => Padding(
            padding: EdgeInsets.symmetric(vertical: 10.h),
            child: BiteRestaurantCard(),
          ),
        ),
      ],
    );
  }
}

class _RecentSearchSection extends StatelessWidget {
  const _RecentSearchSection();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BiteHeading(title: 'Recent Keywords', isSeeAll: false),
        10.verticalSpace,
        SizedBox(
          height: 40.h,
          child: ListView.separated(
            itemCount: 5,
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) => BiteRecentSearchButton(),
            separatorBuilder: (context, index) => 5.horizontalSpace,
          ),
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
      title: Text(
        'Search',
        style: GoogleFonts.sen(
          fontSize: 30.sp,
          fontWeight: FontWeight.bold,
          color: Theme.of(context).primaryColor,
        ),
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
