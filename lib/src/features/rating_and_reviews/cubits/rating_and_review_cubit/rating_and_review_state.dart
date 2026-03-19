part of 'rating_and_review_cubit.dart';

@immutable
sealed class RatingAndReviewState {}

final class RatingAndReviewInitial extends RatingAndReviewState {}

final class RatingAndReviewLoading extends RatingAndReviewState {}

final class RatingAndReviewLoaded extends RatingAndReviewState {
  final List<RatingAndReviewModel> reviews;
  RatingAndReviewLoaded(this.reviews);
}

final class RatingAndReviewAdded extends RatingAndReviewState {
  final RatingAndReviewModel ratingAndReview;
  RatingAndReviewAdded(this.ratingAndReview);
}

final class RatingAndReviewError extends RatingAndReviewState {
  final String message;

  RatingAndReviewError(this.message);
}
