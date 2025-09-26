import 'package:bitpulse/core/extension/price_formate.dart';
import 'package:flutter/material.dart';

class LeftTitleWidget extends StatelessWidget {
  const LeftTitleWidget({
    super.key,
    required this.value,
  });

  final double value;

  @override
  Widget build(BuildContext context) {
    return Text(
      value.formatted,
      style: TextStyle(
        color: Colors.grey[600],
        fontSize: 10,
        fontWeight: FontWeight.w300,
      ),
    );
  }
}
