import 'package:bitpulse/Features/DetailsFeature/Data/Models/chart_data/chart_data_model.dart';
import 'package:flutter/material.dart';

class BottomTitleWidget extends StatelessWidget {
  const BottomTitleWidget({
    super.key,
    required this.value,
    required this.data,
  });

  final double value;
  final List<ChartPoint> data;

  @override
  Widget build(BuildContext context) {
    final index = value.toInt();
    if (index < 0 || index >= data.length) return const Text('');

    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: Text(
        data[index].shortDate,
        style: TextStyle(
          color: Colors.grey[600],
          fontSize: 10,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
