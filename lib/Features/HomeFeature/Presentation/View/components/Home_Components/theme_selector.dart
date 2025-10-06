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
                  children: AppThemes.getAllThemes().entries.map((entry) {
                    final themeName = entry.key;
                    final themeData = entry.value;
                    final isSelected = state.themeName == themeName;

                    return ThemeWidget(
                      context: context,
                      themeName: themeName,
                      themeData: themeData,
                      isSelected: isSelected,
                      onTap: () async {
                        await context.read<ThemeCubit>().changeTheme(themeName);
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
