part of 'first_time_launch_cubit.dart';

sealed class FirstTimeLaunchState extends Equatable {
  const FirstTimeLaunchState();

  @override
  List<Object> get props => [];
}

final class FirstTimeLaunchInitial extends FirstTimeLaunchState {}

final class FirstTimeLaunched extends FirstTimeLaunchState {}

final class NotFirstTimeLaunched extends FirstTimeLaunchState {}

final class FirstTimeLaunchError extends FirstTimeLaunchState {
  final String errorMessage;

  const FirstTimeLaunchError({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}
