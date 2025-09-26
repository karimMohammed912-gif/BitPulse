import 'package:equatable/equatable.dart';

import 'converted_last.dart';
import 'converted_volume.dart';
import 'market.dart';

class Ticker extends Equatable {
	final String? base;
	final String? target;
	final Market? market;
	final num? last;
	final num? volume;
	final ConvertedLast? convertedLast;
	final ConvertedVolume? convertedVolume;
	final String? trustScore;
	final num? bidAskSpreadPercentage;
	final String? timestamp;
	final String? lastTradedAt;
	final String? lastFetchAt;
	final bool? isAnomaly;
	final bool? isStale;
	final String? tradeUrl;
	final dynamic tokenInfoUrl;
	final String? coinId;
	final String? targetCoinId;

	const Ticker({
		this.base, 
		this.target, 
		this.market, 
		this.last, 
		this.volume, 
		this.convertedLast, 
		this.convertedVolume, 
		this.trustScore, 
		this.bidAskSpreadPercentage, 
		this.timestamp, 
		this.lastTradedAt, 
		this.lastFetchAt, 
		this.isAnomaly, 
		this.isStale, 
		this.tradeUrl, 
		this.tokenInfoUrl, 
		this.coinId, 
		this.targetCoinId, 
	});

	factory Ticker.fromJson(Map<String, dynamic> json) => Ticker(
				base: json['base'] as String?,
				target: json['target'] as String?,
				market: json['market'] == null
						? null
						: Market.fromJson(json['market'] as Map<String, dynamic>),
				last: (json['last'] as num?)?.toDouble(),
				volume: (json['volume'] as num?)?.toDouble(),
				convertedLast: json['converted_last'] == null
						? null
						: ConvertedLast.fromJson(json['converted_last'] as Map<String, dynamic>),
				convertedVolume: json['converted_volume'] == null
						? null
						: ConvertedVolume.fromJson(json['converted_volume'] as Map<String, dynamic>),
				trustScore: json['trust_score'] as String?,
				bidAskSpreadPercentage: (json['bid_ask_spread_percentage'] as num?)?.toDouble(),
				timestamp: json['timestamp'] as String?,
				lastTradedAt: json['last_traded_at'] as String?,
				lastFetchAt: json['last_fetch_at'] as String?,
				isAnomaly: json['is_anomaly'] as bool?,
				isStale: json['is_stale'] as bool?,
				tradeUrl: json['trade_url'] as String?,
				tokenInfoUrl: json['token_info_url'] as dynamic,
				coinId: json['coin_id'] as String?,
				targetCoinId: json['target_coin_id'] as String?,
			);

	Map<String, dynamic> toJson() => {
				'base': base,
				'target': target,
				'market': market?.toJson(),
				'last': last,
				'volume': volume,
				'converted_last': convertedLast?.toJson(),
				'converted_volume': convertedVolume?.toJson(),
				'trust_score': trustScore,
				'bid_ask_spread_percentage': bidAskSpreadPercentage,
				'timestamp': timestamp,
				'last_traded_at': lastTradedAt,
				'last_fetch_at': lastFetchAt,
				'is_anomaly': isAnomaly,
				'is_stale': isStale,
				'trade_url': tradeUrl,
				'token_info_url': tokenInfoUrl,
				'coin_id': coinId,
				'target_coin_id': targetCoinId,
			};

	@override
	List<Object?> get props {
		return [
				base,
				target,
				market,
				last,
				volume,
				convertedLast,
				convertedVolume,
				trustScore,
				bidAskSpreadPercentage,
				timestamp,
				lastTradedAt,
				lastFetchAt,
				isAnomaly,
				isStale,
				tradeUrl,
				tokenInfoUrl,
				coinId,
				targetCoinId,
		];
	}
}
