import 'package:bitpulse/Features/HomeFeature/Presentation/View/components/settingsComponents/theme_widget.dart';
import 'package:bitpulse/core/Themes/theme.dart';
import 'package:bitpulse/core/Themes/theme_cubit.dart';
import 'package:bitpulse/core/l10n/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ThemeSelectorWidget extends StatelessWidget {
  const ThemeSelectorWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final themeDescriptions = [
      AppLocalizations.of(context).Default_Desc,
      AppLocalizations.of(context).Bitcoin_Orange_Desc,
      AppLocalizations.of(context).Ethereum_Blue_Desc,
      AppLocalizations.of(context).Classic_Dark_Desc,
      AppLocalizations.of(context).Minimal_Light_Desc,
      AppLocalizations.of(context).purple_crypto_Desc,
    ];
    // Static keys (non-translated) in canonical order
    final List<String> staticThemeKeys = [
      'Default',
      'Bitcoin Orange',
      'Ethereum Blue',
      'Classic Dark',
      'Minimal Light',
      'Purple Crypto',
    ];
    // Localized display names in the same order as staticThemeKeys
    final List<String> localizedThemeNames = [
      AppLocalizations.of(context).Default,
      AppLocalizations.of(context).Bitcoin_Orange,
      AppLocalizations.of(context).Ethereum_Blue,
      AppLocalizations.of(context).Classic_Dark,
      AppLocalizations.of(context).Minimal_Light,
      AppLocalizations.of(context).purple_crypto,
    ];

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Section Header
            Row(
              children: [
                Icon(Icons.palette, color: Theme.of(context).primaryColor),
                const SizedBox(width: 8),
                Text(
                  AppLocalizations.of(context).App_Theme,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),

            const SizedBox(height: 16),

            // Debug info
            BlocBuilder<ThemeCubit, ThemeState>(
              builder: (context, state) {
                print(
                  'ThemeSelector BlocBuilder rebuilt with: ${state.themeName}',
                );
                return Text(
                  '${AppLocalizations.of(context).Current}: ${state.themeName}',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey[600],
                    fontStyle: FontStyle.italic,
                  ),
                );
              },
            ),

            const SizedBox(height: 8),

            // Theme Options
            BlocBuilder<ThemeCubit, ThemeState>(
              builder: (context, state) {
                print('Theme options building for: ${state.themeName}');
                return Column(
                  children: AppThemes.getAllThemes(context).entries.map((
                    entry,
                  ) {
                    // Static key to be saved/sent to cubit
                    final staticKey = entry.key;
                    final themeData = entry.value;
                    final index = staticThemeKeys.indexOf(staticKey);

                    // Localized display name and description for UI
                    final displayName =
                        (index >= 0 && index < localizedThemeNames.length)
                        ? localizedThemeNames[index]
                        : staticKey;
                    final themeDescription =
                        (index >= 0 && index < themeDescriptions.length)
                        ? themeDescriptions[index]
                        : '';

                    // Selection: be robust if a localized name was previously saved
                    final normalizedFromState = AppThemes.getThemeByName(
                      state.themeName,
                    );
                    final isSelected =
                        identical(normalizedFromState, themeData) ||
                        state.themeName.toLowerCase() ==
                            staticKey.toLowerCase();

                    return ThemeWidget(
                      context: context,
                      themeName: displayName,
                      themeDescription: themeDescription,
                      themeData: themeData,
                      isSelected: isSelected,
                      onTap: () async {
                        await context.read<ThemeCubit>().changeTheme(staticKey);
                      },
                    );
                  }).toList(),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
