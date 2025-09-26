import 'dart:convert';

import 'package:bitpulse/Features/searchFeature/Data/Model/searchModel.dart';
import 'package:http/http.dart' as http;

class SearchService {
  static const String baseUrl = 'https://api.coingecko.com/api/v3';
  static List<CoinModel>? _cachedCoins;

  // Fetch all coins list (cache it for better performance)
  static Future<List<CoinModel>> getAllCoins() async {
    if (_cachedCoins != null) {
      return _cachedCoins!;
    }
// https://api.coingecko.com/api/v3/coins/list
    try {
      final response = await http.get(
        Uri.parse('$baseUrl/coins/list'),
        headers: {'Accept': 'application/json'},
      );

      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        _cachedCoins = data.map((coin) => CoinModel.fromJson(coin)).toList();
        return _cachedCoins!;
      } else {
        throw Exception('Failed to load coins: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error fetching coins: $e');
    }
  }

  // Search coins by query
  static Future<List<CoinModel>> searchCoins(String query) async {
    if (query.isEmpty) return [];

    final allCoins = await getAllCoins();
    final lowercaseQuery = query.toLowerCase();

    return allCoins.where((coin) {
      return coin.name.toLowerCase().contains(lowercaseQuery) ||
             coin.symbol.toLowerCase().contains(lowercaseQuery) ||
             coin.id.toLowerCase().contains(lowercaseQuery);
    }).take(50).toList(); // Limit to 20 suggestions
  }

  // Get coin details by ID
  static Future<Map<String, dynamic>> getCoinDetails(String coinId) async {
    try {
      final response = await http.get(
        Uri.parse('$baseUrl/coins/$coinId'),
        headers: {'Accept': 'application/json'},
      );

      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        throw Exception('Failed to load coin details: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error fetching coin details: $e');
    }
  }
}