import 'package:bitpulse/Features/AuthFeature/Cubit/auth_cubit.dart';
import 'package:bitpulse/Features/AuthFeature/View/components/login_form_section.dart';
import 'package:bitpulse/Features/AuthFeature/View/components/login_welcome_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
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

  void _handleSignUp() {
    if (_formKey.currentState!.validate()) {
      context.read<AuthCubit>().signUp(
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
                userController: _userController,
                isLogin: false, // This shows the username field
                formKey: _formKey,
                emailController: _emailController,
                passwordController: _passwordController,
                obscurePassword: _obscurePassword,
                rememberMe: _rememberMe,
                onTogglePasswordVisibility: _togglePasswordVisibility,
                onToggleRememberMe: _toggleRememberMe,
                onSignIn: _handleSignUp, // Sign up instead of sign in
                title: 'Sign Up',
                swichLinkTitle: "Already have an account?",
                switchLinkAction: "Sign In",
                onPressed: () {
                  context.go('/');
                },
              ),

   

              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}
