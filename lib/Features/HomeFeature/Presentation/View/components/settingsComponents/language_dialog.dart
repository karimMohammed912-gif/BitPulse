import 'package:flutter/material.dart';

class LanguageDialog extends StatelessWidget {
  const LanguageDialog({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Select Language'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            title: const Text('English'),
            leading: const Icon(Icons.check, color: Colors.green),
            onTap: () => Navigator.of(context).pop(),
          ),
             ListTile(
            title: const Text('Arabic'),
            subtitle: const Text('Coming soon'),
            enabled: false,
            onTap: () => Navigator.of(context).pop(),
          ),
          ListTile(
            title: const Text('Spanish'),
            subtitle: const Text('Coming soon'),
            enabled: false,
            onTap: () => Navigator.of(context).pop(),
          ),
          ListTile(
            title: const Text('German'),
            subtitle: const Text('Coming soon'),
            enabled: false,
            onTap: () => Navigator.of(context).pop(),
          ),
          ListTile(
            title: const Text('japanese'),
            subtitle: const Text('Coming soon'),
            enabled: false,
            onTap: () => Navigator.of(context).pop(),
          ),
       
          ListTile(
            title: const Text('French'),
            subtitle: const Text('Coming soon'),
            enabled: false,
            onTap: () => Navigator.of(context).pop(),
          ),
        ],
      ),
    );
  }
}
