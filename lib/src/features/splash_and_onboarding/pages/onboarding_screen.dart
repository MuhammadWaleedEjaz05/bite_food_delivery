import 'package:bite_food_delivery/src/features/splash_and_onboarding/cubits/first_time_launch_cubit/first_time_launch_cubit.dart';
import 'package:bite_food_delivery/src/features/splash_and_onboarding/widgets/bite_carousel_slider_page.dart';
import 'package:bite_food_delivery/l10n/app_localizations.dart';
import 'package:bite_food_delivery/main.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

List<Widget> getCarouselPages(BuildContext context) => [
  BiteCarouselSliderPage(
    title: AppLocalizations.of(context)!.allYourFavorites,
    description: AppLocalizations.of(context)!.getAllYourLovedFoodsInOnePlace,
  ),
  BiteCarouselSliderPage(
    title: AppLocalizations.of(context)!.orderFromChoosenChef,
    description: AppLocalizations.of(context)!.getAllYourLovedFoodsInOnePlace,
  ),
  BiteCarouselSliderPage(
    title: AppLocalizations.of(context)!.freeDeliveryOffers,
    description: AppLocalizations.of(context)!.getAllYourLovedFoodsInOnePlace,
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

  bool get _isLastPage => carouselCurrentPage == 2;

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
            items: getCarouselPages(context),
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
                    MaterialPageRoute(builder: (context) => MainPage()),
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
                _isLastPage
                    ? AppLocalizations.of(context)!.getStarted
                    : AppLocalizations.of(context)!.next,
              ),
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
              AppLocalizations.of(context)!.skip,
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
