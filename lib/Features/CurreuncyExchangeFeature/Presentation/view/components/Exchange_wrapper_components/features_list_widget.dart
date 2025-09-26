import 'package:bitpulse/Features/CurreuncyExchangeFeature/Presentation/view/components/Exchange_wrapper_components/feature_item_widget.dart';
import 'package:bitpulse/core/extension/theme_extension.dart';
import 'package:flutter/material.dart';

class FeaturesListWidget extends StatelessWidget {
  const FeaturesListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final features = [
      {
        'icon': Icons.speed,
        'title': 'Real-time Rates',
        'description': 'Get live exchange rates for accurate conversions',
      },

      {
        'icon': Icons.swap_horiz,
        'title': 'Easy Swapping',
        'description': 'Quickly swap between different cryptocurrencies',
      },
      {
        'icon': Icons.calculate,
        'title': 'Precise Calculation',
        'description': 'Accurate calculations with detailed breakdown',
      },
    ];

    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Features',
              style: context.title?.copyWith(
                color: context.textColor,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            ...features.map(
              (feature) => FeatureItemWidget(
                icon: feature['icon'] as IconData,
                title: feature['title'] as String,
                description: feature['description'] as String,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
