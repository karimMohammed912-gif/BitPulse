import 'dart:ui';

import 'package:bitpulse/Features/DetailsFeature/Presentation/Cubit/details_cubit.dart';
import 'package:bitpulse/core/Themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CardDetails extends StatelessWidget {
  const CardDetails({  super.key, required this.market,required this.genesisDate});
  final num? market ;
  final String? genesisDate ; // Example genesis date, replace with actual data 
// Example last updated time, replace with actual data
  // Example market cap rank, replace with actual data
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          Expanded(
            child: GradientDetailCard(
              title: 'Market Cap Rank',
              value: context.read<DetailsCubit>().hasNull(market.toString()),
              icon: Icons.trending_up,
              gradientColors: [
                AppColors.primary.withValues(
         
                  alpha: 1,
                ),
                AppColors.primary.withValues(
          
                  alpha: 0.3,
                ),
              ],
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: GradientDetailCard(
              title: 'Genesis Date',
              value: context.read<DetailsCubit>().hasNull(genesisDate.toString()),
              icon: Icons.timelapse_outlined,
              gradientColors: [
                AppColors.primary.withValues(
                  colorSpace: ColorSpace.sRGB,
                  alpha: 1,
                ),
                AppColors.primary.withValues(
                  colorSpace: ColorSpace.sRGB,
                  alpha: 0.5,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class GradientDetailCard extends StatelessWidget {
  const GradientDetailCard({
    super.key,
    required this.title,
    required this.value,
    required this.icon,
    required this.gradientColors,
  });

  final String title;
  final String value;
  final IconData icon;
  final List<Color> gradientColors;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: gradientColors,
        ),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: gradientColors.first.withOpacity(0.3),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: Colors.white, size: 28),
          const SizedBox(height: 12),
          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            value,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
