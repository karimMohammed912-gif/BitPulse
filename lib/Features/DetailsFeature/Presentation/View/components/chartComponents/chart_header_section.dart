// import 'package:bitpulse/Feature/DetailsFeature/Presentation/View/components/chartComponents/price_change_widget.dart';
// import 'package:bitpulse/Feature/DetailsFeature/Presentation/View/components/detailsViewComponents/custom_chart.dart';
// import 'package:flutter/material.dart';

// class ChartHeaderSection extends StatelessWidget {
//   const ChartHeaderSection({
//     super.key,
//     required this.widget,
//   });

//   final CustomPriceChart widget;

//   @override
//   Widget build(BuildContext context) {
//     final latestPrice = 0.0;

//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               widget.title,
//               style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//             ),
//             const SizedBox(height: 4),
//             Text(
//               "",
//               style: TextStyle(
//                 fontSize: 24,
//                 fontWeight: FontWeight.bold,
//                 color: widget.lineColor,
//               ),
//             ),
//           ],
//         ),
//         PriceChangeWidget(widget: widget),
//       ],
//     );
//   }
// }
