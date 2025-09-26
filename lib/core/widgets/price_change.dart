import 'package:flutter/material.dart';

class PriceChange extends StatelessWidget {
  const PriceChange({
    super.key,
    required this.crypto,
  });

  final double? crypto;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      decoration: BoxDecoration(
        color: (crypto ?? 0) >= 0
            ? Colors.green
            : Colors.red,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        '${(crypto ?? 0) >= 0 ? '+' : ''}${crypto?.toStringAsFixed(1) ?? '0.0'}%',
        style: const TextStyle(
          fontSize: 10,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    );
  }
}
