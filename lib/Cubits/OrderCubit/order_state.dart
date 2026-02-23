part of 'order_cubit.dart';

sealed class OrderState extends Equatable {
  const OrderState();

  @override
  List<Object> get props => [];
}

final class OrderInitial extends OrderState {}

final class OrderLoading extends OrderState {}

final class OrderPlaced extends OrderState {
  final OrderModel order;

  const OrderPlaced(this.order);

  @override
  List<Object> get props => [order];
}

final class OrderError extends OrderState {
  final String message;

  const OrderError(this.message);

  @override
  List<Object> get props => [message];
}

final class OrderHistoryLoaded extends OrderState {
  final List<OrderModel> orders;

  const OrderHistoryLoaded(this.orders);

  @override
  List<Object> get props => [orders];
}

final class OrderStatusUpdated extends OrderState {
  final OrderModel order;

  const OrderStatusUpdated(this.order);

  @override
  List<Object> get props => [order];
}

final class ActiveOrderUpdated extends OrderState {
  final OrderModel order;

  const ActiveOrderUpdated(this.order);

  @override
  List<Object> get props => [order];
}

final class ActiveOrderDelivered extends OrderState {
  final OrderModel order;

  const ActiveOrderDelivered(this.order);

  @override
  List<Object> get props => [order];
}
