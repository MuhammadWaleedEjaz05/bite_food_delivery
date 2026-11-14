import 'package:bite_food_delivery/features/settings/bloc/settings_state.dart';
import 'package:bite_food_delivery/core/utils/shared_preference_functions.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

export 'settings_state.dart';

class SettingsCubit extends Cubit<SettingsState> {
  SettingsCubit() : super(const SettingsState()) {
    _loadSettings();
  }

  Future<void> _loadSettings() async {
    final isDarkMode = getFromSharedPreferencebool('isDarkMode') ?? false;
    final languageCode = getFromSharedPreferenceString('languageCode') ?? 'en';
    final areNotificationsEnabled =
        getFromSharedPreferencebool('areNotificationsEnabled') ?? true;
    final themeIndex = getFromSharedPreferenceInt('themeIndex') ?? 0;

    emit(
      SettingsState(
        isDarkMode: isDarkMode,
        languageCode: languageCode,
        areNotificationsEnabled: areNotificationsEnabled,
        themeIndex: themeIndex,
      ),
    );
  }

  void toggleDarkMode(bool isDarkMode) {
    saveToSharedPreferencebool('isDarkMode', isDarkMode);
    emit(state.copyWith(isDarkMode: isDarkMode));
  }

  void changeLanguage(String languageCode) {
    saveToSharedPreferenceString('languageCode', languageCode);
    emit(state.copyWith(languageCode: languageCode));
  }

  void toggleNotifications(bool areEnabled) {
    saveToSharedPreferencebool('areNotificationsEnabled', areEnabled);
    emit(state.copyWith(areNotificationsEnabled: areEnabled));
  }

  void changeTheme(int themeIndex) {
    saveToSharedPreferenceInt('themeIndex', themeIndex);
    emit(state.copyWith(themeIndex: themeIndex));
  }
}
