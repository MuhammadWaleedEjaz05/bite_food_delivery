import 'package:shared_preferences/shared_preferences.dart';

Future<SharedPreferences> get sharedPreference async =>
    await SharedPreferences.getInstance();

void saveToSharedPreferenceString(String key, String value) async {
  final SharedPreferences prefs = await sharedPreference;
  await prefs.setString(key, value);
}

Future<String?> getFromSharedPreferenceString(String key) async {
  final SharedPreferences prefs = await sharedPreference;
  return prefs.getString(key);
}

void saveToSharedPreferencebool(String key, bool value) async {
  final SharedPreferences prefs = await sharedPreference;
  await prefs.setBool(key, value);
}

Future<bool?> getFromSharedPreferencebool(String key) async {
  final SharedPreferences prefs = await sharedPreference;
  return prefs.getBool(key);
}
