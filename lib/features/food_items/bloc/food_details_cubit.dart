import 'package:bloc/bloc.dart';
import 'package:bite_food_delivery/features/cart/domain/cart_writer.dart';
import 'package:bite_food_delivery/features/food_items/models/food_detail_arguments.dart';
import 'package:bite_food_delivery/features/cart/models/cart_item_model.dart';
part 'food_details_state.dart';

class FoodDetailsCubit extends Cubit<FoodDetailsState> {
  FoodDetailsCubit(this.arguments, this._cart, this._userId)
    : super(FoodDetailsState(selectedSize: arguments.item.sizes.firstOrNull));
  final FoodDetailArguments arguments;
  final CartWriter _cart;
  final String? Function() _userId;
  bool get available =>
      arguments.restaurantOpen && arguments.item.isAvailable != false;
  double get total => arguments.item.price * state.quantity;
  void selectSize(String size) {
    if (state.submitting || !arguments.item.sizes.contains(size)) return;
    emit(state.copyWith(size: size, result: FoodActionResult.idle));
  }

  void toggleFlavor(String flavor) {
    if (state.submitting || !arguments.item.flavors.containsKey(flavor)) return;
    final flavors = {...state.flavors};
    if (!flavors.add(flavor)) flavors.remove(flavor);
    emit(
      state.copyWith(
        flavors: Set.unmodifiable(flavors),
        result: FoodActionResult.idle,
      ),
    );
  }

  void setQuantity(int quantity) {
    if (state.submitting || quantity < 1 || quantity > 99) return;
    emit(state.copyWith(quantity: quantity, result: FoodActionResult.idle));
  }

  Future<void> addToCart() async {
    if (state.submitting) return;
    if (!available) {
      emit(state.copyWith(result: FoodActionResult.unavailable));
      return;
    }
    final userId = _userId();
    if (userId == null || userId.isEmpty) {
      emit(state.copyWith(result: FoodActionResult.signInRequired));
      return;
    }
    emit(state.copyWith(submitting: true, result: FoodActionResult.idle));
    try {
      final flavors = state.flavors.toList()..sort();
      await _cart.add(
        userId: userId,
        item: CartItemModel(
          productID: arguments.item.id,
          product: arguments.item,
          quantity: state.quantity,
          selectedSize: state.selectedSize,
          selectedFlavor: flavors.isEmpty ? null : flavors.join(', '),
          selectedFlavors: List.unmodifiable(flavors),
        ),
      );
      if (!isClosed) {
        emit(state.copyWith(submitting: false, result: FoodActionResult.added));
      }
    } catch (_) {
      if (!isClosed) {
        emit(
          state.copyWith(submitting: false, result: FoodActionResult.failed),
        );
      }
    }
  }
}
