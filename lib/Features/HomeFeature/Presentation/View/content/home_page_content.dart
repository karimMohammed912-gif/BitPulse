import 'package:bitpulse/Features/HomeFeature/Presentation/View/components/Home_Components/home_body_success.dart';
import 'package:bitpulse/Features/HomeFeature/Presentation/View/components/initial_view.dart';
import 'package:bitpulse/Features/HomeFeature/Presentation/View/cubit/home_cubit_cubit.dart';
import 'package:bitpulse/core/widgets/error_widget.dart';
import 'package:bitpulse/core/widgets/loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePageContent extends StatefulWidget {
  const HomePageContent({super.key});

  @override
  State<HomePageContent> createState() => _HomePageContentState();
}

class _HomePageContentState extends State<HomePageContent> with AutomaticKeepAliveClientMixin {

  @override
  bool get wantKeepAlive => true;

  // Add pull-to-refresh functionality
  Future<void> _onRefresh() async {
    context.read<HomeCubit>().loadCryptoData(forceRefresh: true);
  }

  @override
  Widget build(BuildContext context) {
    super.build(context); // Important: call super.build when using AutomaticKeepAliveClientMixin
    final screenHeight = MediaQuery.of(context).size.height;

    return BlocBuilder<HomeCubit, HomeCubitState>(
      builder: (context, state) {
        return switch (state) {
          HomeCubitLoading() => _buildLoadingState(),
          HomeCubitSuccess() => _buildSuccessState(state, screenHeight),
          HomeCubitError() => _buildErrorState(state.message),
          _ => _buildInitialState(),
        };
      },
    );
  }

  Widget _buildLoadingState() {
    return LoadingWidget();
  }

  Widget _buildSuccessState(HomeCubitSuccess state, double screenHeight) {
    return RefreshIndicator(
      onRefresh: _onRefresh,
      child: HomeBodySuccess(
        state: state,
 
      ),
    );
  }

  Widget _buildErrorState(String message) {
    return FaildWidget(
      errorMessage: message,
     
      reloadFunction: _onRefresh, onRefresh: _onRefresh,
    );
  }

  Widget _buildInitialState() {
    return  InitialView(context: context);
  }
}
