import 'package:bitpulse/Features/HomeFeature/Presentation/View/components/settingsComponents/about_dialog.dart';
import 'package:bitpulse/Features/HomeFeature/Presentation/View/components/settingsComponents/language_dialog.dart';
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
            title: const Text('Language'),
            subtitle: const Text('English'),
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
            title: const Text('About'),
            subtitle: const Text('App version & info'),
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
