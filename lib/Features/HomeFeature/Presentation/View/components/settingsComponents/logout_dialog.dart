import 'package:bitpulse/Features/AuthFeature/Cubit/auth_cubit.dart';
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
      title: const Text('Logout'),
      content: const Text('Are you sure you want to logout?'),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: () async {
            Navigator.of(context).pop();
            
            // Clear user-specific data but keep app settings
            await StarService.clearAllStars();
            
            // Sign out
            context.read<AuthCubit>().signOut();
          },
          child: const Text(
            'Logout',
            style: TextStyle(color: Colors.red),
          ),
        ),
      ],
    );
  }
}
