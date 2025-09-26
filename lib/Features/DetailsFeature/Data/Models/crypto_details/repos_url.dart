import 'package:equatable/equatable.dart';

class ReposUrl extends Equatable {
	final List<dynamic>? github;
	final List<dynamic>? bitbucket;

	const ReposUrl({this.github, this.bitbucket});

	factory ReposUrl.fromJson(Map<String, dynamic> json) => ReposUrl(
				github: json['github'] ,
				bitbucket: json['bitbucket'] as List<dynamic>?,
			);

	Map<String, dynamic> toJson() => {
				'github': github,
				'bitbucket': bitbucket,
			};

	@override
	List<Object?> get props => [github, bitbucket];
}
