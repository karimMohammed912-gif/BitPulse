import 'package:bitpulse/core/Localization/locale_cubit.dart';
import 'package:flutter/material.dart';
import 'package:bitpulse/core/l10n/generated/l10n.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LanguageDialog extends StatelessWidget {
  const LanguageDialog({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LocaleCubit, LocaleState>(
      builder: (context, state) {
        return AlertDialog(
          title: Text(AppLocalizations.current.Select_Language),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              for (final locale in AppLocalizations.delegate.supportedLocales)
                ListTile(
                  title: Text(_languageName(locale, context)),
                  leading: state.locale.languageCode == locale.languageCode
                      ? const Icon(Icons.check, color: Colors.green)
                      : const SizedBox(width: 24),
                  onTap: () {
                    context.read<LocaleCubit>().setLocale(locale);
                    Navigator.of(context).pop();
                  },
                ),
            ],
          ),
        );
      },
    );
  }
}

String _languageName(Locale locale, BuildContext context) {
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizations.current.english;
    case 'ar':
      return 'العربية';
    case 'de':
      return AppLocalizations.current.german;
    case 'es':
      return AppLocalizations.current.spanish;
    case 'fr':
      return AppLocalizations.current.french;
    case 'ja':
      return AppLocalizations.current.japanese;
    default:
      return locale.languageCode;
  }
}
