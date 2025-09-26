import 'package:bitpulse/Features/CurreuncyExchangeFeature/Presentation/cubit/currency_exchange_cubit_cubit.dart';
import 'package:bitpulse/Features/CurreuncyExchangeFeature/Presentation/view/exchange_view_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ExchangeCoinView extends StatelessWidget {
  const ExchangeCoinView({super.key});
  
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CurrencyExchangeCubit(),
      lazy: true, // Only create when actually needed
      child: const ExchangeViewWrapper(), //  Use wrapper instead of direct view
    );
  }
}
