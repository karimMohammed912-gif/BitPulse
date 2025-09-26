import 'package:bitpulse/Features/HomeFeature/Data/repo/home_repoImp.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'market_cap_data_state.dart';

class MarketCapDataCubitCubit extends Cubit<MarketCapDataState> {
  MarketCapDataCubitCubit() : super(MarketCapDataCubitInitial());

  void   loadMarketCapPercentage() async {
    emit(MarketCapDataCubitLoading());
    // Fetch market cap percentage from the repository

    HomeRepoimp homeRepo = HomeRepoimp();
   await homeRepo.fetchMarketCapPercentage().then((result) {
      result.fold(
        (failure) => emit(MarketCapDataCubitFailure(failure.message)),
        (marketCapPercentage) {
          emit(MarketCapDataCubitSuccess(marketCapPercentage));
        },
      );
    });
  }


}



