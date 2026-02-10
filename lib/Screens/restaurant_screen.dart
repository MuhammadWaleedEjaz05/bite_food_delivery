import 'package:bite_food_delivery/Widgets/bite_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class RestaurantScreen extends StatelessWidget {
  const RestaurantScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                decoration: BoxDecoration(color: Colors.blueGrey),
                child: Column(children: [_AppBarSection()]),
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
                  Row(
                    spacing: 20.w,
                    children: [
                      Row(
                        spacing: 5.w,
                        children: [
                          Icon(
                            Icons.star_outlined,
                            color: Colors.deepOrange,
                            size: 20.r,
                          ),
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
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Spicy Restaurant',
                        style: GoogleFonts.sen(
                          fontSize: 30.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Maecenas sed diam eget risus varius blandit sit amet non magna. Integer posuere erat a ante venenatis dapibus posuere velit aliquet.',
                        style: GoogleFonts.sen(
                          fontSize: 16.sp,

                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                  20.verticalSpace,
                  SizedBox(
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
                          padding: EdgeInsets.symmetric(
                            horizontal: 15.w,
                            vertical: 5.h,
                          ),
                        ),
                        child: Text('Burger'),
                      ),
                      separatorBuilder: (context, index) => 5.horizontalSpace,
                      itemCount: 5,
                    ),
                  ),
                  20.verticalSpace,
                  Text(
                    'Burger',
                    style: GoogleFonts.sen(
                      fontSize: 25.sp,
                      fontWeight: FontWeight.bold,
                    ),
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

class BiteFoodCard extends StatelessWidget {
  const BiteFoodCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.r),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.r),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade200,
            spreadRadius: 3.r,
            blurRadius: 10.r,
            offset: Offset(0, 10.h),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 100.h,
            width: 125.w,
            decoration: BoxDecoration(
              color: Colors.blueGrey,
              borderRadius: BorderRadius.circular(20.r),
            ),
          ),
          10.verticalSpace,
          Text(
            'Spicy Burger',
            style: GoogleFonts.sen(
              fontSize: 20.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            'Spicy Restaurant',
            style: GoogleFonts.sen(fontSize: 16.sp, color: Colors.grey),
          ),
          20.verticalSpace,
          Row(
            children: [
              Text(
                'Rs 400',
                style: GoogleFonts.sen(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Spacer(),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.add, size: 30.r),
                style: IconButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.deepOrange,
                ),
              ),
            ],
          ),
        ],
      ),
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
            foregroundColor: Colors.black,
            backgroundColor: Colors.grey.shade200,
          ),
          icon: Icon(Icons.more_horiz, size: 30.r),
        ),
        15.horizontalSpace,
      ],
    );
  }
}
