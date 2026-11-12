import 'package:flutter/foundation.dart';

@immutable
sealed class UpdateCheckState {
  const UpdateCheckState();
}

final class UpdateCheckInitial extends UpdateCheckState {
  const UpdateCheckInitial();
}

final class UpdateCheckLoading extends UpdateCheckState {
  const UpdateCheckLoading();
}

final class UpdateRequired extends UpdateCheckState {
  final String latestVersion;
  final String updateUrl;

  const UpdateRequired({required this.latestVersion, required this.updateUrl});
}

final class UpdateNotRequired extends UpdateCheckState {
  const UpdateNotRequired();
}

final class UpdateCheckError extends UpdateCheckState {
  final String message;
  const UpdateCheckError(this.message);
}
