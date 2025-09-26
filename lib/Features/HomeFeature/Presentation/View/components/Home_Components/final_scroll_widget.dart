import 'package:flutter/material.dart';

class FinalScrollWidget extends StatelessWidget {
  const FinalScrollWidget({
    super.key,
    required this.cryptoDatalength,
  });

  final int cryptoDatalength;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Center(
          child: Column(
            children: [
              Icon(
                Icons.check_circle_outline,
                color: Colors.grey[400],
                size: 32,
              ),
              const SizedBox(height: 8),
              Text(
                'All $cryptoDatalength cryptocurrencies loaded',
                style: TextStyle(color: Colors.grey[600], fontSize: 14),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
