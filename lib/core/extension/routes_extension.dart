import 'package:bitpulse/core/Routes/router_config.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

extension AppRouterExtension on BuildContext {
  void goToHome() => goNamed(AppRoutes.homeName);
  void goToLogin() => goNamed(AppRoutes.loginName);
  void goTosignUp() => goNamed(AppRoutes.signUpName);
  void goToProfile() => goNamed(AppRoutes.profileName);
  void goToPortfolio() => goNamed(AppRoutes.portfolioName);
  void goToWatchlist() => goNamed(AppRoutes.watchlistName);
  void goToSettings() => goNamed(AppRoutes.settingsName);
  void goToTransactions() => goNamed(AppRoutes.transactionsName);
  void goToNews() => goNamed(AppRoutes.newsName);
  void goToSplash() => goNamed(AppRoutes.splashName);
  void goToOnboarding() => goNamed(AppRoutes.onboardingName);

  void goToCryptoDetail(String crypto) =>
      goNamed(AppRoutes.cryptoDetailName, extra: crypto);

  void goToNewsDetail(String newsId) =>
      goNamed(AppRoutes.newsDetailName, pathParameters: {'newsId': newsId});
}