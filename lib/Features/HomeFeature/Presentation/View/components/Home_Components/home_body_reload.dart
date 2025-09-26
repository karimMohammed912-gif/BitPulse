import 'package:bitpulse/Features/HomeFeature/Presentation/View/cubit/home_cubit_cubit.dart';
import 'package:bitpulse/core/Themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeBodyReload extends StatelessWidget {
  const HomeBodyReload({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.refresh,
            size: 64,
            color: AppColors.grey,
          ),
          const SizedBox(height: 16),
          const Text(
            'No data available',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: AppColors.textLight,
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'Tap to load cryptocurrency data',
            style: TextStyle(
              fontSize: 14,
              color: AppColors.grey,
            ),
          ),
          const SizedBox(height: 24),
          ElevatedButton.icon(
            onPressed: () {
              context.read<HomeCubit>().loadCryptoData();
            },
            icon: const Icon(Icons.refresh),
            label: const Text('Load Data'),
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primary,
              foregroundColor: AppColors.textDark,
              padding: const EdgeInsets.symmetric(
                horizontal: 24,
                vertical: 12,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
