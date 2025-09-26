import 'package:flutter/material.dart';

extension ThemeExtension on BuildContext {
  ColorScheme get colors => Theme.of(this).colorScheme;
  TextTheme get textTheme => Theme.of(this).textTheme;
  
  // Quick access to common colors
  Color get primaryColor => colors.primary;
  Color get surfaceColor => colors.surface;
  Color get backgroundColor => colors.surface;
  Color get textColor => colors.onSurface;
  Color get secondaryTextColor => colors.onSurface.withOpacity(0.7);
  
  // Quick access to text styles
  TextStyle? get headline => textTheme.headlineMedium;
  TextStyle? get title => textTheme.titleMedium;
  TextStyle? get body => textTheme.bodyMedium;
  TextStyle? get caption => textTheme.bodySmall;
}