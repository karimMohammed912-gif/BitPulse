import 'package:bitpulse/Features/HomeFeature/Data/Model/starred_crypto/starred_crypto.dart';
import 'package:bitpulse/core/Routes/router_config.dart';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CryptoItemWidget extends StatelessWidget {
  final StarredCrypto crypto;

  const CryptoItemWidget({super.key, required this.crypto});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigate to the crypto detail page
        context.pushNamed(
          AppRoutes.cryptoDetailName,
          extra: crypto.id, // Use ID for navigation
        );
      },
      child: AspectRatio(
        aspectRatio: 1.5, // Width is 1.5 times the height
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,

              children: [
                // Crypto image
                SizedBox(height: 6),
                Container(
                  width: 45,
                  height: 45,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(17.5),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withAlpha(25),
                        blurRadius: 5,
                        offset: const Offset(0, 1),
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(17.5),
                    child: Image.network(
                      crypto.image,
                      width: 35,
                      height: 35,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return const Icon(
                          Icons.currency_bitcoin,
                          color: Colors.orange,
                          size: 20,
                        );
                      },
                    ),
                  ),
                ),

                const SizedBox(height: 10),
                Text(
                  crypto.symbol,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[600],
                    fontWeight: FontWeight.w500,

                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  crypto.name,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 4),

                Divider(
                  color: Colors.grey[300],
                  thickness: 1,
                  indent: 8,
                  height: 10,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
