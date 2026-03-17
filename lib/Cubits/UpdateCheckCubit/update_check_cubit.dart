import 'package:bloc/bloc.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';

part 'update_check_state.dart';

class UpdateCheckCubit extends Cubit<UpdateCheckState> {
  UpdateCheckCubit() : super(UpdateCheckInitial()) {
    checkForUpdate();
  }

  final FirebaseRemoteConfig remoteConfig = FirebaseRemoteConfig.instance;

  Future<String> _getCurrentAppVersion() async {
    final packageInfo = await PackageInfo.fromPlatform();
    return packageInfo.version;
  }

  Future<void> checkForUpdate() async {
    emit(UpdateCheckLoading());
    try {
      await remoteConfig.setConfigSettings(
        RemoteConfigSettings(
          fetchTimeout: const Duration(seconds: 10),
          minimumFetchInterval: const Duration(seconds: 10),
        ),
      );
      await remoteConfig.fetchAndActivate();

      final latestVersionRaw = remoteConfig.getString('app_version');
      final latestVersion = latestVersionRaw.trim();
      final currentVersion = (await _getCurrentAppVersion()).trim();
      debugPrint('Current version: $currentVersion, Latest version: $latestVersion');

      final resolvedVersion = latestVersion.isNotEmpty
          ? latestVersion
          : currentVersion;
      final updateUrl = remoteConfig.getString('update_url');
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
        emit(UpdateNotRequired());
      }
    } catch (e) {
      emit(UpdateCheckError(e.toString()));
    }
  }
}
