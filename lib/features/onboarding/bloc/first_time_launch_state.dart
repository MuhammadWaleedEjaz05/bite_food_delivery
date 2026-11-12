import 'package:equatable/equatable.dart';

sealed class FirstTimeLaunchState extends Equatable {
  const FirstTimeLaunchState();

  @override
  List<Object?> get props => [];
}

final class FirstTimeLaunchInitial extends FirstTimeLaunchState {
  const FirstTimeLaunchInitial();
}

final class FirstTimeLaunched extends FirstTimeLaunchState {
  const FirstTimeLaunched();
}

final class NotFirstTimeLaunched extends FirstTimeLaunchState {
  const NotFirstTimeLaunched();
}

final class FirstTimeLaunchError extends FirstTimeLaunchState {
  final String errorMessage;

  const FirstTimeLaunchError({required this.errorMessage});

  @override
  List<Object?> get props => [errorMessage];
}
