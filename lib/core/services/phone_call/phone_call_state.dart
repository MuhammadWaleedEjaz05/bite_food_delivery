part of 'phone_call_cubit.dart';

abstract class PhoneCallState extends Equatable {
  const PhoneCallState();

  @override
  List<Object?> get props => [];
}

class PhoneCallInitial extends PhoneCallState {}

class PhoneCallInProgress extends PhoneCallState {
  final String phoneNumber;

  const PhoneCallInProgress(this.phoneNumber);

  @override
  List<Object?> get props => [phoneNumber];
}

class PhoneCallSuccess extends PhoneCallState {
  final String phoneNumber;

  const PhoneCallSuccess(this.phoneNumber);

  @override
  List<Object?> get props => [phoneNumber];
}

class PhoneCallFailure extends PhoneCallState {
  final String errorMessage;

  const PhoneCallFailure(this.errorMessage);

  @override
  List<Object?> get props => [errorMessage];
}

