part of 'home_cubit_cubit.dart';

abstract class HomeCubitState {}

class HomeCubitInitial extends HomeCubitState {}

class HomeCubitLoading extends HomeCubitState {}
class HomeCubitMarketCapSuccess extends HomeCubitState {
  final double marketCapPercentage;

  HomeCubitMarketCapSuccess(this.marketCapPercentage);
}

 

 class HomeCubitMarketCapfaliur extends HomeCubitState {
  final String message;

  HomeCubitMarketCapfaliur(this.message);

 }

class HomeCubitMarketCaploading extends HomeCubitState {}


class HomeCubitError extends HomeCubitState {
  final String message;
  HomeCubitError(this.message);
}

class HomeCubitSuccess extends HomeCubitState {
  final List<CryptoItemList> cryptoItemList;
  final bool hasMoreData;
  final bool isLoadingMore;

  HomeCubitSuccess(
    this.cryptoItemList, {
    this.hasMoreData = true,
    this.isLoadingMore = false,
  });
}

class HomePaginationLoading extends HomeCubitState {}

class HomePaginationSuccess extends HomeCubitState {
  final List<CryptoItemList> cryptoItemList;

  HomePaginationSuccess(this.cryptoItemList);
}

class HomePaginationFinished extends HomeCubitState {}


class BoxLoaded extends HomeCubitState {
  final List<CryptoItemList> cryptoItemList;

  BoxLoaded(this.cryptoItemList);
}
  
class BoxLoading extends HomeCubitState {}