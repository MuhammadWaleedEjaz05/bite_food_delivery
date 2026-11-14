import 'package:bite_food_delivery/features/onboarding/bloc/onboarding_cubit.dart';
import 'package:bite_food_delivery/features/onboarding/sections/onboarding_actions_section.dart';
import 'package:bite_food_delivery/features/onboarding/sections/onboarding_carousel_section.dart';
import 'package:material_ui/material_ui.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => OnboardingCubit(),
      child: const Scaffold(
        body: SafeArea(
          child: CustomScrollView(
            key: PageStorageKey('onboarding_screen'),
            physics: BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics(),
            ),
            slivers: [OnboardingCarouselSection(), OnboardingActionsSection()],
          ),
        ),
      ),
    );
  }
}
