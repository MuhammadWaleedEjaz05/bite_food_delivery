import 'package:bite_food_delivery/core/extensions/theme_extensions.dart';
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
        icon: Icons.lunch_dining_rounded,
        pastelColor: context.pastelMint,
        badgeText: 'SIZZLING FAST MEALS',
        badgeIcon: Icons.local_fire_department_rounded,
        title: t.allYourFavorites,
        description: t.getAllYourLovedFoodsInOnePlace,
        garnishes: [
          FloatingGarnishData(
            icon: Icons.local_fire_department_rounded,
            color: const Color(0xFFFF5722),
            top: 22.h,
            left: 24.w,
          ),
          FloatingGarnishData(
            icon: Icons.auto_awesome_rounded,
            color: const Color(0xFFFFB800),
            top: 26.h,
            right: 26.w,
          ),
          FloatingGarnishData(
            icon: Icons.fastfood_rounded,
            color: const Color(0xFF00C853),
            bottom: 35.h,
            right: 22.w,
          ),
        ],
      ),
      OnboardingSlide(
        assetName: 'assets/svgs/logo.svg',
        icon: Icons.soup_kitchen_rounded,
        pastelColor: context.pastelButter,
        badgeText: 'MASTER CHEF GOURMET',
        badgeIcon: Icons.star_rounded,
        title: t.orderFromChoosenChef,
        description: t.getAllYourLovedFoodsInOnePlace,
        garnishes: [
          FloatingGarnishData(
            icon: Icons.star_rounded,
            color: const Color(0xFFFFB800),
            top: 22.h,
            right: 24.w,
          ),
          FloatingGarnishData(
            icon: Icons.eco_rounded,
            color: const Color(0xFF00E676),
            bottom: 35.h,
            left: 22.w,
          ),
          FloatingGarnishData(
            icon: Icons.restaurant_menu_rounded,
            color: const Color(0xFFFF9100),
            top: 30.h,
            left: 26.w,
          ),
        ],
      ),
      OnboardingSlide(
        assetName: 'assets/svgs/logo.svg',
        icon: Icons.delivery_dining_rounded,
        pastelColor: context.pastelSkyBlue,
        badgeText: 'HYPERSONIC 15-MIN GPS',
        badgeIcon: Icons.bolt_rounded,
        title: t.freeDeliveryOffers,
        description: t.getAllYourLovedFoodsInOnePlace,
        garnishes: [
          FloatingGarnishData(
            icon: Icons.bolt_rounded,
            color: const Color(0xFFFFD600),
            top: 22.h,
            left: 24.w,
          ),
          FloatingGarnishData(
            icon: Icons.radar_rounded,
            color: const Color(0xFF00B0FF),
            top: 26.h,
            right: 26.w,
          ),
          FloatingGarnishData(
            icon: Icons.speed_rounded,
            color: const Color(0xFFFF1744),
            bottom: 35.h,
            right: 22.w,
          ),
        ],
      ),
    ];

    return SliverToBoxAdapter(
      child: Column(
        children: [
          20.verticalSpace,
          SizedBox(
            height: 440.h,
            child: PageView.builder(
              controller: cubit.pageController,
              itemCount: slides.length,
              onPageChanged: cubit.setPage,
              itemBuilder: (context, index) => slides[index],
            ),
          ),
          18.verticalSpace,
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
