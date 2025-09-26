import 'package:bitpulse/Features/DetailsFeature/Data/Models/crypto_details/crypto_details.dart';
import 'package:bitpulse/Features/DetailsFeature/Presentation/View/components/detailsViewComponents/card_inner_details.dart';
import 'package:bitpulse/Features/DetailsFeature/Presentation/View/components/detailsViewComponents/custom_chart.dart';
import 'package:bitpulse/Features/DetailsFeature/Presentation/View/components/detailsViewComponents/desc_widget.dart';
import 'package:bitpulse/Features/DetailsFeature/Presentation/View/components/detailsViewComponents/section1.dart';
import 'package:bitpulse/Features/DetailsFeature/Presentation/View/components/detailsViewComponents/statics_card.dart';
import 'package:bitpulse/Features/DetailsFeature/Presentation/Cubit/details_cubit.dart';
import 'package:bitpulse/core/widgets/custom_divider.dart';
import 'package:bitpulse/core/widgets/custom_more_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DetailsBody extends StatelessWidget {
  const DetailsBody({
    super.key,
    required this.cryptoDetails,
    required this.toggleFavorite,
    required this.navigateBack,
    required this.isFavorite,
  });
  final CryptoDetails cryptoDetails;
  final bool isFavorite;
  final VoidCallback toggleFavorite;
  final VoidCallback navigateBack;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: navigateBack,
          tooltip: 'Back',
        ),
        actions: [
          IconButton(
            icon: Icon(
              isFavorite ? Icons.star : Icons.star_border,
              color: isFavorite ? Colors.amber : null,
            ),
            onPressed: toggleFavorite,
            tooltip: isFavorite ? 'Remove from Favorites' : 'Add to Favorites',
          ),
        ],
        title: Text('${cryptoDetails.id!.toUpperCase()} Details'),
        centerTitle: true,
        elevation: 0,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              // Top centered crypto info section
              Section1(crypto: cryptoDetails),

              const SizedBox(height: 10),

              // Divider
              const CustomDivider(),
              const SizedBox(height: 10),
              CardDetails(
                market: cryptoDetails.marketCapRank,
                genesisDate: cryptoDetails.genesisDate,
              ),

              const SizedBox(height: 40),

              CustomPriceChart(id: cryptoDetails.id!),

              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: CustomMoreWidget(
                  text: 'Key Market Metrics',
                  onTap: () {},
                ),
              ),
              const SizedBox(height: 15),

              StaticsCard(
                title: 'Important Resourcess',
                t1: 'Homepage URL',
                t2: 'Subreddit URL',
                v1: '${cryptoDetails.links!.homepage?[0]}',
                v2: "${cryptoDetails.links?.subredditUrl ?? "N/A"} ",
              ),

              // Additional Stats Section
             

                StaticsCard(
                title: 'Key Engagement & Community',
                t1: 'Sentiment Votes Up Percentage',
                t2: 'Sentiment Votes Down Percentage',
              
                v1: context.read<DetailsCubit>().hasNull(
                  cryptoDetails.sentimentVotesUpPercentage.toString(),
                ),
                v2: context.read<DetailsCubit>().hasNull(
                  cryptoDetails.sentimentVotesDownPercentage.toString(),
                ),
               
              ),
              StaticsCard(
                title: 'Watchlist & Categories',
             
                t1: 'Watchlist Portfolio Users',
                t2: 'Categories',
            
                v1: context.read<DetailsCubit>().hasNull(
                  cryptoDetails.watchlistPortfolioUsers.toString(),
                ),
                v2: '${cryptoDetails.categories?.join(', ')}',
              ),
              DescriptionWidget(
                title: 'Description',
                description: (cryptoDetails.description?.en == "")
                    ? "No description available"
                    : cryptoDetails.description?.en
                          .toString()
                          .replaceAll(RegExp(r'<[^>]*>'), '')
                          .trim(),
              ),

              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}


// class NewWidget extends StatelessWidget {
//   const NewWidget({
//     super.key, 
//   });

//   @override
//   Widget build(BuildContext context) {
//     return ;
//   }
// }
