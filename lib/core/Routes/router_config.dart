//generate a GoRouter configuration for the app
import 'package:bitpulse/Features/AuthFeature/Cubit/auth_cubit.dart';
import 'package:bitpulse/Features/AuthFeature/Cubit/auth_state.dart';
import 'package:bitpulse/Features/AuthFeature/View/login_view.dart';
import 'package:bitpulse/Features/AuthFeature/View/signUp_view.dart';
import 'package:bitpulse/Features/DetailsFeature/Presentation/View/crypto_details_view.dart';
import 'package:bitpulse/Features/DetailsFeature/Presentation/Cubit/details_cubit.dart';

import 'package:bitpulse/Features/HomeFeature/Presentation/View/cubit/home_cubit_cubit.dart';
import 'package:bitpulse/Features/HomeFeature/Presentation/View/cubit/market_cap_data_cubit.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:bitpulse/Features/HomeFeature/Presentation/View/home_view.dart';

// Define route names as static constants
class AppRoutes {
  static const String homePath = '/Home';
  static const String splashPath = '/splash';
  static const String onboardingPath = '/onboarding';
  static const String loginPath = '/';
  static const String signUpPath = '/signUp';
  static const String profilePath = '/profile';
  static const String portfolioPath = '/portfolio';
  static const String cryptoDetailPath = '/crypto-detail';
  static const String watchlistPath = '/watchlist';
  static const String settingsPath = '/settings';
  static const String transactionsPath = '/transactions';
  static const String newsPath = '/news';
  static const String newsDetailPath = '/news-detail';

  // Route names as static variables
  static const String splashName = 'splash';
  static const String onboardingName = 'onboarding';
  static const String loginName = 'login';
  static const String signUpName = 'signUp';
  static const String homeName = 'home';
  static const String portfolioName = 'portfolio';
  static const String watchlistName = 'watchlist';
  static const String cryptoDetailName = 'cryptoDetail';
  static const String newsName = 'news';
  static const String newsDetailName = 'newsDetail';
  static const String transactionsName = 'transactions';
  static const String profileName = 'profile';
  static const String settingsName = 'settings';
}

// GoRouter configuration
final GoRouter appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: AppRoutes.loginPath,
      name: AppRoutes.loginName,
      builder: (context, state) => const LoginView(),
    ),
    GoRoute(
      path: AppRoutes.signUpPath,
      name: AppRoutes.signUpName,
      builder: (context, state) => const SignUpView(),
    ),
    GoRoute(
      path: AppRoutes.homePath,
      name: AppRoutes.homeName,
      builder:
         // Use BlocProvider to provide HomeCubit and MarketCapDataCubit
          (context, state) => MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => HomeCubit(),
              ),
              BlocProvider(
                create: (context) => MarketCapDataCubitCubit()..loadMarketCapPercentage(),
              ),
            ],
            child: const HomePage(),
          ),
    ),
    GoRoute(
      path: AppRoutes.splashPath,
      name: AppRoutes.splashName,
      builder: (context, state) => const Scaffold(
        body: Center(child: Text('Splash Screen - Coming Soon')),
      ),
    ),

    GoRoute(
      path: AppRoutes.onboardingPath,
      name: AppRoutes.onboardingName,
      builder: (context, state) => const Scaffold(
        body: Center(child: Text('Onboarding Screen - Coming Soon')),
      ),
    ),
    GoRoute(
      path: AppRoutes.portfolioPath,
      name: AppRoutes.portfolioName,
      builder: (context, state) => const Scaffold(
        body: Center(child: Text('Portfolio Screen - Coming Soon')),
      ),
    ),
    GoRoute(
      path: AppRoutes.watchlistPath,
      name: AppRoutes.watchlistName,
      builder: (context, state) => const Scaffold(
        body: Center(child: Text('Watchlist Screen - Coming Soon')),
      ),
    ),
    GoRoute(
      path: AppRoutes.cryptoDetailPath,
      name: AppRoutes.cryptoDetailName,
      builder: (context, state) {
        return BlocProvider(
          create: (context) => DetailsCubit(),
          child: CryptoDetailsView(cryptoId: state.extra as String? ?? 'usdt'),
        );
      },
    ),
    GoRoute(
      path: AppRoutes.newsPath,
      name: AppRoutes.newsName,
      builder: (context, state) => const Scaffold(
        body: Center(child: Text('News Screen - Coming Soon')),
      ),
    ),
    GoRoute(
      path: '${AppRoutes.newsDetailPath}/:newsId',
      name: AppRoutes.newsDetailName,
      builder: (context, state) {
        final newsId = state.pathParameters['newsId'];
        return Scaffold(
          appBar: AppBar(title: const Text('News Article')),
          body: Center(child: Text('News Article $newsId - Coming Soon')),
        );
      },
    ),
    GoRoute(
      path: AppRoutes.transactionsPath,
      name: AppRoutes.transactionsName,
      builder: (context, state) => const Scaffold(
        body: Center(child: Text('Transactions Screen - Coming Soon')),
      ),
    ),
    GoRoute(
      path: AppRoutes.profilePath,
      name: AppRoutes.profileName,
      builder: (context, state) => const Scaffold(
        body: Center(child: Text('Profile Screen - Coming Soon')),
      ),
    ),
    GoRoute(
      path: AppRoutes.settingsPath,
      name: AppRoutes.settingsName,
      builder: (context, state) => const Scaffold(
        body: Center(child: Text('Settings Screen - Coming Soon')),
      ),
    ),
  ],

  // Error handling
  errorBuilder: (context, state) => Scaffold(
    body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.error_outline, size: 48, color: Colors.red),
          const SizedBox(height: 16),
          Text(" Error: ${state.error}", style: const TextStyle(fontSize: 18)),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () => context.goNamed(AppRoutes.homeName),
            child: const Text('Go Home'),
          ),
        ],
      ),
    ),
  ),

  // Add auth-based redirect logic
  redirect: (context, state) {
    final authCubit = context.read<AuthCubit>();
    final authState = authCubit.state;

    final isGoingToAuth =
        state.matchedLocation == '/' || state.matchedLocation == '/signUp';
    final isLoggedIn = authState is AuthAuthenticated;

    // If not logged in and not going to auth pages, redirect to login
    if (!isLoggedIn && !isGoingToAuth) {
      return '/';
    }

    // If logged in and going to auth pages, redirect to home
    if (isLoggedIn && isGoingToAuth) {
      return '/Home';
    }

    return null; // No redirect needed
  },
);