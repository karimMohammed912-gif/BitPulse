import 'package:bitpulse/Features/HomeFeature/Data/Model/starred_crypto/starred_crypto.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'package:bitpulse/Features/HomeFeature/Data/Model/crypto_item_list/crypto_item_list.dart';

class StarService {
  static const String _boxName = 'starred_cryptos';
  static Box<StarredCrypto>? _box;

  // Initialize Hive and register the adapter
  static Future<void> init() async {
    try {
      await Hive.initFlutter();
// Register the adapter for StarredCrypto
      if (!Hive.isAdapterRegistered(0)) {
        Hive.registerAdapter(StarredCryptoAdapter());
      }
      _box = await Hive.openBox<StarredCrypto>(_boxName);
    } catch (e) {
      rethrow;
    }
  }

  static Box<StarredCrypto> get box {
    if (_box == null || !_box!.isOpen) {
      throw Exception('Hive box not initialized');
    }
    return _box!;
  }

  // add Crypto to Satrs List
  static Future<void> addToStars(CryptoItemList crypto) async {
    try {
 
      final starredCrypto = StarredCrypto(
        id: crypto.id ?? '',
        name: crypto.name ?? '',
        symbol: crypto.symbol ?? '',
        image: crypto.image ?? '',
        starredAt: DateTime.now(),
       
      );

      await box.put(crypto.id, starredCrypto);
    } catch (e) {
      rethrow;
    }
  }

  // Remove Crypto to Satrs List
  static Future<void> removeFromStars(String cryptoId) async {
    await box.delete(cryptoId);
  }

  // check if Crypto is in Stars List
  static bool isStarred(String cryptoId) {
    return box.containsKey(cryptoId);
  }

  // retrieve all starred cryptos
  static List<StarredCrypto> getAllStarred() {
    return box.values.toList()
      ..sort((a, b) => b.starredAt.compareTo(a.starredAt));
  }

  // retrieve a specific starred crypto by ID
  static int getStarredCount() {
    return box.length;
  }

  // clear all starred cryptos
  static Future<void> clearAllStars() async {
    await box.clear();
  }

  // watch for changes in starred cryptos
  static Stream<BoxEvent> watchStars() {
    return box.watch();
  }
}
