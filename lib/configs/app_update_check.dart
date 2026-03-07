import 'package:package_info_plus/package_info_plus.dart';

Future<String> getAppVersion() async {
  try {
    final packageInfo = await PackageInfo.fromPlatform();
    return 'v${packageInfo.version}+${packageInfo.buildNumber}';
  } catch (e) {
    return 'Version info not available';
  }
}
