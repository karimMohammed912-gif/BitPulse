import 'package:bitpulse/Features/HomeFeature/Presentation/View/cubit/home_cubit_cubit.dart';
import 'package:bitpulse/core/Themes/colors.dart';
import 'package:bitpulse/core/extension/theme_extension.dart';
import 'package:bitpulse/core/l10n/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InitialView extends StatelessWidget {
  const InitialView({
    super.key,
    required this.context,
  });

  final BuildContext context;

  @override
  Widget build(BuildContext context) {
    return Center(
      child:  Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.currency_bitcoin,
            size: 64,
            color: AppColors.grey,
          ),
          SizedBox(height: 16),
          Column(
            children: [
              Text(
                AppLocalizations.of(context).welcomeBack,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color:context.textColor,
                ),
              ),SizedBox(height: 8),
          Text(
            AppLocalizations.of(context).Initializing,
            style: TextStyle(
              color: AppColors.grey,
            ),
          ),SizedBox(height: 8),ElevatedButton.icon(
            onPressed: () {
              context.read<HomeCubit>().loadCryptoData();
            },
            icon: const Icon(Icons.refresh),
            label:  Text(AppLocalizations.of(context).Load_Data),
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
          
        ],
      ),
    );
  }
}
