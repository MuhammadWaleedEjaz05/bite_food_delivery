import 'package:bite_food_delivery/features/restaurants/bloc/restaurants_cubit.dart';
import 'package:bite_food_delivery/features/restaurants/data/restaurant_dto.dart';
import 'package:bite_food_delivery/features/reviews/bloc/rating_and_review_state.dart';
import 'package:bite_food_delivery/features/reviews/models/rating_and_review_model.dart';
import 'package:bite_food_delivery/src/services/firebase/firebase_auth_conn.dart';
import 'package:bite_food_delivery/src/services/firebase/firebase_db_conn.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RatingAndReviewCubit extends Cubit<RatingAndReviewState> {
  final List<RatingAndReviewModel> _cachedReviews = [];

  RatingAndReviewCubit() : super(const RatingAndReviewInitial());

  List<RatingAndReviewModel> get cachedReviews =>
      List.unmodifiable(_cachedReviews);

  void init() {
    final user = getCurrentUser();
    if (user != null) {
      fetchReviews(user.uid);
    }
  }

  Future<void> submitReviews(
    RatingAndReviewModel review,
    RestaurantsCubit restaurantCubit,
  ) async {
    try {
      emit(const RatingAndReviewLoading());
      final db = getCollection('ReviewsDB');
      final restaurantDoc = getCollection(
        'RestaurantsDB',
      ).doc(review.restaurantId);
      final restaurantData = await restaurantDoc.get();

      if (restaurantData.exists) {
        final restaurantModel = RestaurantDto.decode(
          restaurantData.data() as Map<String, dynamic>,
        );
        await db.doc(review.orderId).set(review.toJson());
        _cachedReviews.removeWhere((r) => r.orderId == review.orderId);
        _cachedReviews.add(review);

        final currentCount = restaurantModel.reviewsCount;
        final newRating =
            ((restaurantModel.rating * currentCount) +
                review.restaurantRating) /
            (currentCount + 1);

        await restaurantDoc.update({
          'rating': newRating,
          'reviewsCount': currentCount + 1,
        });

        restaurantCubit.loadRestaurants();
        emit(RatingAndReviewAdded(review));
      } else {
        await db.doc(review.orderId).set(review.toJson());
        _cachedReviews.add(review);
        emit(RatingAndReviewAdded(review));
      }
    } catch (e) {
      emit(RatingAndReviewError(e.toString()));
    }
  }

  Future<void> fetchReviews(String userId) async {
    try {
      emit(const RatingAndReviewLoading());
      final db = getCollection('ReviewsDB');
      final doc = await db.where('userId', isEqualTo: userId).get();

      if (doc.docs.isNotEmpty) {
        final reviews = doc.docs
            .map(
              (d) => RatingAndReviewModel.fromJson(
                d.data()! as Map<String, dynamic>,
              ),
            )
            .toList();
        _cachedReviews.clear();
        _cachedReviews.addAll(reviews);
        emit(RatingAndReviewLoaded(List.unmodifiable(_cachedReviews)));
      } else {
        _cachedReviews.clear();
        emit(const RatingAndReviewLoaded([]));
      }
    } catch (e) {
      emit(RatingAndReviewError(e.toString()));
    }
  }
}
