import 'package:bitpulse/core/extension/theme_extension.dart';
import 'package:flutter/material.dart';

class HeadSectionWidget extends StatelessWidget {
  const HeadSectionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              context.primaryColor.withOpacity(0.1),
              context.surfaceColor,
            ],
          ),
        ),
        child: Column(
          children: [
            Icon(
              Icons.currency_exchange,
              size: 48,
              color: context.primaryColor,
            ),
            const SizedBox(height: 16),
            Text(
              'Currency Exchange',
              style: context.title?.copyWith(
                color: context.textColor,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Convert between different cryptocurrencies',
              style: context.body?.copyWith(
                color: context.secondaryTextColor,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}