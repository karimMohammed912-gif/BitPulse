part of 'chart_cubit_cubit.dart';

@immutable
sealed class ChartCubitState {}

final class ChartCubitInitial extends ChartCubitState {}

final class ChartCubitLoading extends ChartCubitState {}
final class ChartCubitSuccess extends ChartCubitState {
  final ChartDataModel chartData;

  ChartCubitSuccess(this.chartData);
}
final class ChartCubitFailure extends ChartCubitState {
  final String message;

  ChartCubitFailure(this.message);
}
