import 'package:bitpulse/core/Themes/colors.dart';
import 'package:bitpulse/core/l10n/generated/l10n.dart';
import 'package:flutter/material.dart';

class RememberMeRow extends StatelessWidget {
  final bool isLogin;
  final bool rememberMe;
  final ValueChanged<bool?> onToggleRememberMe;

  const RememberMeRow({
    super.key,
    required this.rememberMe,
    required this.onToggleRememberMe, required this.isLogin,
  });

  @override
  Widget build(BuildContext context) {
    return isLogin?  Row(
      children: [
        Row(
          children: [
            SizedBox(
              height: 24,
              width: 24,
              child: Checkbox(
                value: rememberMe,
                onChanged: onToggleRememberMe,
                activeColor: AppColors.primary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4),
                ),
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
            ),
            const SizedBox(width: 8),
             Text(
             AppLocalizations.of(context).rememberMe,
              style: TextStyle(fontSize: 14, color: Colors.black87),
            ),
          ],
        ),
        const Spacer(),
        TextButton(
          onPressed: () {
            // Handle forgot password
          },
          style: TextButton.styleFrom(padding: EdgeInsets.zero),
          child: Text(
            'Forgot Password?',
            style: TextStyle(
              fontSize: 14,
              color: AppColors.primary,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    ): SizedBox();
  }
}