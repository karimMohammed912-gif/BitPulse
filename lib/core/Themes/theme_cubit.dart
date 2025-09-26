import 'package:bitpulse/core/Themes/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';

// Theme States
sealed class ThemeState {
  final ThemeData themeData;
  final String themeName;

  const ThemeState({required this.themeData, required this.themeName});

  @override
  String toString() => 'ThemeState(themeName: $themeName)';
}

class ThemeInitial extends ThemeState {
  const ThemeInitial({required super.themeData, required super.themeName});

  @override
  String toString() => 'ThemeInitial(themeName: $themeName)';
}

class ThemeChanged extends ThemeState {
  const ThemeChanged({required super.themeData, required super.themeName});

  @override
  String toString() => 'ThemeChanged(themeName: $themeName)';
}

// Theme Cubit using Hive
class ThemeCubit extends Cubit<ThemeState> {
  static const String _boxName = 'settings';
  static const String _themeKey = 'selected_theme';

  ThemeCubit()
    : super(ThemeInitial(themeData: AppThemes.main, themeName: 'Default')) {
    _loadSavedTheme();
  }

  // Load saved theme from Hive
  Future<void> _loadSavedTheme() async {
    try {
      final box = await Hive.openBox(_boxName);
      final savedTheme = box.get(_themeKey, defaultValue: 'Default') as String;

      final themeData = AppThemes.getThemeByName(savedTheme);

      emit(ThemeChanged(themeData: themeData, themeName: savedTheme));
    } catch (e) {
      emit(ThemeChanged(themeData: AppThemes.main, themeName: 'Default'));
    }
  }

  // Change theme and save to Hive
  Future<void> changeTheme(String themeName) async {
    try {
      final themeData = AppThemes.getThemeByName(themeName);

      // Save to Hive first
      final box = await Hive.openBox(_boxName);
      await box.put(_themeKey, themeName);

      // Emit new state
      emit( ThemeChanged(themeData: themeData, themeName: themeName));
    } catch (e) {
      print('Error changing theme: $e');
    }
  }

  // Get all available themes
  Map<String, ThemeData> get availableThemes => AppThemes.getAllThemes();

  // Get current theme name
  String get currentThemeName {
    return state.themeName;
  }

  // Clear theme settings (for logout)
  Future<void> clearThemeSettings() async {
    try {
      final box = await Hive.openBox(_boxName);
      await box.delete(_themeKey);
    } catch (e) {
      print(e);
    }
  }

  @override
  void emit(ThemeState state) {
    super.emit(state);
  }

  String getThemeDescription(String themeName) {
    switch (themeName) {
      case 'Default':
        return 'Professional green theme';
      case 'Bitcoin Orange':
        return 'Classic Bitcoin orange colors';
      case 'Ethereum Blue':
        return 'Ethereum-inspired blue theme';
      case 'Classic Dark':
        return 'Material design dark theme';
      case 'Minimal Light':
        return 'Clean and minimal light theme';
      case 'Purple Crypto':
        return 'Modern purple crypto theme';
      default:
        return 'Custom theme';
    }
  }
}
