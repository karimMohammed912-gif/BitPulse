import 'package:bitpulse/core/Themes/colors.dart';
import 'package:bitpulse/core/l10n/generated/l10n.dart';
import 'package:flutter/material.dart';

class FaildWidget extends StatelessWidget {
  const FaildWidget({super.key, this.onPressed, this.reloadFunction, required this.errorMessage, required this.onRefresh});
  final VoidCallback? onPressed;
  final VoidCallback?  reloadFunction;
  final String errorMessage ;
  final Future<void> Function() onRefresh;
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: onRefresh,
      child: Center(
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 0.8,
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child:  Center(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.error_outline,
                    size: 64,
                    color: Colors.red[400],
                  ),
                  const SizedBox(height: 16),
                  Text(
                    AppLocalizations.of(context).Something_went_wrong,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,

                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    errorMessage,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[600],
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton.icon(
                        onPressed:reloadFunction,
                        icon: const Icon(Icons.refresh),
                        label: const Text('Retry'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primary,
                          foregroundColor: AppColors.textDark,
                        ),
                      ),
                      const SizedBox(width: 16),

                       if (onPressed != null )
                      OutlinedButton.icon(
                        onPressed: onPressed,
                          icon: const Icon(Icons.home),
                        label: const Text('Go Back'),
                        style: OutlinedButton.styleFrom(
                          foregroundColor: AppColors.primary,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )
          
          ),
        ),
      ),
    );
  }
}