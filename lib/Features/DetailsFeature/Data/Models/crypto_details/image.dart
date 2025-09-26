import 'package:equatable/equatable.dart';

class Image extends Equatable {
	final String? thumb;
	final String? small;
	final String? large;

	const Image({this.thumb, this.small, this.large});

	factory Image.fromJson(Map<String, dynamic> json) => Image(
				thumb: json['thumb'] as String?,
				small: json['small'] as String?,
				large: json['large'] as String?,
			);

	Map<String, dynamic> toJson() => {
				'thumb': thumb,
				'small': small,
				'large': large,
			};

	@override
	List<Object?> get props => [thumb, small, large];
}
