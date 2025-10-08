import 'package:bitpulse/Features/DetailsFeature/Presentation/View/components/detailsViewComponents/build_stat_row.dart';
import 'package:flutter/material.dart';

class StaticsCard extends StatelessWidget {
  const StaticsCard({
    super.key,
    required this.title,
    required this.t1,
    required this.t2,

    required this.v1,
    required this.v2,

  });
  final String t1;
  final String t2;

  final String v1;
  final String v2;


  final String title;
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),

      child: Padding(
        padding: const EdgeInsets.all(16.0),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            BuildStatRow(label: t1, value: v1),
            BuildStatRow(label: t2, value: v2),

          ],
        ),
      ),
    );
  }
}
