part of 'size_and_flavour_selection_cubit_cubit.dart';

class SizeAndFlavourSelectionCubitState extends Equatable {
  final String selectedSize;
  final List<String> selectedFlavours;
  const SizeAndFlavourSelectionCubitState({
    this.selectedSize = '',
    this.selectedFlavours = const [],
  });

  SizeAndFlavourSelectionCubitState copyWith({
    String? selectedSize,
    List<String>? selectedFlavours,
  }) {
    return SizeAndFlavourSelectionCubitState(
      selectedSize: selectedSize ?? this.selectedSize,
      selectedFlavours: selectedFlavours ?? this.selectedFlavours,
    );
  }

  @override
  List<Object> get props => [selectedSize, selectedFlavours];
}
