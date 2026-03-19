part of 'bottom_navigation_selector_cubit.dart';

@immutable
sealed class BottomNavigationSelectorState {}

final class BottomNavigationSelectorInitial
    extends BottomNavigationSelectorState {
  final int selectedIndex = 0;
}

final class BottomNavigationSelectorChanged
    extends BottomNavigationSelectorState {
  final int selectedIndex;

  BottomNavigationSelectorChanged({required this.selectedIndex});
}
