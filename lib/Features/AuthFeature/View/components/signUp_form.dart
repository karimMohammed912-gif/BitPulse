import 'package:bitpulse/Features/AuthFeature/Cubit/auth_cubit.dart';
import 'package:bitpulse/Features/AuthFeature/Cubit/auth_state.dart';
import 'package:bitpulse/Features/AuthFeature/View/components/login_button.dart';
import 'package:bitpulse/Features/AuthFeature/View/components/sign_up_link.dart';

import 'package:bitpulse/core/extension/routes_extension.dart';
import 'package:bitpulse/core/l10n/generated/l10n.dart';
import 'package:bitpulse/core/widgets/custom_text_filed.dart';
import 'package:bitpulse/core/widgets/custom_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpFormSection extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final bool obscurePassword;
  final bool rememberMe;
  final VoidCallback onTogglePasswordVisibility;
  final ValueChanged<bool?> onToggleRememberMe;
  final VoidCallback onSignIn;
  final String title;
  final bool isLoading;
  final String swichLinkTitle;
  final String switchLinkAction;
  final VoidCallback onPressed;
  final TextEditingController userController;

  const SignUpFormSection({
    super.key,
    this.isLoading = true,
    required this.formKey,
    required this.emailController,
    required this.passwordController,
    required this.obscurePassword,
    required this.rememberMe,
    required this.onTogglePasswordVisibility,
    required this.onToggleRememberMe,
    required this.onSignIn,
    required this.title,
    required this.swichLinkTitle,
    required this.switchLinkAction,
    required this.onPressed,
    required this.userController,
  });

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        
        if (state is AuthError) {
         buildErrorMessage(context, state.message);
        } else if (state is AuthAuthenticated) {
          buildSuccesMessage(context, "Signed up successfully");
          context.goToHome();
        }
      
      },
      child: Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w600,
                color: Colors.black87,
              ),
            ),

            const SizedBox(height: 24),

            // Email Field
           CustomTextField(
                    label: AppLocalizations.of(context).username,
                    hintText: AppLocalizations.of(context).enterYourUsername,
                    controller: userController,
                    keyboardType: TextInputType.name,
                    textInputAction: TextInputAction.next,
                    prefixIcon: Icons.supervised_user_circle_outlined,
                    validator: _validateUserName,
                  ),
            const SizedBox(height: 24),

            // Email Field
            CustomTextField(
              label: AppLocalizations.of(context).email,
              hintText: AppLocalizations.of(context).enterYourEmail,
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,
              prefixIcon: Icons.email_outlined,
              validator: _validateEmail,
            ),

            const SizedBox(height: 20),

            // Password Field
            CustomTextField(
              label: AppLocalizations.of(context).password,
              hintText: AppLocalizations.of(context).enterYourPassword,
              controller: passwordController,
              obscureText: obscurePassword,
              textInputAction: TextInputAction.done,
              prefixIcon: Icons.lock_outline,
              suffixIcon: obscurePassword
                  ? Icons.visibility_off
                  : Icons.visibility,
              onSuffixIconPressed: onTogglePasswordVisibility,
              validator: _validatePassword,
            ),

            // // Remember Me & Forgot Password
            // RememberMeRow(
            //   rememberMe: rememberMe,
            //   onToggleRememberMe: onToggleRememberMe, isLogin: isLogin,
            // ),
            const SizedBox(height: 32),

            // Sign In Button
            CustomButton(onPressed: onSignIn, isLoading:isLoading),

            const SizedBox(height: 24),

            // Sign Up Link
            SwichLink(
              title: swichLinkTitle,
              action: switchLinkAction,
              onPressed: onPressed,
            ),
          ],
        ),
      ),
    );
  }

  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email';
    }
    if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
      return 'Please enter a valid email';
    }
    return null;
  }

  String? _validateUserName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please  enter your username';

      //
    }
    if (!RegExp(r'^[A-Za-z][A-Za-z0-9_]{7,29}$').hasMatch(value)) {
      return 'enter your username';
    }
    return null;
  }

  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your password';
    }
    if (value.length < 6) {
      return 'Password must be at least 6 characters';
    }
    return null;
  }
}
