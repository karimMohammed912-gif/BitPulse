import 'package:flutter/material.dart';

class BuildEmptyState extends StatelessWidget {
  const BuildEmptyState({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.hourglass_empty,
            size: 50,
            color: Colors.grey.withOpacity(0.5),
          ),
          const SizedBox(height: 16),
          Text(
            'No items found',
            style: TextStyle(
              fontSize: 18,
              color: Colors.grey.withOpacity(0.7),
            ),
          ),
        ],
      ),
    );
  }
}