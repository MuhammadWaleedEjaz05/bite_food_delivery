part of 'food_item_cubit.dart';

sealed class FoodItemState extends Equatable {
  const FoodItemState();

  @override
  List<Object> get props => [];
}

final class FoodItemInitial extends FoodItemState {}

final class FoodItemUploading extends FoodItemState {}

final class FoodItemUploaded extends FoodItemState {}

final class FoodItemLoading extends FoodItemState {}

final class FoodItemLoaded extends FoodItemState {
  final List<FoodItemModel> foodItems;

  const FoodItemLoaded({required this.foodItems});

  @override
  List<Object> get props => [foodItems];
}

final class FoodItemError extends FoodItemState {
  final String message;

  const FoodItemError({required this.message});

  @override
  List<Object> get props => [message];
}
