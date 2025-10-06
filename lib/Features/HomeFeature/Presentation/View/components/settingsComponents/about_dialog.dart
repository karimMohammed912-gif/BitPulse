import 'package:bitpulse/core/l10n/generated/l10n.dart';
import 'package:flutter/material.dart';

class AboutDialogWidget extends StatelessWidget {
  const AboutDialogWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('About BitPulse'),
      content:  Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(AppLocalizations.of(context).Version),
          SizedBox(height: 8),
          Text(AppLocalizations.of(context).Build),
            SizedBox(height: 8),
            Text(AppLocalizations.of(context).Bitpulse_is)
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child:  Text(AppLocalizations.of(context).OK),
        ),
      ],
    );
  }
}
