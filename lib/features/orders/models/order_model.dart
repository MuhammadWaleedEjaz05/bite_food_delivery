import 'package:bite_food_delivery/features/payments/models/credit_card_model.dart';
import 'package:equatable/equatable.dart';
import 'package:uuid/uuid.dart';

enum OrderStatus { received, preparing, dispatched, delivered, cancelled }

const uuid = Uuid();

class OrderModel extends Equatable {
  final String orderId;
  final String userId;
  final String restaurantId;
  final String cartID;
  final double totalPrice;
  final String deliveryAddressId;
  final CreditCardType paymentMethod;
  final DateTime orderPlacedAt;
  final DateTime? orderDeliveredAt;
  final OrderStatus orderStatus;
  final bool isPaid;

  OrderModel({
    String? orderId,
    required this.userId,
    required this.restaurantId,
    required this.cartID,
    required this.totalPrice,
    required this.deliveryAddressId,
    required this.paymentMethod,
    DateTime? orderPlacedAt,
    this.orderDeliveredAt,
    OrderStatus? orderStatus,
    bool? isPaid,
  }) : orderId = orderId ?? uuid.v4(),
       orderPlacedAt = orderPlacedAt ?? DateTime.now(),
       orderStatus = orderStatus ?? OrderStatus.received,
       isPaid = isPaid ?? false;

  factory OrderModel.fromJson(Map<String, dynamic> json) {
    return OrderModel(
      orderId: (json['orderId'] ?? uuid.v4()) as String,
      userId: (json['userId'] ?? '') as String,
      restaurantId: (json['restaurantId'] ?? '') as String,
      cartID: (json['cartID'] ?? '') as String,
      totalPrice: (json['totalPrice'] as num?)?.toDouble() ?? 0.0,
      deliveryAddressId: (json['deliveryAddressId'] ?? '') as String,
      paymentMethod: CreditCardType.values.firstWhere(
        (e) => e.toString() == 'CreditCardType.${json['paymentMethod']}',
        orElse: () => CreditCardType.visa,
      ),
      orderPlacedAt: json['orderPlacedAt'] != null
          ? DateTime.parse(json['orderPlacedAt'])
          : DateTime.now(),
      orderDeliveredAt: json['orderDeliveredAt'] != null
          ? DateTime.parse(json['orderDeliveredAt'])
          : null,
      orderStatus: OrderStatus.values.firstWhere(
        (e) => e.toString() == 'OrderStatus.${json['orderStatus']}',
        orElse: () => OrderStatus.received,
      ),
      isPaid: json['isPaid'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'orderId': orderId,
      'userId': userId,
      'restaurantId': restaurantId,
      'cartID': cartID,
      'totalPrice': totalPrice,
      'deliveryAddressId': deliveryAddressId,
      'paymentMethod': paymentMethod.name,
      'orderPlacedAt': orderPlacedAt.toIso8601String(),
      'orderDeliveredAt': orderDeliveredAt?.toIso8601String(),
      'orderStatus': orderStatus.toString().split('.').last,
      'isPaid': isPaid,
    };
  }

  OrderModel copyWith({
    String? orderId,
    String? userId,
    String? restaurantId,
    String? cartID,
    double? totalPrice,
    String? deliveryAddressId,
    CreditCardType? paymentMethod,
    DateTime? orderPlacedAt,
    DateTime? orderDeliveredAt,
    OrderStatus? orderStatus,
    bool? isPaid,
  }) {
    return OrderModel(
      orderId: orderId ?? this.orderId,
      userId: userId ?? this.userId,
      restaurantId: restaurantId ?? this.restaurantId,
      cartID: cartID ?? this.cartID,
      totalPrice: totalPrice ?? this.totalPrice,
      deliveryAddressId: deliveryAddressId ?? this.deliveryAddressId,
      paymentMethod: paymentMethod ?? this.paymentMethod,
      orderPlacedAt: orderPlacedAt ?? this.orderPlacedAt,
      orderDeliveredAt: orderDeliveredAt ?? this.orderDeliveredAt,
      orderStatus: orderStatus ?? this.orderStatus,
      isPaid: isPaid ?? this.isPaid,
    );
  }

  @override
  List<Object?> get props => [
    orderId,
    userId,
    restaurantId,
    cartID,
    totalPrice,
    deliveryAddressId,
    paymentMethod,
    orderPlacedAt,
    orderDeliveredAt,
    orderStatus,
    isPaid,
  ];
}
