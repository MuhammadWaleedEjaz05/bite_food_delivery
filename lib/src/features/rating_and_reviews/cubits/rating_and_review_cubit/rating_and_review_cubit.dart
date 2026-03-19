import 'package:bite_food_delivery/src/features/restaurants/cubits/restaurants_cubit/restaurants_cubit.dart';
import 'package:bite_food_delivery/src/features/rating_and_reviews/models/rating_and_review_model.dart';
import 'package:bite_food_delivery/src/features/restaurants/models/restaurants_model.dart';
import 'package:bite_food_delivery/src/services/firebase/firebase_auth_conn.dart';
import 'package:bite_food_delivery/src/services/firebase/firebase_db_conn.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'rating_and_review_state.dart';

class RatingAndReviewCubit extends Cubit<RatingAndReviewState> {
  final List<RatingAndReviewModel> _cachedReviews = [];
  RatingAndReviewCubit() : super(RatingAndReviewInitial());

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
      final db = getCollection('ReviewsDB');
      final restaurant = getCollection(
        'RestaurantsDB',
      ).doc(review.restaurantId);
      final restaurantData = await restaurant.get();
      if (restaurantData.exists) {
        final restaurantModel = RestaurantModel.fromJson(
          restaurantData.data() as Map<String, dynamic>,
        );
        await db.doc(review.orderId).set(review.toJson());
        _cachedReviews.add(review);
        final newRating =
            (restaurantModel.rating * restaurantModel.reviewsCount +
                review.restaurantRating) /
            (restaurantModel.reviewsCount + 1);
        await restaurant.set(
          restaurantModel
              .copyWith(
                rating: newRating,
                reviewsCount: restaurantModel.reviewsCount + 1,
              )
              .toJson(),
        );
        restaurantCubit.loadRestaurants();
        emit(RatingAndReviewAdded(review));
      }
    } catch (e) {
      emit(RatingAndReviewError(e.toString()));
    }
  }

  Future<void> fetchReviews(String userId) async {
    try {
      emit(RatingAndReviewLoading());
      final db = getCollection('ReviewsDB');
      final doc = await db.where('userId', isEqualTo: userId).get();
      if (doc.docs.isNotEmpty) {
        final reviews = doc.docs
            .map(
              (doc) => RatingAndReviewModel.fromJson(
                doc.data()! as Map<String, dynamic>,
              ),
            )
            .toList();
        _cachedReviews.clear();
        _cachedReviews.addAll(reviews);
        Future.delayed(const Duration(seconds: 1));
        emit(RatingAndReviewLoaded(_cachedReviews));
      } else {
        emit(RatingAndReviewError('No review found for this user.'));
      }
    } catch (e) {
      emit(RatingAndReviewError(e.toString()));
    }
  }
}
