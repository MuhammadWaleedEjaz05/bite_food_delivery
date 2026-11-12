import 'package:equatable/equatable.dart';

class ReviewEditorState extends Equatable {
  final double orderRating;
  final double restaurantRating;
  final String comment;
  final bool isSubmitting;
  final bool isSuccess;
  final String? errorMessage;

  const ReviewEditorState({
    this.orderRating = 5.0,
    this.restaurantRating = 5.0,
    this.comment = '',
    this.isSubmitting = false,
    this.isSuccess = false,
    this.errorMessage,
  });

  bool get isValid => orderRating > 0 && restaurantRating > 0;

  ReviewEditorState copyWith({
    double? orderRating,
    double? restaurantRating,
    String? comment,
    bool? isSubmitting,
    bool? isSuccess,
    String? errorMessage,
  }) {
    return ReviewEditorState(
      orderRating: orderRating ?? this.orderRating,
      restaurantRating: restaurantRating ?? this.restaurantRating,
      comment: comment ?? this.comment,
      isSubmitting: isSubmitting ?? this.isSubmitting,
      isSuccess: isSuccess ?? this.isSuccess,
      errorMessage: errorMessage,
    );
  }

  @override
  List<Object?> get props => [
    orderRating,
    restaurantRating,
    comment,
    isSubmitting,
    isSuccess,
    errorMessage,
  ];
}
