part of 'settings_cubit.dart';

@immutable
class SettingsState extends Equatable {
  final bool isDarkMode;
  final String languageCode;
  final bool areNotificationsEnabled;

  const SettingsState({
    this.isDarkMode = false,
    this.languageCode = 'en',
    this.areNotificationsEnabled = true,
  });

  SettingsState copyWith({
    bool? isDarkMode,
    String? languageCode,
    bool? areNotificationsEnabled,
  }) {
    return SettingsState(
      isDarkMode: isDarkMode ?? this.isDarkMode,
      languageCode: languageCode ?? this.languageCode,
      areNotificationsEnabled:
          areNotificationsEnabled ?? this.areNotificationsEnabled,
    );
  }

  @override
  List<Object> get props => [isDarkMode, languageCode, areNotificationsEnabled];
}
