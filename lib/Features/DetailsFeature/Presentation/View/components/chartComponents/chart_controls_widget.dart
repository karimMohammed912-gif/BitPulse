import 'package:bitpulse/Features/DetailsFeature/Presentation/View/components/chartComponents/time_button_widget.dart';
import 'package:flutter/material.dart';

class ChartControlsWidget extends StatelessWidget {
  final int selectedDataPoints;
  final bool showAllData;
  final Color lineColor;
  final int totalDataPoints;
  final Function(String label, int dataPoints) onTimeButtonPressed;

  const ChartControlsWidget({
    super.key,
    required this.selectedDataPoints,
    required this.showAllData,
    required this.lineColor,
    required this.totalDataPoints,
    required this.onTimeButtonPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          TimeButtonWidget(
            label: '1D',
            dataPoints: 24,
            selectedDataPoints: selectedDataPoints,
            showAllData: showAllData,
            lineColor: lineColor,
            onTimeButtonPressed: onTimeButtonPressed,
          ),
          TimeButtonWidget(
            label: '7D',
            dataPoints: 168,
            selectedDataPoints: selectedDataPoints,
            showAllData: showAllData,
            lineColor: lineColor,
            onTimeButtonPressed: onTimeButtonPressed,
          ),
          TimeButtonWidget(
            label: '30D',
            dataPoints: 720,
            selectedDataPoints: selectedDataPoints,
            showAllData: showAllData,
            lineColor: lineColor,
            onTimeButtonPressed: onTimeButtonPressed,
          ),
          // Uncomment if you want All button back
          // TimeButtonWidget(
          //   label: 'All',
          //   dataPoints: totalDataPoints,
          //   selectedDataPoints: selectedDataPoints,
          //   showAllData: showAllData,
          //   lineColor: lineColor,
          //   onTimeButtonPressed: onTimeButtonPressed,
          // ),
        ],
      ),
    );
  }
}