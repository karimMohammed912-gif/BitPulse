import 'package:bitpulse/Features/DetailsFeature/Data/Models/chart_data/chart_data_model.dart';
import 'package:bitpulse/Features/DetailsFeature/Presentation/View/components/chartComponents/chart_controls_widget.dart';
import 'package:bitpulse/Features/DetailsFeature/Presentation/View/components/chartComponents/chart_info_widget.dart';
import 'package:bitpulse/Features/DetailsFeature/Presentation/View/components/chartComponents/chart_widget.dart';
import 'package:bitpulse/Features/DetailsFeature/Presentation/View/components/detailsViewComponents/custom_chart.dart';
import 'package:bitpulse/core/helper/get_display_data.dart';
import 'package:flutter/material.dart';

class ChartBuildWidget extends StatelessWidget {
  const ChartBuildWidget({
    super.key,
    required this.widget,
    required this.selectedDataPoints,
    required this.showAllData,
    required this.chartData,
 required this.onTimeButtonPressed,
  });
final dynamic Function(String, int) onTimeButtonPressed;
  final CustomPriceChart widget;
  final int selectedDataPoints;
  final bool showAllData;
  final ChartDataModel chartData;




    List<ChartPoint> get getdata => getDisplayData(
    allData: chartData.prices,
    showAllData: showAllData,
    selectedDataPoints: selectedDataPoints,
  );

  @override
  Widget build(BuildContext context) {
    
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Chart Header
            // ChartHeaderSection(widget: widget),
    
            const SizedBox(height: 16),
    
            // Chart Controls - Now extracted to separate widget
            ChartControlsWidget(
              selectedDataPoints: selectedDataPoints,
              showAllData: showAllData,
              lineColor: widget.lineColor,
              totalDataPoints: chartData.prices.length,
              onTimeButtonPressed: onTimeButtonPressed,
            ),
    
            const SizedBox(height: 20),
    
            // The Chart
            SizedBox(
              height: 300,
              child: ChartWidget(
                getdata: getdata,
                context: context,
                widget: widget,
              ),
            ),
    
            const SizedBox(height: 16),
    
            // Chart Info
            ChartInfoWidget(getdata: getdata, context: context),
          ],
        ),
      ),
    );
  }
}
