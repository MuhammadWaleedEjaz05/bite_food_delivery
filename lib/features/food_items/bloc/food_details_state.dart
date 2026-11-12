part of 'food_details_cubit.dart';

enum FoodActionResult { idle, added, failed, signInRequired, unavailable }

class FoodDetailsState {
  const FoodDetailsState({
    this.selectedSize,
    this.flavors = const {},
    this.quantity = 1,
    this.submitting = false,
    this.result = FoodActionResult.idle,
  });
  final String? selectedSize;
  final Set<String> flavors;
  final int quantity;
  final bool submitting;
  final FoodActionResult result;
  FoodDetailsState copyWith({
    String? size,
    Set<String>? flavors,
    int? quantity,
    bool? submitting,
    FoodActionResult? result,
  }) => FoodDetailsState(
    selectedSize: size ?? selectedSize,
    flavors: flavors ?? this.flavors,
    quantity: quantity ?? this.quantity,
    submitting: submitting ?? this.submitting,
    result: result ?? this.result,
  );
}
