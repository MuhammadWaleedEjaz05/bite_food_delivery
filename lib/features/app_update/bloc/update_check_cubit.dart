import 'package:bite_food_delivery/features/app_update/bloc/update_check_state.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:package_info_plus/package_info_plus.dart';

class UpdateCheckCubit extends Cubit<UpdateCheckState> {
  final FirebaseRemoteConfig? _remoteConfig;

  UpdateCheckCubit({FirebaseRemoteConfig? remoteConfig})
    : _remoteConfig = remoteConfig,
      super(const UpdateCheckInitial()) {
    checkForUpdate();
  }

  Future<String> _getCurrentAppVersion() async {
    try {
      final packageInfo = await PackageInfo.fromPlatform();
      return packageInfo.version;
    } catch (_) {
      return '1.0.0';
    }
  }

  Future<void> checkForUpdate() async {
    emit(const UpdateCheckLoading());
    try {
      final config = _remoteConfig ?? FirebaseRemoteConfig.instance;
      await config.setConfigSettings(
        RemoteConfigSettings(
          fetchTimeout: const Duration(seconds: 10),
          minimumFetchInterval: const Duration(seconds: 10),
        ),
      );
      await config.fetchAndActivate();

      final latestVersionRaw = config.getString('app_version');
      final latestVersion = latestVersionRaw.trim();
      final currentVersion = (await _getCurrentAppVersion()).trim();

      final resolvedVersion = latestVersion.isNotEmpty
          ? latestVersion
          : currentVersion;
      final updateUrl = config.getString('update_url');

      bool shouldUpdate() {
        try {
          final curParts = currentVersion.split('.').map(int.parse).toList();
          final latParts = resolvedVersion.split('.').map(int.parse).toList();
          for (var i = 0; i < curParts.length && i < latParts.length; i++) {
            if (latParts[i] > curParts[i]) return true;
            if (latParts[i] < curParts[i]) return false;
          }
          return latParts.length > curParts.length;
        } catch (_) {
          return currentVersion != resolvedVersion;
        }
      }

      if (shouldUpdate()) {
        emit(
          UpdateRequired(latestVersion: resolvedVersion, updateUrl: updateUrl),
        );
      } else {
        emit(const UpdateNotRequired());
      }
    } catch (e) {
      emit(UpdateCheckError(e.toString()));
    }
  }
}
