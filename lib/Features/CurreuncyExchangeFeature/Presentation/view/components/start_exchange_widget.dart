import 'package:bitpulse/Features/CurreuncyExchangeFeature/Presentation/view/components/Exchange_wrapper_components/features_list_widget.dart';
import 'package:bitpulse/Features/CurreuncyExchangeFeature/Presentation/view/components/Exchange_wrapper_components/start_button_widget.dart';
import 'package:bitpulse/core/extension/theme_extension.dart';
import 'package:flutter/material.dart';

class StartExchangeWidget extends StatelessWidget {
  final VoidCallback onStartExchange;

  const StartExchangeWidget({
    super.key,
    required this.onStartExchange,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
       
            
            const SizedBox(height: 32),
            
            // Title
            Text(
              'Currency Exchange',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: context.textColor,
              ),
              textAlign: TextAlign.center,
            ),
            
            const SizedBox(height: 16),
            
            // Description
            Text(
              'Convert between different cryptocurrencies\nwith real-time exchange rates',
              style: context.body?.copyWith(
                color: context.secondaryTextColor,
                fontSize: 16,
              ),
              textAlign: TextAlign.center,
            ),
            
            const SizedBox(height: 48),
            
            // Features List
            FeaturesListWidget(),
            
            const SizedBox(height: 48),
            
            // Start Button
            StartButtonWidget(onStartExchange: onStartExchange),
            
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }
}
