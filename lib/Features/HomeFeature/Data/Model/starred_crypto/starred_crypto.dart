import 'package:hive/hive.dart';

part 'starred_crypto.g.dart';


/// Model representing a starred cryptocurrency
/// This model is used to store information about cryptocurrencies that a user has starred.
@HiveType(typeId: 0)
class StarredCrypto extends HiveObject {
  @HiveField(0)
  String id;

  @HiveField(1)
  String name;

  @HiveField(2)
  String symbol;

  @HiveField(3)
  String image;

  @HiveField(4)
  DateTime starredAt;

  StarredCrypto({
    required this.id,
    required this.name,
    required this.symbol,
    required this.image,

    required this.starredAt,
  });
}
