import 'package:bitpulse/Features/AuthFeature/Cubit/auth_cubit.dart';
import 'package:bitpulse/Features/AuthFeature/Cubit/auth_state.dart';
import 'package:bitpulse/Features/HomeFeature/Presentation/View/components/settingsComponents/logout_dialog.dart';
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
              isLoading ? 'Logging out...' : 'Logout',
              style: const TextStyle(color: Colors.red),
            ),
            subtitle: const Text('Sign out of your account'),
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
