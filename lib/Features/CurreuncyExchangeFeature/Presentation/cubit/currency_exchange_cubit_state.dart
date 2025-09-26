import 'package:bitpulse/Features/CurreuncyExchangeFeature/Data/Model/curncyexcahnge.dart';

abstract class CurrencyExchangeState {}

class CurrencyExchangeInitial extends CurrencyExchangeState {}

class CurrencyExchangeLoading extends CurrencyExchangeState {}

class CurrencyExchangeSuccess extends CurrencyExchangeState {
  final CurrencyExchange exchangeData;
  final double exchangedAmount;
  final String fromCurrency;
  final String toCurrency;
  final double originalAmount;
  
  CurrencyExchangeSuccess(
    this.exchangeData,
    this.exchangedAmount,
    this.fromCurrency,
    this.toCurrency,
    this.originalAmount,
  );
}

class CurrencyExchangeError extends CurrencyExchangeState {
  final String message;
  CurrencyExchangeError(this.message);
}