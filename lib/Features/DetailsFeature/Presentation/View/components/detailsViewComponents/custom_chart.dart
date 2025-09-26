import 'package:bitpulse/Features/DetailsFeature/Presentation/Cubit/chart_cubit/chart_cubit_cubit.dart';
import 'package:bitpulse/Features/DetailsFeature/Presentation/View/components/chartComponents/chart_build_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomPriceChart extends StatefulWidget {
  final String id;
  final String title;
  final Color lineColor;
  final Color gradientStartColor;
  final Color gradientEndColor;

  const CustomPriceChart({
    super.key,

    this.title = 'Price Chart',
    this.lineColor = Colors.blue,
    this.gradientStartColor = const Color(0x1A2196F3),
    this.gradientEndColor = Colors.transparent,
    required this.id,
  });

  @override
  State<CustomPriceChart> createState() => _CustomPriceChartState();
}

class _CustomPriceChartState extends State<CustomPriceChart> {
  int selectedDataPoints = 30;
  bool showAllData = false;

  @override
  void initState() {
    super.initState();
    context.read<ChartCubitCubit>().fetchChartOnly(widget.id);
  }

  // Remove late final - calculate getdata dynamically


  // Callback function for time button press

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChartCubitCubit,ChartCubitState> (
      builder: (context, state) {
        switch (state) {
          case ChartCubitLoading():
            return const Center(child: CircularProgressIndicator());
          case ChartCubitFailure failure:
            return Center(
              child: Text(
                'Error: ${failure.message}',
                style: TextStyle(color: Theme.of(context).colorScheme.error),
              ),
            );
          case ChartCubitSuccess success:
            final chartData = success.chartData;
            void onTimeButtonPressed(String label, int dataPoints) {
              setState(() {
                if (label == 'All') {
                  showAllData = true;
                  selectedDataPoints = chartData.prices.length;
                } else {
                  showAllData = false;
                  selectedDataPoints = dataPoints;
                }
              });
            }

            return ChartBuildWidget(
              widget: widget,
              selectedDataPoints: selectedDataPoints,
              showAllData: showAllData,
              chartData: chartData,

              onTimeButtonPressed: onTimeButtonPressed,
            );
          default:
            return const SizedBox.shrink(); // Default return statement
        }
      },
    );
  }
}
