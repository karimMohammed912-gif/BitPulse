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
      title: const Text('Clear All Data'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            'This will reset the app to default settings and clear all data. This action cannot be undone.',
          ),
          if (_isClearing) ...[
            const SizedBox(height: 16),
            const Row(
              children: [
                SizedBox(
                  width: 20,
                  height: 20,
                  child: CircularProgressIndicator(strokeWidth: 2),
                ),
                SizedBox(width: 12),
                Text('Clearing data...'),
              ],
            ),
          ],
        ],
      ),
      actions: [
        TextButton(
          onPressed: _isClearing ? null : () => Navigator.of(context).pop(),
          child: const Text('Cancel'),
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
                  SnackBar(content: Text('Error: $e')),
                );
              }
            }
          },
          child: const Text('Clear All', style: TextStyle(color: Colors.red)),
        ),
      ],
    );
  }
}
