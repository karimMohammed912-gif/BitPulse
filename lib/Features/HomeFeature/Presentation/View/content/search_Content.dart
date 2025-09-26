
import 'package:bitpulse/Features/searchFeature/Presentation/Cubit/searchCubit.dart';
import 'package:bitpulse/Features/searchFeature/Presentation/View/searchWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchContent extends StatelessWidget {
  const SearchContent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchCubit(),
      child: const SearchWidget(),
    );
  }
}