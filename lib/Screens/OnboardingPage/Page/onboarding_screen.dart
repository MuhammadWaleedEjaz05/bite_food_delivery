import 'package:bite_food_delivery/Cubits/FirstTimeLaunchCubit/first_time_launch_cubit.dart';
import 'package:bite_food_delivery/Screens/OnboardingPage/Widgets/bite_carousel_slider_page.dart';
import 'package:bite_food_delivery/main.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

final List<Widget> carouselPages = [
  BiteCarouselSliderPage(
    title: 'All your favorites',
    description:
        'Get all your loved foods in one once place,you just place the orer we do the rest',
    index: 0,
  ),
  BiteCarouselSliderPage(
    title: 'Order from choosen chef',
    description:
        'Get all your loved foods in one once place,you just place the orer we do the rest',
    index: 1,
  ),
  BiteCarouselSliderPage(
    title: 'Free delivery offers',
    description:
        'Get all your loved foods in one once place,you just place the orer we do the rest',
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
      backgroundColor: Colors.white,
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
                  BlocProvider.of<FirstTimeLaunchCubit>(
                    context,
                  ).setFirstTimeLaunched();
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => MainPage()),
                  );
                } else {
                  buttonCarouselController.nextPage(
                    duration: Duration(milliseconds: 300),
                    curve: Curves.easeIn,
                  );
                }
              },
              style: ElevatedButton.styleFrom(
                fixedSize: Size(300.w, 50.h),
                backgroundColor: Colors.deepOrange,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.r),
                ),
                textStyle: Theme.of(context).textTheme.titleLarge,
              ),
              child: Text(_isLastPage ? 'Get Started' : 'Next'),
            ),
          ),
          5.verticalSpace,
          TextButton(
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => MainPage()),
              );
            },
            child: Text(
              "Skip",
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
