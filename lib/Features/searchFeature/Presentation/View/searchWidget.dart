
import 'package:bitpulse/Features/searchFeature/Presentation/Cubit/searchCubit.dart';
import 'package:bitpulse/Features/searchFeature/Data/Model/searchModel.dart';
import 'package:bitpulse/Features/searchFeature/Presentation/View/components/coinPage.dart';
import 'package:bitpulse/Features/searchFeature/Presentation/View/components/search_suggetion_list.dart';
import 'package:bitpulse/core/extension/routes_extension.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchWidget extends StatefulWidget {
  const SearchWidget({super.key});

  @override
  State<SearchWidget> createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  final TextEditingController _searchController = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  bool _showSuggestions = false;

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      setState(() {
        _showSuggestions = _focusNode.hasFocus;
      });
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  

  void _onSearchChanged(String query) {
    context.read<SearchCubit>().searchCoins(query);
  }

  void _onCoinSelected(CoinModel coin) {
    _searchController.clear();
    _focusNode.unfocus();
    setState(() {
      _showSuggestions = false;
    });
    
    // Navigate to coin details
    context.goToCryptoDetail(coin.id);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Search Input
        SearchInputWidget(onSearchChanged:_onSearchChanged ,focusNode: _focusNode, searchController: _searchController),

        // Search Suggestions
        if (_showSuggestions)
          SearchSuggetionList(onCoinSelected: _onCoinSelected),
      ],
    );
  }
}
