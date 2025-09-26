import 'package:bitpulse/Features/searchFeature/Data/Model/searchModel.dart';
import 'package:flutter/material.dart';

class SuggestionListWidget extends StatelessWidget {
  const SuggestionListWidget({
    required this.onCoinSelected,
    super.key,
    required this.coins,
  });

 final void Function(CoinModel) onCoinSelected;

  final List<CoinModel> coins;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: coins.length,
      itemBuilder: (context, index) {
        final coin = coins[index];
        return Card(
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
          child: ListTile(
        
            title: Text(
              coin.name,
              style: const TextStyle(fontWeight: FontWeight.w500),
            ),
            subtitle: Text(
              coin.symbol.toUpperCase(),
              style: TextStyle(color: Colors.grey[600]),
            ),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            onTap:()=> onCoinSelected(coin),
          ),
        );
      },
    );
  }
}