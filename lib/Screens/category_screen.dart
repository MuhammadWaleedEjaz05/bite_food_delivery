import 'package:bite_food_delivery/Widgets/bite_app_bar.dart';
import 'package:bite_food_delivery/Widgets/bite_drop_down_menu.dart';
import 'package:bite_food_delivery/Widgets/bite_filter_modal.dart';
import 'package:bite_food_delivery/Widgets/bite_heading.dart';
import 'package:bite_food_delivery/Widgets/bite_restaurant_card.dart';
import 'package:bite_food_delivery/Widgets/bite_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _AppBarSection(),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 15.w),
        children: [
          const BiteHeading(title: 'Open Restaurants', isSeeAll: false),
          20.verticalSpace,
          ListView.separated(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (context, index) => const BiteRestaurantCard(),
            separatorBuilder: (context, index) => 10.verticalSpace,
            itemCount: 5,
          ),
        ],
      ),
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
      backButton: true,
      title: BiteDropDownMenu(),
      actions: [
        IconButton(
          onPressed: () =>
              showSearch(context: context, delegate: OpenSearchScreen()),
          style: IconButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: Colors.black,
          ),
          icon: Icon(Icons.search_outlined, size: 30.r),
        ),
        15.horizontalSpace,
        IconButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) => Dialog(
                backgroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.r),
                ),
                child: BiteFilterModal(),
              ),
            );
          },
          style: IconButton.styleFrom(
            foregroundColor: Colors.black,
            backgroundColor: Colors.grey.shade200,
          ),
          icon: Icon(Icons.filter_alt_outlined, size: 30.r),
        ),
        15.horizontalSpace,
      ],
    );
  }
}
