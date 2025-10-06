import 'package:bitpulse/Features/CurreuncyExchangeFeature/Presentation/view/components/Exchange_wrapper_components/feature_item_widget.dart';
import 'package:bitpulse/core/extension/theme_extension.dart';
import 'package:bitpulse/core/l10n/generated/l10n.dart';
import 'package:flutter/material.dart';

class FeaturesListWidget extends StatelessWidget {
  const FeaturesListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final features = [
      {
        'icon': Icons.speed,
        'title': AppLocalizations.of(context).Real_time_Rates,
        'description': AppLocalizations.of(context).Get_real_time_exchange_rates_for_a_wide_range_of_cryptocurrencies,},

      {
        'icon': Icons.swap_horiz,
        'title': AppLocalizations.of(context).easy_Swapping,
        'description': AppLocalizations.of(context).Quickly_swap_between_different_cryptocurrencies,
      },
      {
        'icon': Icons.calculate,
        'title': AppLocalizations.of(context).precise_Calculations,
        'description': AppLocalizations.of(context).Perform_accurate_currency_conversions_with_advanced_calculation_tools,
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
              AppLocalizations.of(context).features,
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
