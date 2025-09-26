import 'package:flutter/material.dart';

class BuildStatRow extends StatelessWidget {
  const BuildStatRow({
    super.key,
    required this.label, 
    required this.value,
  });

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    // Check if label or value is long enough to trigger wrapping
    final shouldWrap = label.length > 15 || value.length > 20;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: shouldWrap ? _buildColumnLayout() : _buildRowLayout(),
    );
  }

  Widget _buildRowLayout() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // Label with flex for better space management
        Expanded(
          flex: 2,
          child: Text(
            label,
            overflow: TextOverflow.fade,
            style: const TextStyle(
              fontSize: 14,
            ),
          ),
        ),
        
        // Small spacing
        
        
        // Value with flex and proper alignment
        Expanded(
          flex: 3,
          child: Text(
            value,
            maxLines: 4,
         overflow: TextOverflow.fade,
            textAlign: TextAlign.end,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildColumnLayout() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Label
        Text(
          label,
          style: const TextStyle(
            fontSize: 14,
          ),
        ),
        
        const SizedBox(height: 4),
        
        // Value on new line
        SizedBox(
          width: double.infinity,
          child: Text(
            value,
            textAlign: TextAlign.end,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }
}
