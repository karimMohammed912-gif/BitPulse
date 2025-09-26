import 'package:bitpulse/Features/DetailsFeature/Data/Models/chart_data/chart_data_model.dart';
import 'package:bitpulse/Features/DetailsFeature/Data/Models/crypto_details/crypto_details.dart';
import 'package:bitpulse/Features/DetailsFeature/Data/repo/details_repo.dart';
import 'package:bitpulse/core/Api/api.dart';
import 'package:bitpulse/core/Error/error.dart';
import 'package:bitpulse/core/di/dependency_injection.dart';
import 'package:bitpulse/core/utils/constant.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class DetailsRepoimp implements DetailsRepo {

  @override
  Future<Either<Failure, CryptoDetails>> fetchDetailsData(String id) async {
    Api api = getIt<Api>();



    try {
      var response = await api.get(
        baseUrl: 'https://api.coingecko.com',
        endpoint: '/api/v3/coins/${id.toLowerCase()}',
        parameters:
            'api_key=$apiKey&localization=false&developer_data=false&community_data=false&market_data=false',
      );

      var data = CryptoDetails.fromJson(response.data);
      // Here you can process or store the cryptoItem as needed

      // You can process or store the cryptoItem as needed
      return Right(data);
    } on DioException catch (e) {
      return Left(
        ServerFailure.fromDioError(e),
      );
      // Handle any errors that occur during the fetch operation
    } catch (e) {
      // Handle any errors that occur during the fetch operation
      if (e is DioException) {
        print('DioException occurred: ${e.message}');
        return Left(ServerFailure.fromDioError(e));
      } else {
        print('An unexpected error occurred: $e');
        return Left(ServerFailure('An unexpected error occurred: $e'));
      }
    }
  }

  @override
  Future<Either<Failure, ChartDataModel>> fetchChartData(String id, {int days = 30}) async {
    try {
      final response = await http.get(
        Uri.parse('https://api.coingecko.com/api/v3/coins/$id/market_chart?vs_currency=usd&days=$days'),
        headers: {'Accept': 'application/json'},
      );

      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        final chartData = ChartDataModel.fromJson(json);
        return Right(chartData);
      } else {
        return Left(ServerFailure('Failed to load chart data: ${response.statusCode}'));
      }
    } catch (e) {
        if (e is DioException) {
        return Left(ServerFailure.fromDioError(e));
      }else {
        print('An unexpected error occurred: $e');
        return Left(ServerFailure('An unexpected error occurred: $e'));
      }
     
    }
  }
}
