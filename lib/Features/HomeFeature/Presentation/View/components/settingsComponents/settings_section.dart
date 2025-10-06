import 'package:bitpulse/Features/HomeFeature/Presentation/View/components/settingsComponents/about_dialog.dart';
import 'package:bitpulse/Features/HomeFeature/Presentation/View/components/settingsComponents/language_dialog.dart';
import 'package:bitpulse/core/l10n/generated/l10n.dart';
import 'package:flutter/material.dart';


class SettingsSection extends StatelessWidget {
  const SettingsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
         

          ListTile(
            leading: const Icon(Icons.language),
            title: Text(AppLocalizations.of(context).Select_Language),
            subtitle: Text(Localizations.localeOf(context).languageCode),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () {
              showDialog(
                context: context,
                builder: (BuildContext dialogContext) {
                  return LanguageDialog();
                },
              );
            },
          ),
          const Divider(height: 1),
          ListTile(
            leading: const Icon(Icons.info),
            title:  Text(AppLocalizations.of(context).about),
            subtitle:  Text(AppLocalizations.of(context).app_version),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () {
              showDialog(
                context: context,
                builder: (BuildContext dialogContext) {
                  return AboutDialogWidget();
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
