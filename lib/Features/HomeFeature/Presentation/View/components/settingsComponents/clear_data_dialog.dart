import 'package:bitpulse/core/l10n/generated/l10n.dart';
import 'package:flutter/material.dart';

class ClearDataDialog extends StatefulWidget {
  final Future<void> Function() onClearAll;

  const ClearDataDialog({
    super.key,
    required this.onClearAll,
  });

  @override
  State<ClearDataDialog> createState() => _ClearDataDialogState();
}

class _ClearDataDialogState extends State<ClearDataDialog> {
  bool _isClearing = false;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title:  Text(AppLocalizations.of(context).Clear_All_Data),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
           Text(
            AppLocalizations.of(context).this_will_reset_the_app_to_default_settings_and_clear_all_data_this_action_cannot_be_undone,
          ),
          if (_isClearing) ...[
            const SizedBox(height: 16),
             Row(
              children: [
                SizedBox(
                  width: 20,
                  height: 20,
                  child: CircularProgressIndicator(strokeWidth: 2),
                ),
                SizedBox(width: 12),
                Text(AppLocalizations.of(context).Clearing_data),
              ],
            ),
          ],
        ],
      ),
      actions: [
        TextButton(
          onPressed: _isClearing ? null : () => Navigator.of(context).pop(),
          child:  Text(AppLocalizations.of(context).cancel),
        ),
        TextButton(
          onPressed: _isClearing ? null : () async {
            setState(() => _isClearing = true);
            try {
              await widget.onClearAll();
              if (mounted) {
                Navigator.of(context).pop();
              }
            } catch (e) {
              if (mounted) {
                setState(() => _isClearing = false);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(AppLocalizations.of(context).Error_ + e.toString())),
                );
              }
            }
          },
          child:  Text(AppLocalizations.of(context).Clear_All, style: TextStyle(color: Colors.red)),
        ),
      ],
    );
  }
}
