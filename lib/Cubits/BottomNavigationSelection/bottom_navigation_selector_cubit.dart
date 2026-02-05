import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'bottom_navigation_selector_state.dart';

class BottomNavigationSelectorCubit
    extends Cubit<BottomNavigationSelectorState> {
  BottomNavigationSelectorCubit() : super(BottomNavigationSelectorInitial());
  void changeSelectedIndex(int index) {
    emit(BottomNavigationSelectorChanged(selectedIndex: index));
  }
}
