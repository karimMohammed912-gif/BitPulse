

/// Model representing the market capitalization data of a cryptocurrencyes.
class Marketcapmodel {
  final double marketCap;

  Marketcapmodel({required this.marketCap});

  factory Marketcapmodel.fromJson(Map<String, dynamic> json) {
    return Marketcapmodel(
      marketCap: json['data']["market_cap_change_percentage_24h_usd"],
    );
  }
}
