import 'package:bitpulse/Features/DetailsFeature/Data/Models/chart_data/chart_data_model.dart';
import 'package:bitpulse/Features/DetailsFeature/Presentation/View/components/chartComponents/bottom_title_widget.dart';
import 'package:bitpulse/Features/DetailsFeature/Presentation/View/components/chartComponents/left_title_widget.dart';
import 'package:bitpulse/Features/DetailsFeature/Presentation/View/components/detailsViewComponents/custom_chart.dart';
import 'package:bitpulse/Features/DetailsFeature/Presentation/Cubit/details_cubit.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChartWidget extends StatelessWidget {
  const ChartWidget({
    super.key,
    required this.getdata,
    required this.context,
    required this.widget,
  });

  final List<ChartPoint> getdata;
  final BuildContext context;
  final CustomPriceChart widget;

  @override
  Widget build(BuildContext context) {
    // final displayData = getdata;

    if (getdata.isEmpty) {
      return const Center(child: Text('No data available'));
    }

    return LineChart(
      LineChartData(
        gridData: FlGridData(
          show: true,
          drawHorizontalLine: true,
          drawVerticalLine: false,
          getDrawingHorizontalLine: (value) {
            return FlLine(color: Colors.grey[300]!, strokeWidth: 2);
          },
        ),
        titlesData: FlTitlesData(
          show: true,
          rightTitles: const AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
          topTitles: const AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              reservedSize: 30,
              interval:  context.read<DetailsCubit>().calculateBottomInterval(getdata.length),
              getTitlesWidget: (value, meta) =>
                  BottomTitleWidget(value: value, data: getdata),
            ),
          ),
          leftTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              reservedSize: 60,
              getTitlesWidget: (value, meta) => LeftTitleWidget(value: value),
            ),
          ),
        ),
        borderData: FlBorderData(
          show: true,
          border: Border.all(color: Colors.grey[300]!, width: 1),
        ),
        minX: 0,
        maxX: (getdata.length - 1).toDouble(),
        minY:  context.read<DetailsCubit>().getMinValue(getdata) * 0.995,
        maxY:  context.read<DetailsCubit>().getMaxValue(getdata) * 1.005,
        lineBarsData: [
          LineChartBarData(
            spots:  context.read<DetailsCubit>().convertToFlSpots(getdata),
            isCurved: true,
            color: widget.lineColor,
            barWidth: 1,
            isStrokeCapRound: true,
            dotData: const FlDotData(show: false),
            belowBarData: BarAreaData(
              show: true,
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [widget.gradientStartColor, widget.gradientEndColor],
              ),
            ),
          ),
        ],
        lineTouchData: LineTouchData(
          enabled: true,
          touchTooltipData: LineTouchTooltipData(
            tooltipPadding: const EdgeInsets.all(8),
            getTooltipItems: (touchedSpots) {
              return touchedSpots.map((spot) {
                final point = getdata[spot.x.toInt()];
                return LineTooltipItem(
                  'Price: ${point.value}\n${point.shortDate}',
                  const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 12,
                  ),
                );
              }).toList();
            },
          ),
          handleBuiltInTouches: true,
        ),
      ),
    );
  }
}
