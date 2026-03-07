part of 'settings_cubit.dart';

@immutable
class SettingsState extends Equatable {
  final bool isDarkMode;
  final String languageCode;
  final bool areNotificationsEnabled;
  final int themeIndex;
  const SettingsState({
    this.isDarkMode = false,
    this.languageCode = 'en',
    this.areNotificationsEnabled = true,
    this.themeIndex = 0,
  });

  SettingsState copyWith({
    bool? isDarkMode,
    String? languageCode,
    bool? areNotificationsEnabled,
    int? themeIndex,
  }) {
    return SettingsState(
      isDarkMode: isDarkMode ?? this.isDarkMode,
      languageCode: languageCode ?? this.languageCode,
      areNotificationsEnabled:
          areNotificationsEnabled ?? this.areNotificationsEnabled,
      themeIndex: themeIndex ?? this.themeIndex,
    );
  }

  @override
  List<Object> get props => [
    isDarkMode,
    languageCode,
    areNotificationsEnabled,
    themeIndex,
  ];
}
