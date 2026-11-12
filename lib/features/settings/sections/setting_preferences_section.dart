import 'package:bite_food_delivery/app/theme/app_text_styles.dart';
import 'package:bite_food_delivery/core/extensions/responsive_extensions.dart';
import 'package:bite_food_delivery/core/extensions/theme_extensions.dart';
import 'package:bite_food_delivery/features/settings/bloc/settings_cubit.dart';
import 'package:bite_food_delivery/features/settings/widgets/setting_tile.dart';
import 'package:bite_food_delivery/l10n/app_localizations.dart';
import 'package:bite_food_delivery/widgets/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SettingPreferencesSection extends StatelessWidget {
  const SettingPreferencesSection({super.key});

  static const _supportedLanguages = [
    {'code': 'en', 'name': 'English'},
    {'code': 'ur', 'name': 'اردو'},
    {'code': 'ar', 'name': 'العربية'},
    {'code': 'de', 'name': 'Deutsch'},
    {'code': 'es', 'name': 'Español'},
    {'code': 'tr', 'name': 'Türkçe'},
  ];

  @override
  Widget build(BuildContext context) {
    final colors = context.appColors;
    final t = AppLocalizations.of(context)!;
    final cubit = context.read<SettingsCubit>();

    return SliverPadding(
      padding: context.contentInsets(bottom: 20),
      sliver: SliverToBoxAdapter(
        child: Container(
          decoration: BoxDecoration(
            color: colors.surfaceContainerLow,
            borderRadius: BorderRadius.circular(20).r,
            border: Border.all(color: colors.outlineVariant, width: 1),
          ),
          child: BlocBuilder<SettingsCubit, SettingsState>(
            builder: (context, state) {
              final currentLang = _supportedLanguages.firstWhere(
                (l) => l['code'] == state.languageCode,
                orElse: () => _supportedLanguages.first,
              )['name'];

              return Column(
                children: [
                  SettingTile(
                    icon: Icons.dark_mode_outlined,
                    title: t.darkMode,
                    trailing: Switch.adaptive(
                      value: state.isDarkMode,
                      onChanged: cubit.toggleDarkMode,
                    ),
                  ),
                  Divider(color: colors.outlineVariant, height: 1),
                  SettingTile(
                    icon: Icons.notifications_active_outlined,
                    title: t.notifications,
                    trailing: Switch.adaptive(
                      value: state.areNotificationsEnabled,
                      onChanged: cubit.toggleNotifications,
                    ),
                  ),
                  Divider(color: colors.outlineVariant, height: 1),
                  SettingTile(
                    icon: Icons.language_rounded,
                    title: t.language,
                    subtitle: currentLang,
                    trailing: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        value: state.languageCode,
                        icon: const Icon(Icons.arrow_drop_down),
                        items: _supportedLanguages
                            .map(
                              (lang) => DropdownMenuItem<String>(
                                value: lang['code'],
                                child: AppText(
                                  lang['name']!,
                                  style: AppTextStyles.bodyMedium(context),
                                ),
                              ),
                            )
                            .toList(),
                        onChanged: (code) {
                          if (code != null) cubit.changeLanguage(code);
                        },
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
