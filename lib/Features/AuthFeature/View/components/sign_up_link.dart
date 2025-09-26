import 'package:bitpulse/core/Themes/colors.dart';
import 'package:flutter/material.dart';

class SwichLink extends StatelessWidget {
  const SwichLink({super.key, required this.title, required this.action,required this.onPressed});
 final void Function()? onPressed;
  final String title;
  final String action;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(title, style: TextStyle(fontSize: 14, color: Colors.grey)),
          TextButton(
            onPressed: onPressed,
            style: TextButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 4),
            ),
            child: Text(
              action,
              style: TextStyle(
                fontSize: 14,
                color: AppColors.primary,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
