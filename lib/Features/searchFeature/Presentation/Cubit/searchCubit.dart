import 'package:bitpulse/Features/searchFeature/Data/Model/searchModel.dart';
import 'package:bitpulse/Features/searchFeature/Data/Service/searchService.dart';
import 'package:bloc/bloc.dart';

// Search States
abstract class SearchState {}

class SearchInitial extends SearchState {}

class SearchLoading extends SearchState {}

class SearchSuccess extends SearchState {
  final List<CoinModel> coins;
  
  SearchSuccess(this.coins);
}

class SearchError extends SearchState {
  final String message;
  
  SearchError(this.message);
}

class SearchEmpty extends SearchState {}

// Search Cubit
class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchInitial());

  Future<void> searchCoins(String query) async {
    if (query.isEmpty) {
      emit(SearchEmpty());
      return;
    }
//do || in the first if statement

    if (query.length < 2) {
      return; // Don't search for single characters
    }

    emit(SearchLoading());

    try {
      final coins = await SearchService.searchCoins(query);
      
      if (coins.isEmpty) {
        emit(SearchEmpty());
      } else {
        emit(SearchSuccess(coins));
      }
    } catch (e) {
      emit(SearchError('Failed to search coins: $e'));
    }
  }

  void clearSearch() {
    emit(SearchInitial());
  }
}