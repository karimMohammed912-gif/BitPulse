

import 'package:hive/hive.dart';


part 'crypto_item_list.g.dart';

/// Model representing a cryptocurrency item in the Home feature.
@HiveType(typeId: 0)
class CryptoItemList extends HiveObject {
   
    @HiveField(0)
    final String? id;
    @HiveField(1)
    final String? symbol;
    @HiveField(2)
    final String? name;
    @HiveField(3)
    final String? image;
    @HiveField(4)
    final double? currentPrice;
    @HiveField(5)
    final double? marketCap;
    @HiveField(6)
    final double? marketCapRank;
    @HiveField(7)
    final double? fullyDilutedValuation;
    @HiveField(8)
    final double? totalVolume;
    @HiveField(9)
    final double? high24h;
    @HiveField(10)
    final double? low24h;
    @HiveField(11)
    final double? priceChange24h;
    @HiveField(12)
    final double? priceChangePercentage24h;
    @HiveField(13)
    final double? marketCapChange24h;
    @HiveField(14)
    final double? marketCapChangePercentage24h;
    @HiveField(15)
    final double? circulatingSupply;
    @HiveField(16)
    final double? totalSupply;
    @HiveField(17)
    final double? maxSupply;
    @HiveField(18)
    final double? ath;
    @HiveField(19)
    final double? athChangePercentage;
    
    final DateTime? athDate;
    @HiveField(20)
    final double? atl;
    @HiveField(21)
    final double? atlChangePercentage;
    @HiveField(22)
    final DateTime? atlDate;
    @HiveField(23)
    final dynamic roi;
    @HiveField(24)
    final DateTime? lastUpdated;

    CryptoItemList({
        this.id, 
        this.symbol, 
        this.name, 
        this.image, 
        this.currentPrice, 
        this.marketCap, 
        this.marketCapRank, 
        this.fullyDilutedValuation, 
        this.totalVolume, 
        this.high24h, 
        this.low24h, 
        this.priceChange24h, 
        this.priceChangePercentage24h, 
        this.marketCapChange24h, 
        this.marketCapChangePercentage24h, 
        this.circulatingSupply, 
        this.totalSupply, 
        this.maxSupply, 
        this.ath, 
        this.athChangePercentage, 
        this.athDate, 
        this.atl, 
        this.atlChangePercentage, 
        this.atlDate, 
        this.roi, 
        this.lastUpdated, 
    });

    factory CryptoItemList.fromJson(Map<String, dynamic> json) {
        return CryptoItemList(
            id: json['id'] as String?,
            symbol: json['symbol'] as String?,
            name: json['name'] as String?,
            image: json['image'] as String?,
            currentPrice: (json['current_price'] as num?)?.toDouble(),
            marketCap: (json['market_cap'] as num?)?.toDouble(),
            marketCapRank: (json['market_cap_rank'] as num?)?.toDouble(),
            fullyDilutedValuation: (json['fully_diluted_valuation'] as num?)?.toDouble(),
            totalVolume: (json['total_volume'] as num?)?.toDouble(),
            high24h: (json['high_24h'] as num?)?.toDouble(),
            low24h: (json['low_24h'] as num?)?.toDouble(),
            priceChange24h: (json['price_change_24h'] as num?)?.toDouble(),
            priceChangePercentage24h: (json['price_change_percentage_24h'] as num?)?.toDouble(),
            marketCapChange24h: (json['market_cap_change_24h'] as num?)?.toDouble(),
            marketCapChangePercentage24h: (json['market_cap_change_percentage_24h'] as num?)?.toDouble(),
            circulatingSupply: (json['circulating_supply'] as num?)?.toDouble(),
            totalSupply: (json['total_supply'] as num?)?.toDouble(),
            maxSupply: (json['max_supply'] as num?)?.toDouble(),
            ath: (json['ath'] as num?)?.toDouble(),
            athChangePercentage: (json['ath_change_percentage'] as num?)?.toDouble(),
            athDate: json['ath_date'] == null
                        ? null
                        : DateTime.parse(json['ath_date'] as String),
            atl: (json['atl'] as num?)?.toDouble(),
            atlChangePercentage: (json['atl_change_percentage'] as num?)?.toDouble(),
            atlDate: json['atl_date'] == null
                        ? null
                        : DateTime.parse(json['atl_date'] as String),
            roi: json['roi'] as dynamic,
            lastUpdated: json['last_updated'] == null
                        ? null
                        : DateTime.parse(json['last_updated'] as String),
        );
    }

    Map<String, dynamic> toJson() => {
                'id': id,
                'symbol': symbol,
                'name': name,
                'image': image,
                'current_price': currentPrice,
                'market_cap': marketCap,
                'market_cap_rank': marketCapRank,
                'fully_diluted_valuation': fullyDilutedValuation,
                'total_volume': totalVolume,
                'high_24h': high24h,
                'low_24h': low24h,
                'price_change_24h': priceChange24h,
                'price_change_percentage_24h': priceChangePercentage24h,
                'market_cap_change_24h': marketCapChange24h,
                'market_cap_change_percentage_24h': marketCapChangePercentage24h,
                'circulating_supply': circulatingSupply,
                'total_supply': totalSupply,
                'max_supply': maxSupply,
                'ath': ath,
                'ath_change_percentage': athChangePercentage,
                'ath_date': athDate?.toIso8601String(),
                'atl': atl,
                'atl_change_percentage': atlChangePercentage,
                'atl_date': atlDate?.toIso8601String(),
                'roi': roi,
                'last_updated': lastUpdated?.toIso8601String(),
            };

}
