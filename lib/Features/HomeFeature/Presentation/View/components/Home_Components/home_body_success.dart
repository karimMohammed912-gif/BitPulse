import 'package:bitpulse/Features/HomeFeature/Data/Model/starred_crypto/starred_crypto.dart';
import 'package:bitpulse/Features/HomeFeature/Presentation/View/components/Home_Components/hero_section.dart';
import 'package:bitpulse/Features/HomeFeature/Presentation/View/components/crypto_portfolio_item.dart';
import 'package:bitpulse/Features/HomeFeature/Presentation/View/components/Home_Components/final_scroll_widget.dart';
import 'package:bitpulse/Features/HomeFeature/Presentation/View/components/Home_Components/loading_scroll_widget.dart';
import 'package:bitpulse/Features/HomeFeature/Presentation/View/cubit/home_cubit_cubit.dart';
import 'package:bitpulse/core/extension/item_animation.dart';
import 'package:bitpulse/core/utils/star_service.dart';
import 'package:bitpulse/core/widgets/custom_more_widget.dart';
import 'package:bitpulse/Features/HomeFeature/Presentation/View/components/watch_list_home_view.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeBodySuccess extends StatefulWidget {
  const HomeBodySuccess({
    super.key,

    required this.state,
  });
  final HomeCubitSuccess state;


  @override
  State<HomeBodySuccess> createState() => _HomeBodySuccessState();
}

class _HomeBodySuccessState extends State<HomeBodySuccess> {
  late ScrollController _scrollController;
  List<StarredCrypto> _starredCryptos = [];

  @override
  void initState() {
    super.initState();


    _scrollController = ScrollController();
    _scrollController.addListener(_onScroll);

    // Load starred cryptos initially
    _loadStarredCryptos();

    // Listen to changes in the starred cryptos
    StarService.watchStars().listen((_) {
      if (mounted) {
        _loadStarredCryptos();
      }
    });
  }

  void _loadStarredCryptos() {
    try {
      setState(() {
        _starredCryptos = StarService.getAllStarred();
      });
    } catch (e) {
      debugPrint('Error loading starred cryptos: $e');
    }
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent - 200) {
      context.read<HomeCubit>().loadMoreItems();
    }
  }

  @override
  Widget build(BuildContext context) {
    final cryptoData = widget.state.cryptoItemList;
    final hasMoreData = widget.state.hasMoreData;
    final isLoadingMore = widget.state.isLoadingMore;

    return Padding(
      padding: const EdgeInsets.symmetric( horizontal: 16.0),
      child: CustomScrollView(
        controller: _scrollController,
        physics: const BouncingScrollPhysics(),
        slivers: [
          // Hero Section
          HeroSection(widget: widget),

          const SliverToBoxAdapter(child: SizedBox(height: 24)),

          // My Stars List Header
          SliverToBoxAdapter(
            child: CustomMoreWidget(text: 'My Stars List', onTap: () {}),
          ),

          const SliverToBoxAdapter(child: SizedBox(height: 16)),

          // Watch List View
          WatchListViewHome(
            crypto: _starredCryptos,
          ),

          const SliverToBoxAdapter(child: SizedBox(height: 24)),

          // Crypto List Header with count
          SliverToBoxAdapter(
            child: CustomMoreWidget(
              text:
                  'Crypto List (${cryptoData.length}/${context.read<HomeCubit>().totalCount})',
              onTap: () {},
            ),
          ),

          const SliverToBoxAdapter(child: SizedBox(height: 16)),

          // Portfolio items list
          SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
              final crypto = cryptoData[index];
              return Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: CryptoPortfolioItem(
                  crypto: crypto,
                ).slideUpFadeAnimation(index),
              );
            }, childCount: cryptoData.length),
          ),

          // Loading indicator
          if (isLoadingMore) LoadingScrollWidget(),

          // End indicator
          if (!hasMoreData && !isLoadingMore)
            FinalScrollWidget(cryptoDatalength: cryptoData.length),

          const SliverToBoxAdapter(child: SizedBox(height: 32)),
        ],
      ),
    );
  }
}
