import 'package:equatable/equatable.dart';

class ConvertedLast extends Equatable {
	final num? btc;
	final num? eth;
	final num? usd;

	const ConvertedLast({this.btc, this.eth, this.usd});

	factory ConvertedLast.fromJson(Map<String, dynamic> json) => ConvertedLast(
				btc: (json['btc'] as num?)?.toDouble(),
				eth: (json['eth'] as num?)?.toDouble(),
				usd: json['usd'] as num?,
			);

	Map<String, dynamic> toJson() => {
				'btc': btc,
				'eth': eth,
				'usd': usd,
			};

	@override
	List<Object?> get props => [btc, eth, usd];
}
