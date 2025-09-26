import 'package:equatable/equatable.dart';

class Market extends Equatable {
	final String? name;
	final String? identifier;
	final bool? hasTradingIncentive;

	const Market({this.name, this.identifier, this.hasTradingIncentive});

	factory Market.fromJson(Map<String, dynamic> json) => Market(
				name: json['name'] as String?,
				identifier: json['identifier'] as String?,
				hasTradingIncentive: json['has_trading_incentive'] as bool?,
			);

	Map<String, dynamic> toJson() => {
				'name': name,
				'identifier': identifier,
				'has_trading_incentive': hasTradingIncentive,
			};

	@override
	List<Object?> get props => [name, identifier, hasTradingIncentive];
}
