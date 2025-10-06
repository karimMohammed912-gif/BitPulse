import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:bitpulse/core/l10n/generated/l10n.dart';

class LocaleState {
  final Locale locale;
  const LocaleState(this.locale);
}

class LocaleCubit extends Cubit<LocaleState> {
  LocaleCubit() : super(const LocaleState(Locale('en')));

  void setLocale(Locale locale) {
    final List<Locale> supported = AppLocalizations.delegate.supportedLocales;
    final bool isSupported = supported.any(
      (Locale supportedLocale) => supportedLocale.languageCode == locale.languageCode,
    );
    if (!isSupported) return;
    emit(LocaleState(locale));
  }
}

