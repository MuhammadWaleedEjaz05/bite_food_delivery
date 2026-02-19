import 'package:bite_food_delivery/GlobalWidgets/bite_app_bar.dart';
import 'package:bite_food_delivery/Screens/FoodItemPage/Widgets/bite_flavor_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class FoodItemScreen extends StatelessWidget {
  const FoodItemScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: ListView(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(32.r),
              bottomRight: Radius.circular(32.r),
            ),
            child: Container(
              height: 250.h,
              decoration: BoxDecoration(color: Colors.blueGrey),
              child: Column(children: [_AppBarSection()]),
            ),
          ),
          Container(
            decoration: BoxDecoration(color: Colors.white),
            child: ListView(
              padding: EdgeInsets.symmetric(horizontal: 15.w),
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              children: [
                20.verticalSpace,
                _FoodDescSection(),
                20.verticalSpace,
                _FoodSizeSelectionSection(),
                30.verticalSpace,
                _FlavorSelectionSection(),
                150.verticalSpace,
              ],
            ),
          ),
        ],
      ),
      bottomSheet: _AddCardBottomSheet(),
    );
  }
}

class _AddCardBottomSheet extends StatelessWidget {
  const _AddCardBottomSheet();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(32.r),
          topRight: Radius.circular(32.r),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            10.verticalSpace,
            Row(
              children: [
                10.horizontalSpace,
                Text(
                  'RS 500',
                  style: GoogleFonts.sen(
                    fontSize: 25.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Spacer(),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.blueGrey,
                    borderRadius: BorderRadius.circular(30.r),
                  ),
                  child: Row(
                    spacing: 5.w,
                    children: [
                      IconButton(
                        icon: Icon(Icons.remove),
                        style: IconButton.styleFrom(
                          backgroundColor: Colors.blueGrey.shade200,
                          foregroundColor: Colors.white,
                        ),
                        onPressed: () {},
                      ),
                      Text(
                        '1',
                        style: GoogleFonts.sen(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.add),
                        style: IconButton.styleFrom(
                          backgroundColor: Colors.blueGrey.shade200,
                          foregroundColor: Colors.white,
                        ),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
              ],
            ),
            20.verticalSpace,
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(vertical: 10.h),
                      backgroundColor: Colors.deepOrange,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                    ),
                    child: Text(
                      'Add to cart',
                      style: GoogleFonts.sen(
                        fontSize: 25.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _FlavorSelectionSection extends StatelessWidget {
  const _FlavorSelectionSection();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Choose your flavor',
          style: GoogleFonts.sen(fontSize: 20.sp, fontWeight: FontWeight.bold),
        ),
        10.verticalSpace,
        ListView.separated(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) => BiteFlavorListTile(),
          separatorBuilder: (context, index) => 10.verticalSpace,
          itemCount: 5,
        ),
      ],
    );
  }
}

class _FoodSizeSelectionSection extends StatelessWidget {
  const _FoodSizeSelectionSection();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Choose your size',
          style: GoogleFonts.sen(fontSize: 20.sp, fontWeight: FontWeight.bold),
        ),
        10.verticalSpace,
        Row(
          spacing: 10.w,
          children: [
            TextButton(
              onPressed: () {},
              style: TextButton.styleFrom(
                foregroundColor: Colors.black,
                backgroundColor: Colors.grey.shade300,
                textStyle: GoogleFonts.sen(fontSize: 20.sp),
              ),
              child: Text('10 inch'),
            ),
            TextButton(
              onPressed: () {},
              style: TextButton.styleFrom(
                foregroundColor: Colors.black,
                backgroundColor: Colors.grey.shade300,
                textStyle: GoogleFonts.sen(fontSize: 20.sp),
              ),
              child: Text('16 inch'),
            ),
            TextButton(
              onPressed: () {},
              style: TextButton.styleFrom(
                foregroundColor: Colors.black,
                backgroundColor: Colors.grey.shade300,
                textStyle: GoogleFonts.sen(fontSize: 20.sp),
              ),
              child: Text('20 inch'),
            ),
          ],
        ),
      ],
    );
  }
}

class _FoodDescSection extends StatelessWidget {
  const _FoodDescSection();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Burger Bistro',
          style: GoogleFonts.sen(fontSize: 30.sp, fontWeight: FontWeight.bold),
        ),
        5.verticalSpace,
        Text(
          'Spicy Restaurant',
          style: GoogleFonts.sen(fontSize: 20.sp, color: Colors.grey),
        ),
        20.verticalSpace,
        Row(
          spacing: 20.w,
          children: [
            Row(
              spacing: 5.w,
              children: [
                Icon(Icons.star_outlined, color: Colors.deepOrange, size: 20.r),
                Text(
                  '4.5',
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
                  'Free',
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
                  Icons.timer_outlined,
                  color: Colors.deepOrange,
                  size: 20.r,
                ),
                Text(
                  '30-40 min',
                  style: GoogleFonts.sen(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ],
        ),
        10.verticalSpace,
        Text(
          'Maecenas sed diam eget risus varius blandit sit amet non magna. Integer posuere erat a ante venenatis dapibus posuere velit aliquet.',
          style: GoogleFonts.sen(fontSize: 16.sp, color: Colors.grey),
        ),
      ],
    );
  }
}

class _AppBarSection extends StatelessWidget {
  const _AppBarSection();

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
          icon: Icon(Icons.favorite_border, size: 30.r),
        ),
        15.horizontalSpace,
      ],
    );
  }
}
