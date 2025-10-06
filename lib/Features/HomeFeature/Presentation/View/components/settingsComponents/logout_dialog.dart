import 'package:bitpulse/Features/AuthFeature/Cubit/auth_cubit.dart';
import 'package:bitpulse/core/l10n/generated/l10n.dart';
import 'package:bitpulse/core/utils/star_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LogoutDialog extends StatelessWidget {
  const LogoutDialog({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title:  Text(AppLocalizations.of(context).logout),
      content:  Text(AppLocalizations.of(context).are_you_sure_you_want_to_logout),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child:  Text(AppLocalizations.of(context).cancel),
        ),
        TextButton(
          onPressed: () async {
            Navigator.of(context).pop();
            
            // Clear user-specific data but keep app settings
            await StarService.clearAllStars();
            
            // Sign out
            context.read<AuthCubit>().signOut();
          },
          child:  Text(
            AppLocalizations.of(context).logout,
            style: TextStyle(color: Colors.red),
          ),
        ),
      ],
    );
  }
}
