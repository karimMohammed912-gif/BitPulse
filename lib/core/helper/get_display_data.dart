  // Helper Methods
  import 'package:bitpulse/Features/DetailsFeature/Data/Models/chart_data/chart_data_model.dart';

List<ChartPoint> getDisplayData(  {required List<ChartPoint> allData,required bool showAllData, required int selectedDataPoints}) {
    // final allData = widget.chartData.prices;
    if (allData.isEmpty) return [];

    if (showAllData) {
      // For 721 points, sample every nth point for better performance
      final sampleRate = (allData.length / 100).ceil();
      return allData
          .where((element) => allData.indexOf(element) % sampleRate == 0)
          .toList();
    } else {
      final startIndex = (allData.length - selectedDataPoints).clamp(
        0,
        allData.length,
      );
      return allData.sublist(startIndex);
    }
  }