import 'package:bitpulse/core/extension/theme_extension.dart';
import 'package:flutter/material.dart';

class CustomMoreWidget extends StatelessWidget {
  const CustomMoreWidget({
    super.key, required this.text, this.onTap,
  });
final String text;
final GestureTapCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text,
          style: TextStyle(
            color: context.textColor,
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
        GestureDetector(
          //show toast when tapped
          onTap: onTap ?? () {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('More $text'),
                duration: const Duration(seconds: 2),
              ),
            );
          },
   
          child: Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(
              Icons.arrow_forward_ios,
              size: 16,
              color: Theme.of(context).primaryColor,
            ),
          ),
        ),
      ],
    );
  }
}
