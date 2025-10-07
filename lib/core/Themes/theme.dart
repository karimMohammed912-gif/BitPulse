import 'package:bitpulse/core/l10n/generated/l10n.dart';
import 'package:flutter/material.dart';

class AppThemes {
  // --- 1. Default Green Theme ---
  static final ThemeData main = ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: Colors.green[50], // Light green background
    primaryColor: Colors.green,
    colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.green,
      brightness: Brightness.light,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.green,
      foregroundColor: Colors.white,
      elevation: 0,
    ),
    cardTheme: CardThemeData(
      color: Colors.white,
      elevation: 2,
    ),
    useMaterial3: true,
  );

  // --- 2. Bitcoin Orange Theme ---
  static final ThemeData bitcoinTheme = ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: Colors.orange[50], // Light orange background
    primaryColor: const Color(0xFFF7931A),
    colorScheme: const ColorScheme.light(
      primary: Color(0xFFF7931A),
      onPrimary: Colors.white,
      secondary: Color(0xFF4A4A4A),
      surface: Colors.white,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xFFF7931A),
      foregroundColor: Colors.white,
      elevation: 0,
    ),
    cardTheme: CardThemeData(
      color: Colors.orange[100],
      elevation: 2,
    ),
    useMaterial3: true,
  );

  // --- 3. Ethereum Blue Theme ---
  static final ThemeData ethereumTheme = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: const Color(0xFF1E1E1E), // Dark background
    primaryColor: const Color(0xFF627EEA),
    colorScheme: const ColorScheme.dark(
      primary: Color(0xFF627EEA),
      onPrimary: Colors.white,
      secondary: Color(0xFF8C92AC),
      surface: Color(0xFF2A2A2A),
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xFF627EEA), // Blue app bar
      foregroundColor: Colors.white,
      elevation: 0,
    ),
    cardTheme: const CardThemeData(
      color: Color(0xFF2A2A2A),
      elevation: 2,
    ),
    useMaterial3: true,
  );

  // --- 4. Classic Dark Theme ---
  static final ThemeData classicDarkTheme = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: const Color(0xFF121212), // Very dark
    primaryColor: const Color(0xFF00BCD4),
    colorScheme: const ColorScheme.dark(
      primary: Color(0xFF00BCD4),
      onPrimary: Colors.black,
      secondary: Color(0xFF03DAC6),
      surface: Color(0xFF1E1E1E),
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xFF00BCD4), // Cyan app bar
      foregroundColor: Colors.black,
      elevation: 0,
    ),
    cardTheme: const CardThemeData(
      color: Color(0xFF1E1E1E),
      elevation: 2,
    ),
    useMaterial3: true,
  );

  // --- 5. Minimal Light Theme ---
  static final ThemeData minimalLightTheme = ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: const Color(0xFFFAFAFA), // Very light gray
    primaryColor: const Color(0xFF2E3440),
    colorScheme: const ColorScheme.light(
      primary: Color(0xFF2E3440),
      onPrimary: Colors.white,
      secondary: Color(0xFF5E81AC),
      surface: Colors.white,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xFF2E3440), // Dark blue-gray app bar
      foregroundColor: Colors.white,
      elevation: 1,
    ),
    cardTheme: const CardThemeData(
      color: Colors.white,
      elevation: 1,
    ),
    useMaterial3: true,
  );

  // --- 6. Purple Crypto Theme ---
  static final ThemeData purpleCryptoTheme = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: const Color(0xFF0D1117), // GitHub dark
    primaryColor: const Color(0xFF8B5CF6),
    colorScheme: const ColorScheme.dark(
      primary: Color(0xFF8B5CF6),
      onPrimary: Colors.white,
      secondary: Color(0xFFA855F7),
      surface: Color(0xFF161B22),
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xFF8B5CF6), // Purple app bar
      foregroundColor: Colors.white,
      elevation: 0,
    ),
    cardTheme:  CardThemeData(
      color: Color(0xFF161B22),
      elevation: 2,
    ),
    useMaterial3: true,
  );

  // --- Theme Selection Helper ---
  static ThemeData getThemeByName(String themeName) {
    switch (themeName.toLowerCase()) {
      case 'main':
      case 'default':
        return main;
      case 'bitcoin':
      case 'bitcoin orange':
        return bitcoinTheme;
      case 'ethereum':
      case 'ethereum blue':
        return ethereumTheme;
      case 'dark':
      case 'classic dark':
        return classicDarkTheme;
      case 'light':
      case 'minimal light':
        return minimalLightTheme;
      case 'purple':
      case 'purple crypto':
        return purpleCryptoTheme;
      default:
        return main;
    }
  }  static List<String> getThemeNames(BuildContext context) {

    return [
     AppLocalizations.of(context).Default,
     AppLocalizations.of(context).Bitcoin_Orange,
     AppLocalizations.of(context).Ethereum_Blue,
     AppLocalizations.of(context).Classic_Dark,
     AppLocalizations.of(context).Minimal_Light,
     AppLocalizations.of(context).purple_crypto,
    ];
  }

  // --- Get All Available Themes ---
  static Map<String, ThemeData> getAllThemes(BuildContext context) {
    // Use static, non-translated keys for identification
    return {
      'Default': main,
      'Bitcoin Orange': bitcoinTheme,
      'Ethereum Blue': ethereumTheme,
      'Classic Dark': classicDarkTheme,
      'Minimal Light': minimalLightTheme,
      'Purple Crypto': purpleCryptoTheme,
    };
  }

  // --- Theme Names List ---

}

