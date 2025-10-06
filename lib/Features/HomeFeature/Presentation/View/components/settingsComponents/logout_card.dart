import 'package:bitpulse/Features/AuthFeature/Cubit/auth_cubit.dart';
import 'package:bitpulse/Features/AuthFeature/Cubit/auth_state.dart';
import 'package:bitpulse/Features/HomeFeature/Presentation/View/components/settingsComponents/logout_dialog.dart';
import 'package:bitpulse/core/l10n/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LogoutCard extends StatelessWidget {
  const LogoutCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: BlocBuilder<AuthCubit, AuthState>(
        builder: (context, state) {
          final isLoading = state is AuthLoading;

          return ListTile(
            leading: isLoading
                ? const SizedBox(
                    width: 24,
                    height: 24,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  )
                : const Icon(Icons.logout, color: Colors.red),
            title: Text(
              isLoading ? AppLocalizations.of(context).Logging_out : AppLocalizations.of(context).logout,
              style: const TextStyle(color: Colors.red),
            ),
            subtitle:  Text(AppLocalizations.of(context).Sign_Out_of_Your_Account),
            onTap: isLoading
                ? null
                : () => showDialog(
                    context: context,
                    builder: (BuildContext dialogContext) {
                      return LogoutDialog();
                    },
                  ),
          );
        },
      ),
    );
  }
}
