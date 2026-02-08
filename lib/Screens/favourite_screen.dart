import 'package:bite_food_delivery/Widgets/bite_app_bar.dart';
import 'package:bite_food_delivery/Widgets/bite_favourite_block.dart';
import 'package:bite_food_delivery/Widgets/bite_favourite_restaurant_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _AppSection(),
      body: DefaultTabController(
        initialIndex: 0,
        length: 2,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          child: Column(
            children: [
              _TabSection(),
              20.verticalSpace,
              Expanded(child: _FavouriteSection()),
            ],
          ),
        ),
      ),
    );
  }
}

class _FavouriteSection extends StatelessWidget {
  const _FavouriteSection();

  @override
  Widget build(BuildContext context) {
    return TabBarView(
      children: [_FoodFavouriteSection(), _ReataurantFavouriteSection()],
    );
  }
}

class _ReataurantFavouriteSection extends StatelessWidget {
  const _ReataurantFavouriteSection();

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, index) => BiteFavouriteRestaurantCard(),
      separatorBuilder: (context, index) => 10.verticalSpace,
      itemCount: 5,
    );
  }
}

class _FoodFavouriteSection extends StatelessWidget {
  const _FoodFavouriteSection();

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, index) => BiteFavouriteBlock(),
      separatorBuilder: (context, index) => 10.verticalSpace,
      itemCount: 5,
    );
  }
}

class _TabSection extends StatelessWidget {
  const _TabSection();

  @override
  Widget build(BuildContext context) {
    return TabBar(
      indicatorColor: Theme.of(context).primaryColor,
      labelColor: Theme.of(context).primaryColor,
      unselectedLabelColor: Colors.grey.shade500,
      labelStyle: GoogleFonts.sen(fontSize: 20.sp, fontWeight: FontWeight.bold),
      unselectedLabelStyle: GoogleFonts.sen(fontSize: 20.sp),
      tabs: [
        Tab(text: 'Foods'),
        Tab(text: 'Restaurants'),
      ],
    );
  }
}

class _AppSection extends StatelessWidget implements PreferredSizeWidget {
  const _AppSection();
  @override
  Size get preferredSize => Size.fromHeight(100.h);

  @override
  Widget build(BuildContext context) {
    return BiteAppBar(
      backButton: true,
      title: Text(
        'Favourite',
        style: GoogleFonts.sen(
          fontSize: 30.sp,
          fontWeight: FontWeight.bold,
          color: Theme.of(context).primaryColor,
        ),
      ),
      actions: [
        IconButton(
          onPressed: () {},
          style: IconButton.styleFrom(
            foregroundColor: Colors.black,
            backgroundColor: Colors.grey.shade100,
          ),
          icon: Icon(Icons.clear_all_rounded, size: 35.r),
        ),
        15.horizontalSpace,
      ],
    );
  }
}
