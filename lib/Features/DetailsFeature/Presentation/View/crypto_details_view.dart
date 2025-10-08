import 'package:bitpulse/Features/DetailsFeature/Data/Models/crypto_details/crypto_details.dart';
import 'package:bitpulse/Features/DetailsFeature/Presentation/Cubit/chart_cubit/chart_cubit_cubit.dart';
import 'package:bitpulse/Features/DetailsFeature/Presentation/Cubit/details_state.dart';
import 'package:bitpulse/Features/DetailsFeature/Presentation/View/components/detailsViewComponents/details_body.dart';
import 'package:bitpulse/Features/DetailsFeature/Presentation/Cubit/details_cubit.dart';
import 'package:bitpulse/core/Routes/router_config.dart';
import 'package:bitpulse/core/Themes/colors.dart';
import 'package:bitpulse/core/l10n/generated/l10n.dart';
import 'package:bitpulse/core/widgets/error_widget.dart';
import 'package:bitpulse/core/widgets/loading_widget.dart';
import 'package:bitpulse/core/utils/star_service.dart';
import 'package:bitpulse/Features/HomeFeature/Data/Model/crypto_item_list/crypto_item_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class CryptoDetailsView extends StatefulWidget {
  const CryptoDetailsView({super.key, required this.cryptoId});
  final String cryptoId;

  @override
  State<CryptoDetailsView> createState() => _CryptoDetailsViewState();
}

class _CryptoDetailsViewState extends State<CryptoDetailsView> {
  bool _isFavorite = false;
  CryptoDetails? _currentCryptoDetails;

  @override
  void initState() {
    super.initState();
    _checkIfFavorite();
    context.read<DetailsCubit>().fetchDetailsOnly(widget.cryptoId);
    // context.read<DetailsCubit>().fetchChartData(widget.cryptoId);
  }

  void _checkIfFavorite() {
    try {
      setState(() {
        _isFavorite = StarService.isStarred(widget.cryptoId);
      });
    } catch (e) {
      debugPrint('Error checking favorite status: $e');
    }
  }

  Future<void> _navigateBack() async {
    // Always use pop to go back to the previous screen without rebuilding
    if (Navigator.of(context).canPop()) {
      Navigator.of(context).pop();
    } else {
      // Fallback only if there's no previous screen
      context.goNamed(AppRoutes.homeName);
    }
  }

  Future<void> _toggleFavorite() async {
    if (_currentCryptoDetails == null) {
      ScaffoldMessenger.of(context).showSnackBar(
         SnackBar(
          content: Text(AppLocalizations.of(context).Please_wait_while_crypto_details_are_loading),
          backgroundColor: Colors.orange,
          duration: Duration(seconds: 2),
        ),
      );
      return;
    }

    try {
      if (_isFavorite) {
        // Remove from favorites
        await StarService.removeFromStars(widget.cryptoId);
        setState(() {
          _isFavorite = false;
        });

        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                '${_currentCryptoDetails!.name} ${AppLocalizations.of(context).removed_from_favorites}',
              ),
              backgroundColor: Colors.orange,
              duration: const Duration(seconds: 2),
            ),
          );
        }
      } else {
        // Add to favorites - create CryptoItemList from CryptoDetails
        final cryptoItem = CryptoItemList(
          id: _currentCryptoDetails!.id,
          name: _currentCryptoDetails!.name,
          symbol: _currentCryptoDetails!.symbol,
          image:
              _currentCryptoDetails!.image?.large ??
              _currentCryptoDetails!.image?.small ??
              '',
        );

        await StarService.addToStars(cryptoItem);
        setState(() {
          _isFavorite = true;
        });

        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                '${_currentCryptoDetails!.name} ${AppLocalizations.of(context).add_to_favorites}',
              ),
              backgroundColor: AppColors.primary,
              duration: const Duration(seconds: 2),
            ),
          );
        }
      }
    } catch (e) {
      debugPrint('Error toggling favorite: $e');
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
           SnackBar(
            content: Text(AppLocalizations.of(context).Something_went_wrong),
            backgroundColor: Colors.red,
            duration: Duration(seconds: 2),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DetailsCubit, DetailsCubitState>(
      builder: (context, state) {
        return switch (state) {
          DetailsCubitLoading() => _buildLoadingState(),
          DetailsCubitSuccess() => _buildSuccessState(state.cryptoDetails),
          DetailsCubitFailure() => buildErrorState(state.message),
          _ => _buildEmptyState(),
        };
      },
    );
  }

  Widget _buildLoadingState() {
    return LoadingWidget();
  }

  Widget _buildSuccessState(CryptoDetails cryptoDetails) {
    // Store the current crypto details for use in toggle favorite
    _currentCryptoDetails = cryptoDetails;

    return BlocProvider(
      create: (context) => ChartCubitCubit(),
      child: DetailsBody(
        cryptoDetails: cryptoDetails,
        toggleFavorite: _toggleFavorite,
        navigateBack: _navigateBack,
        isFavorite: _isFavorite,
      ),
    );
  }

  Widget buildErrorState(String errorMessage) {
    return Scaffold(
      body: FaildWidget(
        errorMessage: errorMessage,
        onPressed: _navigateBack,
        reloadFunction: _navigateBack,
        onRefresh: _navigateBack,
      ),
    );
  }

  Widget _buildEmptyState() {
    return  Center(
      child: Text(
        AppLocalizations.of(context).No_data_available,
        style: const TextStyle(fontSize: 16, color: AppColors.grey),
      ),
    );
  }
}
