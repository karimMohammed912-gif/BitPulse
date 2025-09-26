import 'package:equatable/equatable.dart';

import 'repos_url.dart';

class Links extends Equatable {
	final List<dynamic>? homepage;
	final String? whitepaper;
	final List<dynamic>? blockchainSite;
	final List<dynamic>? officialForumUrl;
	final List<dynamic>? chatUrl;
	final List<dynamic>? announcementUrl;
	final dynamic snapshotUrl;
	final String? twitterScreenName;
	final String? facebookUsername;
	final dynamic bitcointalkThreadIdentifier;
	final String? telegramChannelIdentifier;
	final String? subredditUrl;
	final ReposUrl? reposUrl;

	const Links({
		this.homepage, 
		this.whitepaper, 
		this.blockchainSite, 
		this.officialForumUrl, 
		this.chatUrl, 
		this.announcementUrl, 
		this.snapshotUrl, 
		this.twitterScreenName, 
		this.facebookUsername, 
		this.bitcointalkThreadIdentifier, 
		this.telegramChannelIdentifier, 
		this.subredditUrl, 
		this.reposUrl, 
	});

	factory Links.fromJson(Map<String, dynamic> json) => Links(
				homepage: json['homepage'] as List<dynamic>?,
				whitepaper: json['whitepaper'] as String?,
				blockchainSite: json['blockchain_site'] as List<dynamic>?,
				officialForumUrl: json['official_forum_url'] as List<dynamic>?,
				chatUrl: json['chat_url'] as List<dynamic>?,
				announcementUrl: json['announcement_url'] as List<dynamic>?,
				snapshotUrl: json['snapshot_url'] as dynamic,
				twitterScreenName: json['twitter_screen_name'] as String?,
				facebookUsername: json['facebook_username'] as String?,
				bitcointalkThreadIdentifier: json['bitcointalk_thread_identifier'] as dynamic,
				telegramChannelIdentifier: json['telegram_channel_identifier'] as String?,
				subredditUrl: json['subreddit_url'] as String?,
				reposUrl: json['repos_url'] == null
						? null
						: ReposUrl.fromJson(json['repos_url'] as Map<String, dynamic>),
			);

	Map<String, dynamic> toJson() => {
				'homepage': homepage,
				'whitepaper': whitepaper,
				'blockchain_site': blockchainSite,
				'official_forum_url': officialForumUrl,
				'chat_url': chatUrl,
				'announcement_url': announcementUrl,
				'snapshot_url': snapshotUrl,
				'twitter_screen_name': twitterScreenName,
				'facebook_username': facebookUsername,
				'bitcointalk_thread_identifier': bitcointalkThreadIdentifier,
				'telegram_channel_identifier': telegramChannelIdentifier,
				'subreddit_url': subredditUrl,
				'repos_url': reposUrl?.toJson(),
			};

	@override
	List<Object?> get props {
		return [
				homepage,
				whitepaper,
				blockchainSite,
				officialForumUrl,
				chatUrl,
				announcementUrl,
				snapshotUrl,
				twitterScreenName,
				facebookUsername,
				bitcointalkThreadIdentifier,
				telegramChannelIdentifier,
				subredditUrl,
				reposUrl,
		];
	}
}
