import 'package:equatable/equatable.dart';

class Description extends Equatable {
	final String? en;

	const Description({this.en});

	factory Description.fromJson(Map<String, dynamic> json) => Description(
				en: json['en'] as String?,
			);

	Map<String, dynamic> toJson() => {
				'en': en,
			};

	@override
	List<Object?> get props => [en];
}
