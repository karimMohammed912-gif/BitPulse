import 'package:bitpulse/core/Themes/colors.dart';
import 'package:flutter/material.dart';

class LoginTermsSection extends StatelessWidget {
  const LoginTermsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          'By continuing, you agree to our',
          style: TextStyle(fontSize: 14, color: Colors.grey),
        ),
        const SizedBox(height: 8),
        Wrap(
          alignment: WrapAlignment.center,
          children: [
            TextButton(
              onPressed: () {
                // Navigate to terms
              },
              style: TextButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 4),
                minimumSize: Size.zero,
              ),
              child: Text(
                'Terms of Service',
                style: TextStyle(
                  fontSize: 14,
                  color: AppColors.primary,
                  fontWeight: FontWeight.w500,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
            const Text(
              ' and ',
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
            TextButton(
              onPressed: () {
                // Navigate to privacy policy
              },
              style: TextButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 4),
                minimumSize: Size.zero,
              ),
              child: Text(
                'Privacy Policy',
                style: TextStyle(
                  fontSize: 14,
                  color: AppColors.primary,
                  fontWeight: FontWeight.w500,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}