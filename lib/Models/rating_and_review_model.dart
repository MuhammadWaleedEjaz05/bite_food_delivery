import 'package:equatable/equatable.dart';

class RatingAndReviewModel extends Equatable {
  final String userId;
  final String orderId;
  final String restaurantId;
  final double orderRating;
  final double restaurantRating;
  final String reviewText;

  const RatingAndReviewModel({
    required this.userId,
    required this.orderId,
    required this.restaurantId,
    required this.orderRating,
    required this.restaurantRating,
    required this.reviewText,
  });

  factory RatingAndReviewModel.fromJson(Map<String, dynamic> json) {
    return RatingAndReviewModel(
      userId: json['userId'],
      orderId: json['orderId'],
      restaurantId: json['restaurantId'],
      orderRating: json['orderRating'].toDouble(),
      restaurantRating: json['restaurantRating'].toDouble(),
      reviewText: json['reviewText'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'orderId': orderId,
      'restaurantId': restaurantId,
      'orderRating': orderRating,
      'restaurantRating': restaurantRating,
      'reviewText': reviewText,
    };
  }

  RatingAndReviewModel copyWith({
    String? userId,
    String? orderId,
    String? restaurantId,
    double? orderRating,
    double? restaurantRating,
    String? reviewText,
  }) {
    return RatingAndReviewModel(
      userId: userId ?? this.userId,
      orderId: orderId ?? this.orderId,
      restaurantId: restaurantId ?? this.restaurantId,
      orderRating: orderRating ?? this.orderRating,
      restaurantRating: restaurantRating ?? this.restaurantRating,
      reviewText: reviewText ?? this.reviewText,
    );
  }

  @override
  List<Object?> get props => [
    userId,
    orderId,
    restaurantId,
    orderRating,
    restaurantRating,
    reviewText,
  ];
}
