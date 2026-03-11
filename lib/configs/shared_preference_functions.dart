import 'package:shared_preferences/shared_preferences.dart';

late SharedPreferences _prefs;

Future<void> initSharedPreferences() async {
  _prefs = await SharedPreferences.getInstance();
}

void saveToSharedPreferenceString(String key, String value) {
  _prefs.setString(key, value);
}

String? getFromSharedPreferenceString(String key) {
  return _prefs.getString(key);
}

void saveToSharedPreferencebool(String key, bool value) {
  _prefs.setBool(key, value);
}

bool? getFromSharedPreferencebool(String key) {
  return _prefs.getBool(key);
}

void saveToSharedPreferenceInt(String key, int value) {
  _prefs.setInt(key, value);
}

int? getFromSharedPreferenceInt(String key) {
  return _prefs.getInt(key);
}
