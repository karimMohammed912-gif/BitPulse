import 'package:bitpulse/Features/HomeFeature/Data/Model/crypto_item_list/crypto_item_list.dart';
import 'package:bitpulse/core/Routes/router_config.dart';
import 'package:bitpulse/core/extension/price_formate.dart';
import 'package:bitpulse/core/widgets/price_change.dart';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CryptoPortfolioItem extends StatelessWidget {
  const CryptoPortfolioItem({super.key, required this.crypto});
  final CryptoItemList crypto;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.pushNamed(
        AppRoutes.cryptoDetailName,
        extra: crypto.id,
      ),
      child: Card(
        elevation: 2,
        margin: const EdgeInsets.symmetric(vertical: 4),
        child: Container(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              // Crypto Image - Add caching and loading optimization
              SizedBox(
                width: 40,
                height: 40,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.network(
                    crypto.image!,
                    width: 40,
                    height: 40,
                    fit: BoxFit.cover,
                    loadingBuilder: (context, child, loadingProgress) {
                      if (loadingProgress == null) return child;
                      return Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const Center(
                          child: SizedBox(
                            width: 20,
                            height: 20,
                            child: CircularProgressIndicator(strokeWidth: 2),
                          ),
                        ),
                      );
                    },
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const Icon(Icons.currency_bitcoin, color: Colors.grey),
                      );
                    },
                  ),
                ),
              ),

              const SizedBox(width: 12),

              // Name and Symbol Column
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      '${crypto.symbol!.toUpperCase()}/BUSD',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                    Text(
                      crypto.name!,
                      style: TextStyle(
                        fontSize: 12, 
                        color: Colors.grey[600],
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                  ],
                ),
              ),

              // Price and Percentage Column
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    crypto.currentPrice?.formatted ?? '0.00',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  PriceChange(crypto: crypto.priceChangePercentage24h),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
