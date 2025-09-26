import 'package:equatable/equatable.dart';

class  extends Equatable {
	final dynamic decimalPlace;
	final String? contractAddress;

	const ({this.decimalPlace, this.contractAddress});

	factory .fromJson(Map<String, dynamic> json) => (
				decimalPlace: json['decimal_place'] as dynamic,
				contractAddress: json['contract_address'] as String?,
			);

	Map<String, dynamic> toJson() => {
				'decimal_place': decimalPlace,
				'contract_address': contractAddress,
			};

	@override
	List<Object?> get props => [decimalPlace, contractAddress];
}
