import 'package:bitpulse/Features/HomeFeature/Data/Model/crypto_item_list/crypto_item_list.dart';
import 'package:bitpulse/Features/HomeFeature/Data/Model/market_cap_model/market_cap_model.dart';
import 'package:bitpulse/Features/HomeFeature/Data/repo/home_repo.dart';
import 'package:bitpulse/core/Api/api.dart';
import 'package:bitpulse/core/Error/error.dart';
import 'package:bitpulse/core/di/dependency_injection.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'dart:developer' as developer;

// Repository implementation for Home feature
class HomeRepoimp implements HomeRepo {
  @override
  Future<Either<Failure, List<CryptoItemList>>> fetchCryptoData() async {
    Api api = getIt<Api>();

    try {
      // Fetching cryptocurrency data from the API
      var response = await api.get(
        baseUrl: 'https://api.coingecko.com',
        endpoint: '/api/v3/coins/markets',
        parameters: 'vs_currency=usd',
      );

      var data = response.data as List?;
      // Check if the response status code is not 200
      if (data == null || data.isEmpty) {
        return Left(ServerFailure('No crypto data available'));
      }
      // Parsing the data into a list of CryptoItemList objects
      var cryptoItemList = data


          .map((item) {
            try {
              return CryptoItemList.fromJson(item);
            } catch (e) {
              developer.log('Error parsing crypto item: $e', level: 900);
              return null;
            }
          })
          .where((item) => item != null)
          .cast<CryptoItemList>()
          .toList();

      return Right(cryptoItemList);
    } catch (e) {
      // Handling Dio exceptions and other errors

      if (e is DioException) {
        return Left(ServerFailure.fromDioError(e));
      } else {
        return Left(ServerFailure('An unexpected error occurred: $e'));
      }
    }
  }

  @override
  Future<Either<Failure, double>> fetchMarketCapPercentage() async {
    Api api = getIt<Api>();
    // Fetching market capitalization percentage data from the API
    try {
      var response = await api.get(
        baseUrl: 'https://api.coingecko.com',
        endpoint: '/api/v3/global',
      );
      // Check if the response status code is 200 and data is not null
      if (response.statusCode == 200 && response.data != null) {
        try {
          var marketCapData = Marketcapmodel.fromJson(response.data);
          return Right(marketCapData.marketCap);
        } catch (e) {
          return Left(ServerFailure('Failed to parse market cap data'));
        }
      } else {
        return Left(ServerFailure('Failed to fetch market cap data'));
      }
    } catch (e) {
      // Handling Dio exceptions and other errors
      if (e is DioException) {
        return Left(ServerFailure.fromDioError(e));
      } else {
        return Left(ServerFailure('An unexpected error occurred: $e'));
      }
    }
  }
}
