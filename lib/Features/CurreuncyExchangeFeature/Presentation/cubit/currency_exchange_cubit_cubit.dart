import 'package:bitpulse/Features/CurreuncyExchangeFeature/Presentation/cubit/currency_exchange_cubit_state.dart';
import 'package:bitpulse/Features/CurreuncyExchangeFeature/Data/repo/curreuncy_exchange_repImp.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CurrencyExchangeCubit extends Cubit<CurrencyExchangeState> {
  CurrencyExchangeCubit() : super(CurrencyExchangeInitial());

  void exchangeCurrency(String fromCurrency, String toCurrency, double amount) {
    emit(CurrencyExchangeLoading());
    
    CurrencyExchangeRepositoryImp().getExchangeRate(fromCurrency, toCurrency)
        .then((result) {
          result.fold(
            (error) => emit(CurrencyExchangeError(error.message)),
            (exchangeData) {
              //  Now this will work because exchangeData has fromPrice and toPrice
              final exchangedAmount = calculateExchange(amount, exchangeData.fromPrice, exchangeData.toPrice);
              
              emit(CurrencyExchangeSuccess(exchangeData, exchangedAmount, fromCurrency, toCurrency, amount));
            },
          );
        });
  }

  double calculateExchange(num amount, num fromPrice, num toPrice) {
    if (fromPrice == 0 || toPrice == 0) return 0;
    return (amount * fromPrice) / toPrice;
  }
}
