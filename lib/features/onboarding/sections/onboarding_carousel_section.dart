import 'package:bite_food_delivery/features/onboarding/bloc/onboarding_cubit.dart';
import 'package:bite_food_delivery/features/onboarding/bloc/onboarding_state.dart';
import 'package:bite_food_delivery/features/onboarding/widgets/onboarding_page_indicator.dart';
import 'package:bite_food_delivery/features/onboarding/widgets/onboarding_slide.dart';
import 'package:bite_food_delivery/l10n/app_localizations.dart';
import 'package:material_ui/material_ui.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnboardingCarouselSection extends StatelessWidget {
  const OnboardingCarouselSection({super.key});

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context)!;
    final cubit = context.read<OnboardingCubit>();

    final slides = [
      OnboardingSlide(
        assetName: 'assets/svgs/logo.svg',
        title: t.allYourFavorites,
        description: t.getAllYourLovedFoodsInOnePlace,
      ),
      OnboardingSlide(
        assetName: 'assets/svgs/logo.svg',
        title: t.orderFromChoosenChef,
        description: t.getAllYourLovedFoodsInOnePlace,
      ),
      OnboardingSlide(
        assetName: 'assets/svgs/logo.svg',
        title: t.freeDeliveryOffers,
        description: t.getAllYourLovedFoodsInOnePlace,
      ),
    ];

    return SliverToBoxAdapter(
      child: Column(
        children: [
          40.verticalSpace,
          SizedBox(
            height: 440.h,
            child: PageView.builder(
              controller: cubit.pageController,
              itemCount: slides.length,
              onPageChanged: cubit.setPage,
              itemBuilder: (context, index) => slides[index],
            ),
          ),
          24.verticalSpace,
          BlocBuilder<OnboardingCubit, OnboardingState>(
            buildWhen: (previous, current) =>
                previous.currentIndex != current.currentIndex,
            builder: (context, state) {
              return OnboardingPageIndicator(
                count: slides.length,
                currentIndex: state.currentIndex,
              );
            },
          ),
        ],
      ),
    );
  }
}
