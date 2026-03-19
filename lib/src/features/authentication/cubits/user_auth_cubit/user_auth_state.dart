part of 'user_auth_cubit.dart';

sealed class UserAuthState extends Equatable {
  const UserAuthState();

  @override
  List<Object> get props => [];
}

final class UserAuthInitial extends UserAuthState {}

final class UserLoggedIn extends UserAuthState {
  final UserModel user;

  const UserLoggedIn(this.user);

  @override
  List<Object> get props => [user];
}

final class UserLoggedOut extends UserAuthState {}

final class UserLoading extends UserAuthState {}

final class UserCreated extends UserAuthState {}

final class UserAuthError extends UserAuthState {
  final String message;

  const UserAuthError(this.message);

  @override
  List<Object> get props => [message];
}
