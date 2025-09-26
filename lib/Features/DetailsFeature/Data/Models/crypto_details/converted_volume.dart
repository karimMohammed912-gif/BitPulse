import 'package:equatable/equatable.dart';

class ConvertedVolume extends Equatable {
	final num? btc;
	final num? eth;
	final num? usd;

	const ConvertedVolume({this.btc, this.eth, this.usd});

	factory ConvertedVolume.fromJson(Map<String, dynamic> json) {
		return ConvertedVolume(
			btc: json['btc'] as num?,
			eth: json['eth'] as num?,
			usd: json['usd'] as num?,
		);
	}



	Map<String, dynamic> toJson() => {
				'btc': btc,
				'eth': eth,
				'usd': usd,
			};

	@override
	List<Object?> get props => [btc, eth, usd];
}
