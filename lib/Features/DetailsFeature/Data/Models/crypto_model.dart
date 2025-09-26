// Data model for crypto items
class CryptoItem {
  final String symbol;
  final String name;
  final num price;
  final num amount;
  final num changePercent;
  final String imageUrl;

  const CryptoItem({
    required this.symbol,
    required this.name,
    required this.price,
    required this.amount,
    required this.changePercent,
    required this.imageUrl,
  });
}