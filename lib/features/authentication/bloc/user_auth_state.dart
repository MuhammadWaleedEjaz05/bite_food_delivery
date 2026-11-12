import 'package:bite_food_delivery/features/authentication/models/user_model.dart';
import 'package:equatable/equatable.dart';

sealed class UserAuthState extends Equatable {
  const UserAuthState();

  @override
  List<Object?> get props => [];
}

final class UserAuthInitial extends UserAuthState {
  const UserAuthInitial();
}

final class UserLoggedIn extends UserAuthState {
  final UserModel user;

  const UserLoggedIn(this.user);

  @override
  List<Object?> get props => [user];
}

final class UserLoggedOut extends UserAuthState {
  const UserLoggedOut();
}

final class UserLoading extends UserAuthState {
  const UserLoading();
}

final class UserCreated extends UserAuthState {
  const UserCreated();
}

final class UserAuthError extends UserAuthState {
  final String message;

  const UserAuthError(this.message);

  @override
  List<Object?> get props => [message];
}
