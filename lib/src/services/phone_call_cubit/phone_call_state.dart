part of 'phone_call_cubit.dart';

sealed class PhoneCallState extends Equatable {
  const PhoneCallState();

  @override
  List<Object> get props => [];
}

final class PhoneCallInitial extends PhoneCallState {}

final class PhoneCallInProgress extends PhoneCallState {
  final String phoneNumber;

  const PhoneCallInProgress(this.phoneNumber);

  @override
  List<Object> get props => [phoneNumber];
}

final class PhoneCallSuccess extends PhoneCallState {
  final String phoneNumber;

  const PhoneCallSuccess(this.phoneNumber);

  @override
  List<Object> get props => [phoneNumber];
}

final class PhoneCallFailure extends PhoneCallState {
  final String errorMessage;

  const PhoneCallFailure(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}
