class ChartDataModel {
  final List<ChartPoint> prices;
  final List<ChartPoint> marketCaps;
  final List<ChartPoint> totalVolumes;

  ChartDataModel({
    required this.prices,
    required this.marketCaps,
    required this.totalVolumes,
  });

  factory ChartDataModel.fromJson(Map<String, dynamic> json) {
    return ChartDataModel(
      prices: _parseData(json['prices']),
      marketCaps: _parseData(json['market_caps']),
      totalVolumes: _parseData(json['total_volumes']),
    );
  }

  static List<ChartPoint> _parseData(List<dynamic>? data) {
    if (data == null) return [];
    return data.map((item) => ChartPoint.fromList(item)).toList();
  }
}

class ChartPoint {
  final double timestamp;
  final double value;

  ChartPoint({required this.timestamp, required this.value});

  factory ChartPoint.fromList(List<dynamic> data) {
    return ChartPoint(
      timestamp: data[0].toDouble(),
      value: data[1].toDouble(),
    );
  }

  // Convert UNIX timestamp to readable date
  DateTime get date => DateTime.fromMillisecondsSinceEpoch(timestamp.toInt());

  String get formattedDate {
    final d = date;
    return '${d.day}/${d.month}/${d.year}';
  }

  String get shortDate {
    final d = date;
    final months = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
                   'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'];
    return '${d.day} ${months[d.month - 1]}';
  }

  @override
  String toString() => 'ChartPoint(value: $value, date: $formattedDate)';
}