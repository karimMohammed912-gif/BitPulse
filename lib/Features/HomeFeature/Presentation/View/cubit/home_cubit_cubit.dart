import 'package:bitpulse/Features/HomeFeature/Data/Model/crypto_item_list/crypto_item_list.dart';
import 'package:bitpulse/Features/HomeFeature/Data/repo/home_repoImp.dart';
import 'package:bitpulse/core/Themes/theme_cubit.dart';
import 'package:bitpulse/core/utils/star_service.dart';
import 'package:bitpulse/core/widgets/custom_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';

part 'home_cubit_state.dart';

class HomeCubit extends Cubit<HomeCubitState> {
  List<CryptoItemList> _allCryptoData = [];
  int _displayedItemsCount = 10;
  bool _isLoadingMore = false;
  static const int _itemsPerPage = 10;

  // Caching variables
  List<CryptoItemList>? _cachedCryptoData;
  DateTime? _lastFetchTime;
  static const Duration _cacheTimeout = Duration(minutes: 5);

  // Add caching variable
  List<Map<String, String>>? _cachedCurrencies;

  HomeCubit() : super(HomeCubitInitial());

  void loadCryptoData({bool forceRefresh = false}) {
    // Check if we have cached data and it's still fresh
    if (!forceRefresh &&
        _cachedCryptoData != null &&
        _lastFetchTime != null &&
        DateTime.now().difference(_lastFetchTime!) < _cacheTimeout) {
      _allCryptoData = _cachedCryptoData!;
      _displayedItemsCount = 10;
      _isLoadingMore = false;

      emit(
        HomeCubitSuccess(
          _getDisplayedItems(),
          hasMoreData: _hasMoreItems(),
          isLoadingMore: false,
        ),
      );
      return;
    }

    emit(HomeCubitLoading());

    try {
      HomeRepoimp homeRepo = HomeRepoimp();
      homeRepo.fetchCryptoData().then((result) {
        result.fold((failure) => emit(HomeCubitError(failure.message)), (
          cryptoItemList,
        ) {
          _allCryptoData = cryptoItemList;

          // Cache the data
          _cachedCryptoData = cryptoItemList;
          _lastFetchTime = DateTime.now();

          _displayedItemsCount = 10; // Reset to first 10 items
          _isLoadingMore = false;

          emit(
            HomeCubitSuccess(
              _getDisplayedItems(),
              hasMoreData: _hasMoreItems(),
              isLoadingMore: false,
            ),
          );
        });
      });
    } catch (e) {
      emit(HomeCubitError(e.toString()));
    }
  }

  void initialLoad(bool forceRefresh, BuildContext context) {
    if (!forceRefresh) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        BlocProvider.of<HomeCubit>(context).loadCryptoData();
        forceRefresh = true;
      });
    }
  }

  void loadMoreItems() {
    // Don't load if already loading or no more items
    if (_isLoadingMore || !_hasMoreItems()) {
      return;
    }

    _isLoadingMore = true;

    // Emit loading more state
    emit(
      HomeCubitSuccess(
        _getDisplayedItems(),
        hasMoreData: _hasMoreItems(),
        isLoadingMore: true,
      ),
    );

    // Simulate loading delay
    Future.delayed(const Duration(milliseconds: 800), () {
      _displayedItemsCount = (_displayedItemsCount + _itemsPerPage).clamp(
        0,
        _allCryptoData.length,
      );
      _isLoadingMore = false;

      emit(
        HomeCubitSuccess(
          _getDisplayedItems(),
          hasMoreData: _hasMoreItems(),
          isLoadingMore: false,
        ),
      );
    });
  }

  List<CryptoItemList> _getDisplayedItems() {
    return _allCryptoData.take(_displayedItemsCount).toList();
  }

  bool _hasMoreItems() {
    return _displayedItemsCount < _allCryptoData.length;
  }

  void resetPagination() {
    _displayedItemsCount = 10;
    _isLoadingMore = false;
  }

  // Cache management methods
  void clearCache() {
    _cachedCryptoData = null;
    _lastFetchTime = null;
  }

  bool get isCacheValid {
    return _cachedCryptoData != null &&
        _lastFetchTime != null &&
        DateTime.now().difference(_lastFetchTime!) < _cacheTimeout;
  }

  List<CryptoItemList>? noteList;
  addOrDeleteFromStarBox() {
    emit(BoxLoading());
    noteList = Hive.box<CryptoItemList>('StarsBox').values.toList();
    emit(BoxLoaded(noteList ?? []));
  }

  List<String?> getSympbols() {
    if (_allCryptoData.isEmpty) {
      
      return [];
    } else {
      return _allCryptoData.map((e) => e.symbol).toList();
    }
  }

  Future<bool> getNotificationSetting() async {
    try {
      final box = await Hive.openBox('settings');
      return box.get('notifications', defaultValue: true) as bool;
    } catch (e) {
      return true;
    }
  }

  Future<void> saveNotificationSetting(bool value) async {
    try {
      final box = await Hive.openBox('settings');
      await box.put('notifications', value);
    } catch (e) {
      print('Error saving notification setting: $e');
    }
  }

  Future<void> clearAllData(BuildContext context) async {
    try {
      // Clear all Hive boxes
      await Hive.deleteBoxFromDisk('settings');
      await StarService.clearAllStars();

      // Reset theme to default
      context.read<ThemeCubit>().changeTheme('Default');

      buildSuccesMessage(context, 'All data cleared successfully');
    } catch (e) {
      buildErrorMessage(context, 'Error clearing data: $e');
    }
  }

  // Add this method to your HomeCubit class
List<String> get top100CurrencySymbols {
  try {
    if (_allCryptoData.isEmpty) {
      return ['bitcoin', 'ethereum', 'binancecoin', 'cardano', 'solana']; // fallback
    }
    
    return _allCryptoData
        .take(100)
        .map((crypto) => crypto.id ?? crypto.name?.toLowerCase() ?? '')
        .where((symbol) => symbol.isNotEmpty)
        .toList();
  } catch (e) {
    return ['bitcoin', 'ethereum', 'binancecoin', 'cardano', 'solana'];
  }
}

// In your HomeCubit, make sure this method is efficient:
List<Map<String, String>> get top100CurrenciesWithNames {
  // Use cached result if available
  if (_cachedCurrencies != null && _cachedCurrencies!.isNotEmpty) {
    return _cachedCurrencies!;
  }

  try {
    if (_allCryptoData.isEmpty) {
      return _getDefaultCurrencies();
    }
    
    final currencies = _allCryptoData
        .take(100)
        .map((crypto) => {
          'id': crypto.id ?? '',
          'name': crypto.name ?? '',
          'symbol': crypto.symbol ?? '',
        })
        .where((currency) => currency['id']!.isNotEmpty)
        .toList();
        
    // Cache the result
    _cachedCurrencies = currencies;
    return currencies;
  } catch (e) {
    return _getDefaultCurrencies();
  }
}

List<Map<String, String>> _getDefaultCurrencies() {
  return [
    {'id': 'bitcoin', 'name': 'Bitcoin', 'symbol': 'BTC'},
    {'id': 'ethereum', 'name': 'Ethereum', 'symbol': 'ETH'},
    {'id': 'binancecoin', 'name': 'BNB', 'symbol': 'BNB'},
    {'id': 'cardano', 'name': 'Cardano', 'symbol': 'ADA'},
    {'id': 'solana', 'name': 'Solana', 'symbol': 'SOL'},
  ];
}

  // Getters for UI
  int get displayedCount => _displayedItemsCount;
  int get totalCount => _allCryptoData.length;
  bool get isLoadingMore => _isLoadingMore;
}
