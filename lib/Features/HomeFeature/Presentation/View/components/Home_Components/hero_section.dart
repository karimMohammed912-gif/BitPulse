import 'package:bitpulse/Features/HomeFeature/Presentation/View/components/Home_Components/home_body_success.dart';
import 'package:bitpulse/Features/HomeFeature/Presentation/View/cubit/market_cap_data_cubit.dart';
import 'package:bitpulse/core/extension/theme_extension.dart';
import 'package:bitpulse/core/l10n/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({super.key, required this.widget});

  final HomeBodySuccess widget;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Card(
        margin: EdgeInsets.all(16),
        child: Padding(
          padding: EdgeInsets.all(20),
          child: BlocBuilder<MarketCapDataCubitCubit,MarketCapDataState>(
            builder: (context, state) {
              if (state is MarketCapDataCubitLoading) {
                return _buildLoading(context);
              } else if (state is MarketCapDataCubitFailure) {
                return _buildError(context, state.message);
              } else if (state is MarketCapDataCubitSuccess) {
                return _buildSuccess(context, state.marketCapPercentage);
              } else {
                return _buildDefault(context);
              }
            },
           
       
  ),
        ),
      ),
    );
  }

  Widget _buildLoading(BuildContext context) {
    return Column(
      children: [
        CircularProgressIndicator(color: context.primaryColor),
        const SizedBox(height: 16),
        Text(
          AppLocalizations.of(context).loading_market_data,
          style: TextStyle(color: context.textColor),
        ),
      ],
    );
  }

  Widget _buildError(BuildContext context, String message) {
    return Column(
      children: [
        Icon(Icons.error, size: 48, color: Theme.of(context).colorScheme.error),
        const SizedBox(height: 16),
        Text(
          AppLocalizations.of(context).Error_loading_market_data,
          style: TextStyle(
            color: context.textColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          message,
          style: TextStyle(color: context.secondaryTextColor),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget _buildSuccess(BuildContext context, double percentage) {
    final isPositive = percentage >= 0;
    final color = isPositive ? Colors.green : Colors.red;

    return Column(
      children: [
        Icon(
          isPositive ? Icons.trending_up : Icons.trending_down,
          size: 48,
          color: color,
        ),
        const SizedBox(height: 16),
        Text(
          AppLocalizations.of(context).Global_market_cap,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: context.textColor,
          ),
        ),

        Text(
          isPositive ? AppLocalizations.of(context).is_up  : AppLocalizations.of(context).is_down,
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
            color: color,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          '${isPositive ? '+' : ''}${percentage.toStringAsFixed(2)}%',
          style: TextStyle(
            fontSize: 24,
            color: color,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(AppLocalizations.of(context).change_24h, style: TextStyle(color: context.secondaryTextColor)),
      ],
    );
  }

  Widget _buildDefault(BuildContext context) {
    return Column(
      children: [
        Icon(Icons.analytics, size: 48, color: context.primaryColor),
        const SizedBox(height: 16),
        Text(
          'BitPulse',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: context.textColor,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          'Your Crypto Companion',
          style: TextStyle(color: context.secondaryTextColor),
        ),
      ],
    );
  }
}
