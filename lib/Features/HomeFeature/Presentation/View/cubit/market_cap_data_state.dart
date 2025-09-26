part of 'market_cap_data_cubit.dart';

@immutable
sealed class MarketCapDataState {}

final class MarketCapDataCubitInitial extends MarketCapDataState {}


final class MarketCapDataCubitLoading extends MarketCapDataState {}
final class MarketCapDataCubitSuccess extends MarketCapDataState {
  final double marketCapPercentage;

  MarketCapDataCubitSuccess(this.marketCapPercentage);
}
final class MarketCapDataCubitFailure extends MarketCapDataState {
  final String message;

  MarketCapDataCubitFailure(this.message);
}