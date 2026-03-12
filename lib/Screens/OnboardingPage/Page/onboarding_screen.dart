import 'package:bite_food_delivery/Cubits/FirstTimeLaunchCubit/first_time_launch_cubit.dart';
import 'package:bite_food_delivery/Screens/OnboardingPage/Widgets/bite_carousel_slider_page.dart';
import 'package:bite_food_delivery/generated/l10n.dart';
import 'package:bite_food_delivery/main.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

final List<Widget> carouselPages = [
  BiteCarouselSliderPage(
    title: S.current.allYourFavorites,
    description: S.current.getAllYourLovedFoodsInOnePlace,
    index: 0,
  ),
  BiteCarouselSliderPage(
    title: S.current.orderFromChoosenChef,
    description: S.current.getAllYourLovedFoodsInOnePlace,
    index: 1,
  ),
  BiteCarouselSliderPage(
    title: S.current.freeDeliveryOffers,
    description: S.current.getAllYourLovedFoodsInOnePlace,
    index: 2,
  ),
];

int carouselCurrentPage = 0;

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final CarouselSliderController buttonCarouselController =
      CarouselSliderController();

  bool get _isLastPage => carouselCurrentPage == carouselPages.length - 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CarouselSlider(
            carouselController: buttonCarouselController,
            items: carouselPages,
            options: CarouselOptions(
              scrollDirection: Axis.horizontal,
              aspectRatio: 3 / 4.2,
              enlargeCenterPage: true,
              enableInfiniteScroll: false,
              onPageChanged: (index, reason) {
                setState(() {
                  carouselCurrentPage = index;
                });
              },
            ),
          ),
          Center(
            child: ElevatedButton(
              onPressed: () {
                if (_isLastPage) {
                  context.read<FirstTimeLaunchCubit>().setFirstTimeLaunched();
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const MainPage()),
                  );
                } else {
                  buttonCarouselController.nextPage(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeIn,
                  );
                }
              },
              style: ElevatedButton.styleFrom(
                fixedSize: Size(300.w, 50.h),
                backgroundColor: Theme.of(context).colorScheme.primary,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.r),
                ),
                textStyle: Theme.of(context).textTheme.titleLarge,
              ),
              child: Text(
                _isLastPage ? S.of(context).getStarted : S.of(context).next,
              ),
            ),
          ),
          5.verticalSpace,
          TextButton(
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const MainPage()),
              );
            },
            child: Text(
              S.of(context).skip,
              style: Theme.of(
                context,
              ).textTheme.bodyMedium!.copyWith(color: Colors.grey),
            ),
          ),
        ],
      ),
    );
  }
}
