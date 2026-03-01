import 'package:bite_food_delivery/configs/shared_preference_fucntions.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'settings_state.dart';

class SettingsCubit extends Cubit<SettingsState> {
  SettingsCubit() : super(const SettingsState()) {
    _loadSettings();
  }

  Future<void> _loadSettings() async {
    final prefs = await sharedPreference;
    final isDarkMode = prefs.getBool('isDarkMode') ?? false;
    final languageCode = prefs.getString('languageCode') ?? 'en';
    final areNotificationsEnabled =
        prefs.getBool('areNotificationsEnabled') ?? true;

    emit(
      SettingsState(
        isDarkMode: isDarkMode,
        languageCode: languageCode,
        areNotificationsEnabled: areNotificationsEnabled,
      ),
    );
  }

  void toggleDarkMode(bool isDarkMode) {
    sharedPreference.then((prefs) {
      prefs.setBool('isDarkMode', isDarkMode);
    });
    emit(state.copyWith(isDarkMode: isDarkMode));
  }

  void changeLanguage(String languageCode) {
    sharedPreference.then((prefs) {
      prefs.setString('languageCode', languageCode);
    });
    emit(state.copyWith(languageCode: languageCode));
  }

  void toggleNotifications(bool areEnabled) {
    sharedPreference.then((prefs) {
      prefs.setBool('areNotificationsEnabled', areEnabled);
    });
    emit(state.copyWith(areNotificationsEnabled: areEnabled));
  }
}
