part of 'credit_card_cubit.dart';

sealed class CreditCardState extends Equatable {
  const CreditCardState();

  @override
  List<Object> get props => [];
}

final class CreditCardInitial extends CreditCardState {}

final class CreditCardLoading extends CreditCardState {}

final class CreditCardLoaded extends CreditCardState {
  final List<CreditCardModel> creditCardList;
  const CreditCardLoaded({required this.creditCardList});

  @override
  List<Object> get props => [creditCardList];
}

final class CreditCardError extends CreditCardState {
  final String error;

  const CreditCardError(this.error);

  @override
  List<Object> get props => [error];
}

final class CreditCardAdded extends CreditCardState {}

final class CreditCardDeleted extends CreditCardState {}
