import 'package:bitpulse/Features/DetailsFeature/Data/Models/chart_data/chart_data_model.dart';
import 'package:bitpulse/Features/DetailsFeature/Data/repo/details_repoImp.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'chart_cubit_state.dart';

class ChartCubitCubit extends Cubit<ChartCubitState> {
  ChartCubitCubit() : super(ChartCubitInitial());


  void fetchChartOnly(String id, {int days = 30}) async {
    emit(ChartCubitLoading());

    try {
      final detailsRepo = DetailsRepoimp();
      final result = await detailsRepo.fetchChartData(id, days: days);
      
      result.fold(
        (failure) => emit(( ChartCubitFailure(failure.message))),
        (chartData) => emit(ChartCubitSuccess(chartData)),
      );
    } catch (e) {
      emit(ChartCubitFailure('Failed to fetch chart data'));
    }
  }
}
