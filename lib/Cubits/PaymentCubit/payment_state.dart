part of 'payment_cubit.dart';

sealed class PaymentState extends Equatable {
  const PaymentState();

  @override
  List<Object> get props => [];
}

final class PaymentInitial extends PaymentState {}

final class PaymentLoading extends PaymentState {}
final class PaymentSuccess extends PaymentState {
  final String message;

  const PaymentSuccess(this.message);

  @override
  List<Object> get props => [message];
}
final class PaymentFailure extends PaymentState {
  final String error;

  const PaymentFailure(this.error);

  @override
  List<Object> get props => [error];
}
final class PaymentCancelled extends PaymentState {
  final String message;

  const PaymentCancelled(this.message);

  @override
  List<Object> get props => [message];
}

