import 'package:bloc/bloc.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:meta/meta.dart';
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
          minimumFetchInterval: const Duration(minutes: 5),
        ),
      );
      await remoteConfig.fetchAndActivate();

      final latestVersion = remoteConfig.getString('app_version');
      final currentVersion = await _getCurrentAppVersion();

      final resolvedVersion = latestVersion.isNotEmpty
          ? latestVersion
          : currentVersion;
      const updateUrl = "https://example.com/update";

      if (currentVersion != resolvedVersion) {
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
