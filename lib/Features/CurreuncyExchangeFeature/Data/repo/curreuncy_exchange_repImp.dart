import 'package:bitpulse/Features/CurreuncyExchangeFeature/Data/Model/curncyexcahnge.dart';
import 'package:bitpulse/Features/CurreuncyExchangeFeature/Data/repo/curreuncy_exchange_rep.dart';
import 'package:bitpulse/core/Api/api.dart';
import 'package:bitpulse/core/Error/error.dart';
import 'package:bitpulse/core/di/dependency_injection.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class CurrencyExchangeRepositoryImp extends CurrencyExchangeRepository {
  @override
  Future<Either<Failure, CurrencyExchange>> getExchangeRate(String fromCurrency, String toCurrency) async {
    var api = getIt<Api>();

    try {
      final response = await api.get(
        baseUrl: "https://api.coingecko.com/",
        endpoint: "/api/v3/simple/price",
        parameters: "vs_currencies=usd&ids=$fromCurrency,$toCurrency",
      );

      if (response.data == null || response.data.isEmpty) {
        return Left(ServerFailure('No data received'));
      }

      // Use the new factory with currency IDs
      final value = CurrencyExchange.fromJson(response.data, fromCurrency, toCurrency);
      
      return Right(value);
    } catch (error) {
      if (error is DioException) {
        return Left(ServerFailure.fromDioError(error));
      }
      return Left(ServerFailure('Error: $error'));
    }
  }
}