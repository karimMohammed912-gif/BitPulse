import 'package:bitpulse/core/Themes/colors.dart';
import 'package:flutter/material.dart';

class LoadingScrollWidget extends StatelessWidget {
  const LoadingScrollWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 20,
                height: 20,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  valueColor: AlwaysStoppedAnimation<Color>(
                    AppColors.primary,
                  ),
                ),
              ),
              SizedBox(width: 12),
              Text(
                'Loading more...',
                style: TextStyle(color: AppColors.grey, fontSize: 14),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
