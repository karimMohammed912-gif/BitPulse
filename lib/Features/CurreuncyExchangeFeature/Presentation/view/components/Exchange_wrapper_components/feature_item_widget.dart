import 'package:bitpulse/core/extension/theme_extension.dart';
import 'package:flutter/material.dart';

class FeatureItemWidget extends StatelessWidget {
  const FeatureItemWidget({
    super.key,
    // required this.context,
    required this.icon,
    required this.title,
    required this.description,
  });

  // final BuildContext context;
  final IconData icon;
  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: context.primaryColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(
              icon,
              color: context.primaryColor,
              size: 20,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: context.body?.copyWith(
                    fontWeight: FontWeight.w600,
                    color: context.textColor,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  description,
                  style: context.caption?.copyWith(
                    color: context.secondaryTextColor,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}