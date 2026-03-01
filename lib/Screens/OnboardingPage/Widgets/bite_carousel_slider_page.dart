import 'package:bite_food_delivery/Screens/OnboardingPage/Page/onboarding_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BiteCarouselSliderPage extends StatelessWidget {
  final String title;
  final String description;
  final int index;
  const BiteCarouselSliderPage({
    super.key,
    required this.title,
    required this.description,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Flexible(
          child: Container(
            width: 250.w,
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(10.r),
            ),
          ),
        ),
        20.verticalSpace,
        Text(title, style: Theme.of(context).textTheme.titleLarge),
        10.verticalSpace,
        Text(
          description,
          style: Theme.of(
            context,
          ).textTheme.bodyMedium!.copyWith(color: Colors.grey),
        ),
        5.verticalSpace,
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            carouselPages.length,
            (carouselCurrentPage) => Container(
              height: 10.h,
              width: 10.w,
              margin: EdgeInsets.symmetric(horizontal: 5.w),
              decoration: BoxDecoration(
                color: carouselCurrentPage == index
                    ? Theme.of(context).colorScheme.primary
                    : Theme.of(context).colorScheme.secondary,
                borderRadius: BorderRadius.circular(5.r),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
