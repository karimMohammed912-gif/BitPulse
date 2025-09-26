class PriceFormatter {
  /// Formats price to be UI-friendly and space-efficient
  static String formatPrice(num price, {String symbol = '\$'}) {
    if (price == 0) return '${symbol}0.00';
    
    final absPrice = price.abs();
    final isNegative = price < 0;
    final prefix = isNegative ? '-$symbol' : symbol;
    
    // Large numbers - use compact notation
    if (absPrice >= 1000000000) {
      return '$prefix${(absPrice / 1000000000).toStringAsFixed(1)}B';
    }
    if (absPrice >= 1000000) {
      return '$prefix${(absPrice / 1000000).toStringAsFixed(1)}M';
    }
    if (absPrice >= 100000) {
      return '$prefix${(absPrice / 1000).toStringAsFixed(0)}K';
    }
    
    // Medium numbers (1-99,999)
    if (absPrice >= 1000) {
      return '$prefix${absPrice.toStringAsFixed(0)}';
    }
    if (absPrice >= 1) {
      return '$prefix${absPrice.toStringAsFixed(2)}';
    }
    
    // Small numbers - show meaningful digits only
    if (absPrice >= 0.01) {
      return '$prefix${absPrice.toStringAsFixed(3)}';
    }
    if (absPrice >= 0.0001) {
      return '$prefix${absPrice.toStringAsFixed(5)}';
    }
    
    // Very small numbers - scientific notation
    return '$prefix${absPrice.toStringAsExponential(1)}';
  }
}

// Extension for easy use with num (works with both int and double)
extension PriceFormatterExtension on num {
  String get formatted => PriceFormatter.formatPrice(this);
}