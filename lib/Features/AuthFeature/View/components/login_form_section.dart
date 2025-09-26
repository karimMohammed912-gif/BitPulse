import 'package:bitpulse/Features/AuthFeature/Cubit/auth_cubit.dart';
import 'package:bitpulse/Features/AuthFeature/Cubit/auth_state.dart';
import 'package:bitpulse/Features/AuthFeature/View/components/login_button.dart';
import 'package:bitpulse/Features/AuthFeature/View/components/sign_up_link.dart';
import 'package:bitpulse/core/widgets/custom_text_filed.dart';
import 'package:bitpulse/core/widgets/custom_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class LoginFormSection extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final bool obscurePassword;
  final bool rememberMe;
  final VoidCallback onTogglePasswordVisibility;
  final ValueChanged<bool?> onToggleRememberMe;
  final VoidCallback onSignIn;
  final String title;
  final bool isLogin;
  final String swichLinkTitle;
  final String switchLinkAction;
  final VoidCallback onPressed;
  final TextEditingController userController;

  const LoginFormSection({
    super.key,
    this.isLogin = true,
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
          buildSuccesMessage(context, "Logged in successfully");
          context.go('/Home'); // Fixed navigation
        }
      },
      child: Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w600,
                color: Colors.black87,
              ),
            ),

            const SizedBox(height: 24),



            // Email Field
            CustomTextField(
              label: 'Email Address',
              hintText: 'Enter your email',
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,
              prefixIcon: Icons.email_outlined,
              validator: _validateEmail,
            ),

            const SizedBox(height: 20),

            // Password Field
            CustomTextField(
              label: 'Password',
              hintText: 'Enter your password',
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

            const SizedBox(height: 32),

            // Sign In/Up Button
            BlocBuilder<AuthCubit, AuthState>(
              builder: (context, state) {
                return CustomButton(
                  onPressed: onSignIn,
                  isLoading: state is AuthLoading,
                );
              },
            ),

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
