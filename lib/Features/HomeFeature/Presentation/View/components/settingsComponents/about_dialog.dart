import 'package:flutter/material.dart';

class AboutDialogWidget extends StatelessWidget {
  const AboutDialogWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('About BitPulse'),
      content: const Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Version: 1.0.0'),
          SizedBox(height: 8),
          Text('Build: 001'),
          SizedBox(height: 8),
          Text('BitPulse is a cryptocurrency tracking app that helps you monitor your favorite coins and stay updated with market trends.'),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('OK'),
        ),
      ],
    );
  }
}
