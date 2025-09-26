import 'package:bitpulse/Features/DetailsFeature/Data/Models/chart_data/chart_data_model.dart';
import 'package:bitpulse/Features/DetailsFeature/Data/repo/details_repoImp.dart';
import 'package:bloc/bloc.dart';
import 'package:bitpulse/Features/DetailsFeature/Presentation/Cubit/details_state.dart';
import 'package:fl_chart/fl_chart.dart';

class DetailsCubit extends Cubit<DetailsCubitState> {
  DetailsCubit() : super(DetailsCubitInitial());

  // This method fetches both details and chart data concurrently

  // Optional: Keep individual methods for specific use cases
  void fetchDetailsOnly(String id) async {
    emit(DetailsCubitLoading());

    try {
      final detailsRepo = DetailsRepoimp();
      final result = await detailsRepo.fetchDetailsData(id);

      result.fold(
        (failure) => emit(DetailsCubitFailure(failure.message)),
        (cryptoDetails) => emit(DetailsCubitSuccess(cryptoDetails)),
      );
    } catch (e) {
      emit(DetailsCubitFailure('Failed to fetch details data'));
    }
  }

  // Helper method
  String hasNull(String value) {
    return (value == "null") || value.isEmpty ? 'N/A' : value;
  }

  double calculateBottomInterval(int dataLength) {
    return (dataLength / 5).clamp(1.0, double.infinity);
  }

  double getMaxValue(List<ChartPoint> data) {
    return data.map((e) => e.value).reduce((a, b) => a > b ? a : b);
  }

  double getMinValue(List<ChartPoint> data) {
    return data.map((e) => e.value).reduce((a, b) => a < b ? a : b);
  }

  List<FlSpot> convertToFlSpots(List<ChartPoint> data) {
    return data.asMap().entries.map((entry) {
      return FlSpot(entry.key.toDouble(), entry.value.value);
    }).toList();
  }
}
