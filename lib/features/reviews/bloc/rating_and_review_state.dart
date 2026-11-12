import 'package:bite_food_delivery/features/reviews/models/rating_and_review_model.dart';
import 'package:equatable/equatable.dart';

sealed class RatingAndReviewState extends Equatable {
  const RatingAndReviewState();

  @override
  List<Object?> get props => [];
}

final class RatingAndReviewInitial extends RatingAndReviewState {
  const RatingAndReviewInitial();
}

final class RatingAndReviewLoading extends RatingAndReviewState {
  const RatingAndReviewLoading();
}

final class RatingAndReviewLoaded extends RatingAndReviewState {
  final List<RatingAndReviewModel> reviews;

  const RatingAndReviewLoaded(this.reviews);

  @override
  List<Object?> get props => [reviews];
}

final class RatingAndReviewAdded extends RatingAndReviewState {
  final RatingAndReviewModel review;

  const RatingAndReviewAdded(this.review);

  @override
  List<Object?> get props => [review];
}

final class RatingAndReviewError extends RatingAndReviewState {
  final String message;

  const RatingAndReviewError(this.message);

  @override
  List<Object?> get props => [message];
}
