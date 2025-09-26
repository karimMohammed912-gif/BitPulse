import 'package:flutter/material.dart';

class ChangePercentageWidget extends StatelessWidget {
  final double changePercent;

  const ChangePercentageWidget({super.key, required this.changePercent});

  @override
  Widget build(BuildContext context) {
    final isPositive = changePercent >= 0;
    final backgroundColor = isPositive ? Colors.green : Colors.red;
    final textColor = Colors.white;
    final icon = isPositive ? Icons.trending_up : Icons.trending_down;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color: textColor,
            size: 12,
          ),
          const SizedBox(width: 2),
          Text(
            '${changePercent.abs().toStringAsFixed(1)}%',
            style: TextStyle(
              color: textColor,
              fontSize: 11,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}