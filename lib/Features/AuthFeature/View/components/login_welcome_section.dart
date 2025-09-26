import 'package:bitpulse/core/Themes/colors.dart';
import 'package:flutter/material.dart';

class LoginWelcomeSection extends StatelessWidget {
  const LoginWelcomeSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 20),
        const Text(
          'Welcome Back!',
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
            height: 1.2,
          ),
        ),
        const SizedBox(height: 8),
        const Text(
          'Sign in to continue your crypto journey',
          style: TextStyle(
            fontSize: 16,
            color: Colors.grey,
            height: 1.4,
          ),
        ),
        const SizedBox(height: 12),
        Container(
          height: 4,
          width: 100,
          decoration: BoxDecoration(
            color: AppColors.primary,
            borderRadius: BorderRadius.circular(2),
          ),
        ),
      ],
    );
  }
}