class CurrencyExchange {
  final double fromPrice;
  final double toPrice;

  CurrencyExchange({
    required this.fromPrice,
    required this.toPrice,
  });

  // Updated factory that takes currency IDs to map correctly
  factory CurrencyExchange.fromJson(
    Map<String, dynamic> json,
    String fromCurrency,
    String toCurrency,
  ) {
    // Extract prices using currency IDs (order-independent)
    final fromPrice = (json[fromCurrency]?['usd'] ?? 0).toDouble();
    final toPrice = (json[toCurrency]?['usd'] ?? 0).toDouble();
    
    return CurrencyExchange(
      fromPrice: fromPrice,
      toPrice: toPrice,
    );
  }



  @override
  String toString() {
    return 'CurrencyExchange(fromPrice: \$$fromPrice, toPrice: \$$toPrice)';
  }


}