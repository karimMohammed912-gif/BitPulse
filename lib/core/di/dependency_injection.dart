import 'package:bitpulse/core/Api/api.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final GetIt getIt = GetIt.instance;

void setup() {
  // Register Dio
  getIt.registerSingleton<Dio>(Dio());

  // Register API Service
  getIt.registerSingleton<Api>(Api(getIt<Dio>()));
}
