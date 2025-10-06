import 'package:bitpulse/core/l10n/generated/l10n.dart';
import 'package:bitpulse/core/widgets/custom_toast.dart';
import 'package:flutter/material.dart';

class ClearCacheDialog extends StatelessWidget {
  const ClearCacheDialog({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title:  Text(AppLocalizations.of(context).clear_cache),
      content: const Text('This will clear cached data but keep your settings and favorites.'),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: () async {
            Navigator.of(context).pop();
            // Clear cache logic here
            buildSuccesMessage(context, AppLocalizations.of(context).Cache_cleared_successfully);
          },
          child:  Text(AppLocalizations.of(context).Clear_All),
        ),
      ],
    );
  }
}
