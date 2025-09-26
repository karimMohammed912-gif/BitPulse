import 'package:equatable/equatable.dart';

import 'description.dart';

import 'image.dart';
import 'links.dart';

import 'ticker.dart';

class CryptoDetails extends Equatable {
	final String? id;
	final String? symbol;
	final String? name;
	final String? webSlug;
	final dynamic assetPlatformId;

	final num? blockTimeInMinutes;
	final String? hashingAlgorithm;
	final List<dynamic>? categories;
	final bool? previewListing;
	final dynamic publicNotice;
	final List<dynamic>? additionalNotices;
	final Description? description;
	final Links? links;
	final Image? image;
	final String? countryOrigin;
	final String? genesisDate;
	final num? sentimentVotesUpPercentage;
	final num? sentimentVotesDownPercentage;
	final num? watchlistPortfolioUsers;
	final num? marketCapRank;
	final List<dynamic>? statusUpdates;
	final DateTime? lastUpdated;
	final List<Ticker>? tickers;

	const CryptoDetails({
		this.id, 
		this.symbol, 
		this.name, 
		this.webSlug, 
		this.assetPlatformId, 
 
		this.blockTimeInMinutes, 
		this.hashingAlgorithm, 
		this.categories, 
		this.previewListing, 
		this.publicNotice, 
		this.additionalNotices, 
		this.description, 
		this.links, 
		this.image, 
		this.countryOrigin, 
		this.genesisDate, 
		this.sentimentVotesUpPercentage, 
		this.sentimentVotesDownPercentage, 
		this.watchlistPortfolioUsers, 
		this.marketCapRank, 
		this.statusUpdates, 
		this.lastUpdated, 
		this.tickers, 
	});

	factory CryptoDetails.fromJson(Map<String, dynamic> json) => CryptoDetails(
				id: json['id'] as String?,
				symbol: json['symbol'] as String?,
				name: json['name'] as String?,
				webSlug: json['web_slug'] as String?,
				assetPlatformId: json['asset_platform_id'] as dynamic,
			
				blockTimeInMinutes: json['block_time_in_minutes'] as num?,
				hashingAlgorithm: json['hashing_algorithm'] as String?,
				categories: json['categories'] as List<dynamic>?,
				previewListing: json['preview_listing'] as bool?,
				publicNotice: json['public_notice'] as dynamic,
				additionalNotices: json['additional_notices'] as List<dynamic>?,
				description: json['description'] == null
						? null
						: Description.fromJson(json['description'] as Map<String, dynamic>),
				links: json['links'] == null
						? null
						: Links.fromJson(json['links'] as Map<String, dynamic>),
				image: json['image'] == null
						? null
						: Image.fromJson(json['image'] as Map<String, dynamic>),
				countryOrigin: json['country_origin'] as String?,
				genesisDate: json['genesis_date'] as String?,
				sentimentVotesUpPercentage: (json['sentiment_votes_up_percentage'] as num?)?.toDouble(),
				sentimentVotesDownPercentage: (json['sentiment_votes_down_percentage'] as num?)?.toDouble(),
				watchlistPortfolioUsers: json['watchlist_portfolio_users'] as num?,
				marketCapRank: json['market_cap_rank'] as num?,
				statusUpdates: json['status_updates'] as List<dynamic>?,
				lastUpdated: json['last_updated'] == null
						? null
						: DateTime.parse(json['last_updated'] as String),
				tickers: (json['tickers'] as List<dynamic>?)
						?.map((e) => Ticker.fromJson(e as Map<String, dynamic>))
						.toList(),
			);

	Map<String, dynamic> toJson() => {
				'id': id,
				'symbol': symbol,
				'name': name,
				'web_slug': webSlug,
				'asset_platform_id': assetPlatformId,

				'block_time_in_minutes': blockTimeInMinutes,
				'hashing_algorithm': hashingAlgorithm,
				'categories': categories,
				'preview_listing': previewListing,
				'public_notice': publicNotice,
				'additional_notices': additionalNotices,
				'description': description?.toJson(),
				'links': links?.toJson(),
				'image': image?.toJson(),
				'country_origin': countryOrigin,
				'genesis_date': genesisDate,
				'sentiment_votes_up_percentage': sentimentVotesUpPercentage,
				'sentiment_votes_down_percentage': sentimentVotesDownPercentage,
				'watchlist_portfolio_users': watchlistPortfolioUsers,
				'market_cap_rank': marketCapRank,
				'status_updates': statusUpdates,
				'last_updated': lastUpdated?.toIso8601String(),
				'tickers': tickers?.map((e) => e.toJson()).toList(),
			};

	@override
	List<Object?> get props {
		return [
				id,
				symbol,
				name,
				webSlug,
				assetPlatformId,

				blockTimeInMinutes,
				hashingAlgorithm,
				categories,
				previewListing,
				publicNotice,
				additionalNotices,
				description,
				links,
				image,
				countryOrigin,
				genesisDate,
				sentimentVotesUpPercentage,
				sentimentVotesDownPercentage,
				watchlistPortfolioUsers,
				marketCapRank,
				statusUpdates,
				lastUpdated,
				tickers,
		];
	}
}
