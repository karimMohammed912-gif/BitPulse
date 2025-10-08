import 'package:bitpulse/Features/CurreuncyExchangeFeature/Presentation/cubit/currency_exchange_cubit_cubit.dart';
import 'package:bitpulse/Features/CurreuncyExchangeFeature/Presentation/cubit/currency_exchange_cubit_state.dart';
import 'package:bitpulse/Features/CurreuncyExchangeFeature/Presentation/view/components/exchange_view_components/currency_dropdown_menu_widget.dart';
import 'package:bitpulse/Features/CurreuncyExchangeFeature/Presentation/view/components/exchange_view_components/exchange_button.dart';
import 'package:bitpulse/Features/CurreuncyExchangeFeature/Presentation/view/components/exchange_view_components/exchange_result_widget.dart';
import 'package:bitpulse/Features/CurreuncyExchangeFeature/Presentation/view/components/exchange_view_components/head_section_widget.dart';
import 'package:bitpulse/Features/HomeFeature/Presentation/View/cubit/home_cubit_cubit.dart';
import 'package:bitpulse/core/l10n/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CurrencyExchangeView extends StatefulWidget {
  const CurrencyExchangeView({super.key});

  @override
  State<CurrencyExchangeView> createState() => _CurrencyExchangeViewState();
}

class _CurrencyExchangeViewState extends State<CurrencyExchangeView> {
  final TextEditingController _amountController = TextEditingController(text: '1.0');
  
  String _fromCurrency = 'bitcoin';
  String _toCurrency = 'ethereum';

  @override
  void dispose() {
    _amountController.dispose();
    super.dispose();
  }

  void _exchange() {
    final amount = double.tryParse(_amountController.text) ?? 0;
    if (amount > 0) {
      context.read<CurrencyExchangeCubit>().exchangeCurrency(_fromCurrency, _toCurrency, amount);
    }
  }

  @override
  Widget build(BuildContext context) {
    final currencies = context.read<HomeCubit>().top100CurrenciesWithNames;


    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const HeadSectionWidget(),
              const SizedBox(height: 24),
              
              // Amount Input
              TextField(
                controller: _amountController,
                decoration:  InputDecoration(
                  labelText: AppLocalizations.of(context).amount,
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 16),
                ),
                keyboardType: TextInputType.number,
              ),
              
              const SizedBox(height: 16),
              
              // Currency Dropdowns
                Column(
                  children: [
                    CurrencyDropdownMenuWidget(currencies: currencies, currentValue: _fromCurrency, label: 'From', onChanged: (value) => setState(() => _fromCurrency = value!)),
                    
                    const SizedBox(height: 8),
                    
                    // Swap button
                    IconButton(
                      onPressed: () {
                        setState(() {
                          final temp = _fromCurrency;
                          _fromCurrency = _toCurrency;
                          _toCurrency = temp;
                        });
                      },
                      icon: const Icon(Icons.swap_vert),
                      style: IconButton.styleFrom(
                        backgroundColor: Theme.of(context).primaryColor.withOpacity(0.1),
                        padding: const EdgeInsets.all(12),
                      ),
                    ),
                    
                    const SizedBox(height: 8),
                    
                    CurrencyDropdownMenuWidget(currencies: currencies, currentValue: _toCurrency, label: 'To', onChanged: (value) => setState(() => _toCurrency = value!)),
                  ],
                ),
              
              const SizedBox(height: 24),
              
              // Exchange Button
              ExchangeButton( 
                onPressed: _exchange,
              ),
              
              const SizedBox(height: 24),
              
              // Result
              BlocBuilder<CurrencyExchangeCubit, CurrencyExchangeState>(
                builder: (context, state) {
                  if (state is CurrencyExchangeLoading) {
                    return const Center(
                      child: Padding(
                        padding: EdgeInsets.all(20),
                        child: CircularProgressIndicator(),
                      ),
                    );
                  }
                  if (state is CurrencyExchangeError) {
                    return Card(
                    
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Text(
                          '${AppLocalizations.of(context).Error_}${state.message}',
                          style: TextStyle(color: Colors.red.shade700),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    );
                  }
                  
                  if (state is CurrencyExchangeSuccess) {
                    return ExchangeResultWidget(exchangedAmount: state.exchangedAmount, toCurrency: state.toCurrency);
                  }
                  
                  return const SizedBox.shrink();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  
}
