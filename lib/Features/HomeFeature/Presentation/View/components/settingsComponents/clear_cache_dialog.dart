import 'package:bitpulse/core/widgets/custom_toast.dart';
import 'package:flutter/material.dart';

class ClearCacheDialog extends StatelessWidget {
  const ClearCacheDialog({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Clear Cache'),
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
            buildSuccesMessage(context, 'Cache cleared successfully');
          },
          child: const Text('Clear'),
        ),
      ],
    );
  }
}
