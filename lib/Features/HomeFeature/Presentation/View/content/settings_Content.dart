import 'package:bitpulse/Features/AuthFeature/Cubit/auth_cubit.dart';
import 'package:bitpulse/Features/AuthFeature/Cubit/auth_state.dart';
import 'package:bitpulse/Features/HomeFeature/Presentation/View/components/Home_Components/theme_selector.dart';
import 'package:bitpulse/Features/HomeFeature/Presentation/View/components/settingsComponents/data_mangment_card.dart';
import 'package:bitpulse/Features/HomeFeature/Presentation/View/components/settingsComponents/logout_card.dart';
import 'package:bitpulse/Features/HomeFeature/Presentation/View/components/settingsComponents/profile_card.dart';
import 'package:bitpulse/Features/HomeFeature/Presentation/View/components/settingsComponents/settings_section.dart';

import 'package:bitpulse/core/extension/routes_extension.dart';
import 'package:bitpulse/core/widgets/custom_toast.dart';
import 'package:flutter/material.dart' hide AboutDialog;
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingsContent extends StatelessWidget {
  const SettingsContent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthUnauthenticated) {
          context.goToLogin();
        } else if (state is AuthError) {
          buildErrorMessage(context, state.message);
        }
      },
      child: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // User Profile Section
          ProfileCard(),

          const SizedBox(height: 20),

          // Theme Selector Section
          const ThemeSelectorWidget(),

          const SizedBox(height: 20),

          // App Settings Section
          SettingsSection(),

          const SizedBox(height: 20),

          // Data Management Section
          DataMangmentCard(),

          const SizedBox(height: 20),

          // Logout Button
          LogoutCard(),
        ],
      ),
    );
  }
}
