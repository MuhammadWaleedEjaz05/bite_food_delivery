import 'package:equatable/equatable.dart';

class RatingAndReviewModel extends Equatable {
  final String userId;
  final String orderId;
  final String restaurantId;
  final double orderRating;
  final double restaurantRating;
  final String reviewText;
  final DateTime? createdAt;

  const RatingAndReviewModel({
    required this.userId,
    required this.orderId,
    required this.restaurantId,
    required this.orderRating,
    required this.restaurantRating,
    required this.reviewText,
    this.createdAt,
  });

  factory RatingAndReviewModel.fromJson(Map<String, dynamic> json) {
    return RatingAndReviewModel(
      userId: json['userId'] as String? ?? '',
      orderId: json['orderId'] as String? ?? '',
      restaurantId: json['restaurantId'] as String? ?? '',
      orderRating: (json['orderRating'] as num?)?.toDouble() ?? 0.0,
      restaurantRating: (json['restaurantRating'] as num?)?.toDouble() ?? 0.0,
      reviewText: json['reviewText'] as String? ?? '',
      createdAt: json['createdAt'] != null
          ? DateTime.tryParse(json['createdAt'] as String)
          : null,
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
      if (createdAt != null) 'createdAt': createdAt!.toIso8601String(),
    };
  }

  RatingAndReviewModel copyWith({
    String? userId,
    String? orderId,
    String? restaurantId,
    double? orderRating,
    double? restaurantRating,
    String? reviewText,
    DateTime? createdAt,
  }) {
    return RatingAndReviewModel(
      userId: userId ?? this.userId,
      orderId: orderId ?? this.orderId,
      restaurantId: restaurantId ?? this.restaurantId,
      orderRating: orderRating ?? this.orderRating,
      restaurantRating: restaurantRating ?? this.restaurantRating,
      reviewText: reviewText ?? this.reviewText,
      createdAt: createdAt ?? this.createdAt,
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
    createdAt,
  ];
}
