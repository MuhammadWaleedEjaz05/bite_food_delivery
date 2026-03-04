part of 'update_check_cubit.dart';

@immutable
sealed class UpdateCheckState {}

final class UpdateCheckInitial extends UpdateCheckState {}

final class UpdateCheckLoading extends UpdateCheckState {}

final class UpdateRequired extends UpdateCheckState {
  final String latestVersion;
  final String updateUrl;

  UpdateRequired({required this.latestVersion, required this.updateUrl});
}

final class UpdateNotRequired extends UpdateCheckState {}

final class UpdateCheckError extends UpdateCheckState {
  final String message;
  UpdateCheckError(this.message);
}
