import 'package:bitpulse/Features/AuthFeature/Cubit/auth_cubit.dart';
import 'package:bitpulse/Features/AuthFeature/View/components/login_form_section.dart';
import 'package:bitpulse/Features/AuthFeature/View/components/login_welcome_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _userController = TextEditingController();
  bool _obscurePassword = true;
  bool _rememberMe = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _userController.dispose();
    super.dispose();
  }

  void _togglePasswordVisibility() {
    setState(() {
      _obscurePassword = !_obscurePassword;
    });
  }

  void _toggleRememberMe(bool? value) {
    setState(() {
      _rememberMe = value ?? false;
    });
  }

  void _handleSignIn() {
    if (_formKey.currentState!.validate()) {
      context.read<AuthCubit>().signIn(
        email: _emailController.text.trim(),
        password: _passwordController.text,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 40),
              // Welcome Section
              const LoginWelcomeSection(),
              const SizedBox(height: 20),

              // Form Section
              LoginFormSection(
                formKey: _formKey,
                emailController: _emailController,
                passwordController: _passwordController,
                obscurePassword: _obscurePassword,
                rememberMe: _rememberMe,
                onTogglePasswordVisibility: _togglePasswordVisibility,
                onToggleRememberMe: _toggleRememberMe,
                onSignIn: _handleSignIn,
                title: 'Sign In',
                isLogin: true,
                swichLinkTitle: "Don't Have An Account?",
                switchLinkAction: "Sign Up",
                onPressed: () {
                  context.go('/signUp');
                },
                userController: _userController,
              ),

              const SizedBox(height: 20),

              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}
