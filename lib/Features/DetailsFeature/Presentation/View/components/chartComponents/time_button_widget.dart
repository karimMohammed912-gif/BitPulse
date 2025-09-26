import 'package:flutter/material.dart';

class TimeButtonWidget extends StatelessWidget {
  final String label;
  final int dataPoints;
  final int selectedDataPoints;
  final bool showAllData;
  final Color lineColor;
  final Function(String label, int dataPoints) onTimeButtonPressed;

  const TimeButtonWidget({
    super.key,
    required this.label,
    required this.dataPoints,
    required this.selectedDataPoints,
    required this.showAllData,
    required this.lineColor,
    required this.onTimeButtonPressed,
  });

  @override
  Widget build(BuildContext context) {
    final isSelected = selectedDataPoints == dataPoints || 
                      (label == 'All' && showAllData);

    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: InkWell(
        onTap: () => onTimeButtonPressed(label, dataPoints),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            color: isSelected ? lineColor : Colors.grey[100],
            borderRadius: BorderRadius.circular(20),
          ),
          child: Text(
            label,
            style: TextStyle(
              color: isSelected ? Colors.white : Colors.grey[700],
              fontWeight: FontWeight.w600,
              fontSize: 12,
            ),
          ),
        ),
      ),
    );
  }
}