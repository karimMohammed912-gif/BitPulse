import 'package:flutter/material.dart';

class ExchangeResultWidget extends StatelessWidget {

  const ExchangeResultWidget({
    super.key, required this.exchangedAmount, this.toCurrency,
  });
final double exchangedAmount;
final toCurrency ; // Placeholder for toCurrency

 // Placeholder for exchanged amount
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const Icon(
              Icons.check_circle,
              color: Colors.green,
              size: 32,
            ),
            const SizedBox(height: 8),
            Text(
              'Result',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 8),
            Text(
              '${exchangedAmount.toStringAsFixed(6)} ${toCurrency.toUpperCase()}',
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
