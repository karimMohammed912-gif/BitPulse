// import 'package:bitpulse/Feature/DetailsFeature/Presentation/View/components/detailsViewComponents/custom_chart.dart';
// import 'package:flutter/material.dart';

// class PriceChangeWidget extends StatelessWidget {
//   const PriceChangeWidget({
//     super.key,
//     required this.widget,
//   });

//   final CustomPriceChart widget;

//   @override
//   Widget build(BuildContext context) {
//     if (widget.chartData.prices.length < 2) return const SizedBox();

//     final currentPrice = widget.chartData.prices.last.value;
//     final previousPrice = widget.chartData.prices.first.value;
//     final change = currentPrice - previousPrice;
//     final changePercent = (change / previousPrice) * 100;

//     final isPositive = change >= 0;

//     return Container(
//       padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
//       decoration: BoxDecoration(
//         color: isPositive ? Colors.green[50] : Colors.red[50],
//         borderRadius: BorderRadius.circular(8),
//       ),
//       child: Row(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           Icon(
//             isPositive ? Icons.trending_up : Icons.trending_down,
//             color: isPositive ? Colors.green : Colors.red,
//             size: 16,
//           ),
//           const SizedBox(width: 4),
//           Text(
//             '${isPositive ? '+ ' : ' '}${changePercent.toStringAsFixed(2)}%',
//             style: TextStyle(
//               color: isPositive ? Colors.green : Colors.red,
//               fontWeight: FontWeight.w600,
//               fontSize: 14,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
