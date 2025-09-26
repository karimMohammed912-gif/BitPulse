import 'package:bitpulse/Features/DetailsFeature/Data/Models/chart_data/chart_data_model.dart';
import 'package:bitpulse/Features/DetailsFeature/Presentation/View/components/chartComponents/info_item_widget.dart';
import 'package:bitpulse/Features/DetailsFeature/Presentation/Cubit/details_cubit.dart';
import 'package:bitpulse/core/extension/price_formate.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChartInfoWidget extends StatelessWidget {
  const ChartInfoWidget({
    super.key,
    required this.getdata,
    required this.context,
  });

  final List<ChartPoint> getdata;
  final BuildContext context;

  @override
  Widget build(BuildContext context) {
    // final displayData = getdata;
    if (getdata.isEmpty) return const SizedBox();

    final minPrice = context.read<DetailsCubit>().getMinValue(getdata);
    final maxPrice =  context.read<DetailsCubit>().getMaxValue(getdata);
    final avgPrice =
        getdata.map((e) => e.value).reduce((a, b) => a + b) /
        getdata.length;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        InfoItemWidget(label: 'Min', value: minPrice.formatted, color: Colors.red),
        InfoItemWidget(label: 'Avg', value: avgPrice.formatted, color: Colors.orange),
        InfoItemWidget(label: 'Max', value: maxPrice.formatted, color: Colors.green),
        InfoItemWidget(label: 'Points', value: '${getdata.length}', color: Colors.blue),
      ],
    );
  }
}
