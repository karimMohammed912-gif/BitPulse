import 'package:bitpulse/Features/DetailsFeature/Data/Models/crypto_details/crypto_details.dart';


import 'package:flutter/material.dart';

class Section1 extends StatelessWidget {
  const Section1({
    super.key,
 required this.crypto,
  });

  final CryptoDetails crypto;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 20),
      child:  Card(
            elevation: 2,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  // Coin Image
                  Container(
                    width: 64,
                    height: 64,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(32),
                      border: Border.all(color: Colors.grey[300]!),
                    ),
                    child:crypto.image != null
                        ? ClipRRect(
                            borderRadius: BorderRadius.circular(32),
                            child: Image.network(
                              crypto.image!.large ?? '',
                              width: 64,
                              height: 64,
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) {
                                return Container(
                                  width: 64,
                                  height: 64,
                                  decoration: BoxDecoration(
                                    color: Colors.grey[200],
                                    borderRadius: BorderRadius.circular(32),
                                  ),
                                  child: const Icon(
                                    Icons.currency_bitcoin,
                                    size: 32,
                                    color: Colors.grey,
                                  ),
                                );
                              },
                            ),
                          )
                        : Container(
                            width: 64,
                            height: 64,
                            decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(32),
                            ),
                            child: const Icon(
                              Icons.currency_bitcoin,
                              size: 32,
                              color: Colors.grey,
                            ),
                          ),
                  ),
                  
                  const SizedBox(width: 16),
                  
                  // Coin Info
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          crypto.name!,
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8,
                                vertical: 4,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.blue[50],
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Text(
                                ( crypto.symbol ?? '').toString().toUpperCase(),
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.blue[700],
                                ),
                              ),
                            ),
                            
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ) 
    );
  }
}
// Column(
//         children: [
//           Container(
//             width: 80,
//             height: 80,
//             decoration: BoxDecoration(
//               color: AppColors.backgroundLight,
//               borderRadius: BorderRadius.circular(40),
//               boxShadow: [
//                 BoxShadow(
//                   color: Colors.grey.withOpacity(0.3),
//                   blurRadius: 8,
//                   offset: const Offset(0, 4),
//                 ),
//               ],
//             ),
//             child: ClipRRect(
//               borderRadius: BorderRadius.circular(40),
//               child: Image.network(
//                 "${crypto.image!.large}",
//                 width: 80,
//                 height: 80,
//                 fit: BoxFit.cover,
//                 errorBuilder: (context, error, stackTrace) {
//                   return Icon(
//                     Icons.currency_bitcoin,
//                     color: AppColors.primary,
//                     size: 40,
//                   );
//                 },
//               ),
//             ),
//           ),
//           const SizedBox(height: 20),
          
//           Text(
//            "Name :${crypto.name}",
//             style: const TextStyle(
//               fontSize: 28,
//               fontWeight: FontWeight.bold,
//               color: AppColors.textLight,
//             ),
//             textAlign: TextAlign.center,
//           ),
//           const SizedBox(height: 8),
//           Text(
//             "Symbol :${crypto.symbol!.toUpperCase()}",
//             style: const TextStyle(
//               fontSize: 16,
//               color: AppColors.grey,
//               fontWeight: FontWeight.w500,
//             ),
//             textAlign: TextAlign.center,
//           ),  const SizedBox(height: 20), Text(
//             "Price Per USD",
//             style: const TextStyle(
//               fontSize: 22,
//               fontWeight: FontWeight.bold,
//               color: AppColors.textLight,
//             ),
//             textAlign: TextAlign.center,
//           ),

         
//           Text(
//             '\$${crypto.tickers![2].convertedLast!.usd!}',
//             style: const TextStyle(
//               fontSize: 36,
//               fontWeight: FontWeight.bold,
//               color: AppColors.textLight,
//             ),
//             textAlign: TextAlign.center,
//           ),
//           const SizedBox(height: 12),
        
//         ],
//       ),