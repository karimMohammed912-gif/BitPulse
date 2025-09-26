import 'package:bitpulse/Features/CurreuncyExchangeFeature/Presentation/view/components/Exchange_wrapper_components/loading_widget.dart';
import 'package:bitpulse/Features/CurreuncyExchangeFeature/Presentation/view/components/start_exchange_widget.dart';
import 'package:bitpulse/Features/CurreuncyExchangeFeature/Presentation/view/components/exchange_view_components/curreuncy_exchange_view.dart';
import 'package:flutter/material.dart';

class ExchangeViewWrapper extends StatefulWidget {
  const ExchangeViewWrapper({super.key});

  @override
  State<ExchangeViewWrapper> createState() => _ExchangeViewWrapperState();
}

class _ExchangeViewWrapperState extends State<ExchangeViewWrapper> {
  bool _showFullExchange = false;
  bool _isLoading = false;

  void _startExchange() async {
    setState(() {
      _isLoading = true;
    });

    // Add a small delay to show loading animation
    await Future.delayed(const Duration(milliseconds: 800));

    if (mounted) {
      setState(() {
        _showFullExchange = true;
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return LoadingWidget();
    }

    if (_showFullExchange) {
      return CurrencyExchangeView();
    }

    return StartExchangeWidget(
      onStartExchange: _startExchange,
    );
  }
}
