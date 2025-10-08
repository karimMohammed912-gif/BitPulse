import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:bitpulse/core/l10n/generated/l10n.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocaleState {
  final Locale locale;
  const LocaleState(this.locale);
}

class LocaleCubit extends Cubit<LocaleState> {
  static const String _prefsKey = 'selected_locale_code';

  LocaleCubit() : super(const LocaleState(Locale('en')));

  Future<void> loadSavedLocale() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? code = prefs.getString(_prefsKey);
    if (code == null) return;
    setLocale(Locale(code));
  }

  Future<void> setLocale(Locale locale) async {
    final List<Locale> supported = AppLocalizations.delegate.supportedLocales;
    final bool isSupported = supported.any(
      (Locale supportedLocale) => supportedLocale.languageCode == locale.languageCode,
    );
    if (!isSupported) return;
    emit(LocaleState(locale));
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(_prefsKey, locale.languageCode);
  }
}

