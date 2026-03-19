import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'size_and_flavour_selection_cubit_state.dart';

class SizeAndFlavourSelectionCubitCubit
    extends Cubit<SizeAndFlavourSelectionCubitState> {
  SizeAndFlavourSelectionCubitCubit()
    : super(const SizeAndFlavourSelectionCubitState());

  void selectSize(String size) {
    emit(state.copyWith(selectedSize: size));
  }

  void selectFlavour(String flavour) {
    emit(
      state.copyWith(selectedFlavours: [...state.selectedFlavours, flavour]),
    );
  }

  void removeFlavour(String flavour) {
    emit(
      state.copyWith(
        selectedFlavours: state.selectedFlavours
            .where((f) => f != flavour)
            .toList(),
      ),
    );
  }
}
