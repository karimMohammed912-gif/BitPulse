import 'package:bitpulse/Features/searchFeature/Presentation/Cubit/searchCubit.dart';
import 'package:bitpulse/core/l10n/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchInputWidget extends StatelessWidget {
  const SearchInputWidget({
    super.key,
    required FocusNode focusNode,
    required TextEditingController searchController, this.onSearchChanged,
  }) : _focusNode = focusNode, _searchController = searchController;

  final FocusNode _focusNode;
  final TextEditingController _searchController;
  final void Function(String)? onSearchChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextField(
        
        controller: _searchController,
        focusNode: _focusNode,
        onChanged: onSearchChanged,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color:Colors.green.shade50),
          ),
          labelText: AppLocalizations.of(context).Search,
          labelStyle: TextStyle(color: Colors.green.shade700),
          hintStyle: TextStyle(color:Colors.grey[600]),
          hintText: 'Search any coin (name, symbol)',
          prefixIcon: const Icon(Icons.search,
            color: Colors.grey,
          ),
          suffixIcon: _searchController.text.isNotEmpty
              ? IconButton(
                  icon: const Icon(Icons.clear,
                    color: Colors.grey,
                  ),
                  onPressed: () {
                    _searchController.clear();
                    context.read<SearchCubit>().clearSearch();
                  },
                )
              : null,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
          ),
       
       
        ),
      ),
    );
  }
}
