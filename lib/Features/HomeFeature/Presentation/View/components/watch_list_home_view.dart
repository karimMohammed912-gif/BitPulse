import 'package:bitpulse/Features/HomeFeature/Data/Model/starred_crypto/starred_crypto.dart';
import 'package:bitpulse/Features/HomeFeature/Presentation/View/components/crypto_Item_widget.dart';
import 'package:bitpulse/core/extension/item_animation.dart';
import 'package:bitpulse/core/l10n/generated/l10n.dart';

import 'package:flutter/material.dart';

class WatchListViewHome extends StatelessWidget {
  const WatchListViewHome({super.key, required this.crypto});
  final List<StarredCrypto> crypto;

  @override
  Widget build(BuildContext context) {
    if (crypto.isEmpty) {
      // Show a message when there are no starred cryptos
      return SliverToBoxAdapter(
        child: Card(
          child: SizedBox(
            height: 120,
            child:  Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.star_border, size: 40, color: Colors.grey),
                  SizedBox(height: 8),
                  Text(
                   AppLocalizations.of(context).No_favorites_yet,
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    AppLocalizations.of(context).tap_the_star_icon_on_a_crypto_to_add_it_to_your_favorites,
                    style: TextStyle(color: Colors.grey, fontSize: 12),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    }
    // Display the list of starred cryptos
    return SliverToBoxAdapter(
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.25,
        child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          itemCount: crypto.length,
          padding: EdgeInsets.zero,
          itemBuilder: (context, index) {
            final cryptoItem = crypto[index];
            return Padding(
              padding: const EdgeInsets.only(right: 12.0),
              child: SizedBox(
                width: 200,
                child: CryptoItemWidget(
                  crypto: cryptoItem,
                ).fadeInAnimation(index),
              ),
            );
          },
        ),
      ),
    );
  }
}
