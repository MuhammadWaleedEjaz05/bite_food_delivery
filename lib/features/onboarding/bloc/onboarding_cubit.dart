import 'package:bite_food_delivery/features/onboarding/bloc/onboarding_state.dart';
import 'package:material_ui/material_ui.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OnboardingCubit extends Cubit<OnboardingState> {
  final PageController pageController;

  OnboardingCubit({PageController? controller})
    : pageController = controller ?? PageController(),
      super(const OnboardingState());

  void setPage(int page) {
    emit(state.copyWith(currentIndex: page));
  }

  void nextPage() {
    if (!state.isLastPage) {
      final next = state.currentIndex + 1;
      if (pageController.hasClients) {
        pageController.animateToPage(
          next,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      }
      emit(state.copyWith(currentIndex: next));
    }
  }

  @override
  Future<void> close() {
    pageController.dispose();
    return super.close();
  }
}
