class OnboardingState {
  final int currentIndex;
  final int totalPages;

  const OnboardingState({this.currentIndex = 0, this.totalPages = 3});

  bool get isLastPage => currentIndex >= totalPages - 1;

  OnboardingState copyWith({int? currentIndex, int? totalPages}) {
    return OnboardingState(
      currentIndex: currentIndex ?? this.currentIndex,
      totalPages: totalPages ?? this.totalPages,
    );
  }
}
