import 'package:bite_food_delivery/features/orders/models/order_model.dart';
import 'package:bite_food_delivery/features/restaurants/bloc/restaurants_cubit.dart';
import 'package:bite_food_delivery/features/reviews/bloc/rating_and_review_cubit.dart';
import 'package:bite_food_delivery/features/reviews/bloc/review_editor_state.dart';
import 'package:bite_food_delivery/features/reviews/models/rating_and_review_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ReviewEditorCubit extends Cubit<ReviewEditorState> {
  ReviewEditorCubit() : super(const ReviewEditorState());

  void setOrderRating(double rating) {
    emit(state.copyWith(orderRating: rating));
  }

  void setRestaurantRating(double rating) {
    emit(state.copyWith(restaurantRating: rating));
  }

  void setComment(String comment) {
    emit(state.copyWith(comment: comment));
  }

  Future<bool> submit({
    required OrderModel order,
    required RatingAndReviewCubit reviewsCubit,
    required RestaurantsCubit restaurantsCubit,
  }) async {
    if (!state.isValid || state.isSubmitting) return false;

    emit(state.copyWith(isSubmitting: true, errorMessage: null));

    final review = RatingAndReviewModel(
      userId: order.userId,
      orderId: order.orderId,
      restaurantId: order.restaurantId,
      orderRating: state.orderRating,
      restaurantRating: state.restaurantRating,
      reviewText: state.comment.trim(),
      createdAt: DateTime.now(),
    );

    try {
      await reviewsCubit.submitReviews(review, restaurantsCubit);
      emit(state.copyWith(isSubmitting: false, isSuccess: true));
      return true;
    } catch (e) {
      emit(state.copyWith(isSubmitting: false, errorMessage: e.toString()));
      return false;
    }
  }
}
