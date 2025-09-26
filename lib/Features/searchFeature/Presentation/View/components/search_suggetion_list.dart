import 'package:bitpulse/Features/searchFeature/Data/Model/searchModel.dart';
import 'package:bitpulse/Features/searchFeature/Presentation/Cubit/searchCubit.dart';
import 'package:bitpulse/Features/searchFeature/Presentation/View/components/suggestion_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchSuggetionList extends StatelessWidget {
  const SearchSuggetionList({
    super.key, required this.onCoinSelected,
  });
final void Function(CoinModel) onCoinSelected;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocBuilder<SearchCubit, SearchState>(
        builder: (context, state) {
          if (state is SearchLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is SearchSuccess) {
            return SuggestionListWidget(coins: state.coins, onCoinSelected: onCoinSelected);
          } else if (state is SearchError) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.error, size: 64, color: Colors.red),
                  const SizedBox(height: 16),
                  Text(
                    state.message,
                    textAlign: TextAlign.center,
                    style: const TextStyle(color: Colors.red),
                  ),
                ],
              ),
            );
          } else if (state is SearchEmpty) {
            return const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.search_off, size: 64, color: Colors.grey),
                  SizedBox(height: 16),
                  Text(
                    'No coins found',
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            );
          }
          
          return const Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.search, size: 64, color: Colors.grey),
                SizedBox(height: 16),
                Text(
                  'Start typing to search for coins',
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
